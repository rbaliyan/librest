#include <stdio.h>
#include <curl/curl.h>
#include <strings.h>
#include <limits.h>
#include "rest.h"
#include "json.h"
#define MODULE "REST"
#include "trace.h"

/*
#if LIB_AUTH_BUILD == _DEV_
#define LIB_AUTH_URL "https://dev.api.crunchgallery.com"
#elif LIB_AUTH_BUILD == _QA_
#define LIB_AUTH_URL "https://qa.api.crunchgallery.com"
#elif LIB_AUTH_BUILD == _PROD_
#define LIB_AUTH_URL "https://api.crunchgallery.com"
#endif
*/

#ifndef inRange
#define inRange(a,x,y)  (((a)>=(x)) && ((a) <= (y))) 
#endif

#define CURL_ERR_LAST (CURL_LAST)

#define REST_ERR_BEGIN_VAL (0)
#define JSON_ERR_BEGIN_VAL (REST_ERR_BEGIN_VAL + REST_ERR_LAST + 1)
#define CURL_ERR_BEGIN_VAL (JSON_ERR_BEGIN_VAL + JSON_ERR_LAST + 1)


#define CurlErr(x)    (-(CURL_ERR_BEGIN_VAL + (x)))
#define JsonErr(x)    (-(JSON_ERR_BEGIN_VAL + (-(x))))
#define RestErr(x)    (-(REST_ERR_BEGIN_VAL + (x)))

#define RealCurlErr(x)  (((-(x))- CURL_ERR_BEGIN_VAL))
#define RealJsonErr(x)  (-((-(x))- JSON_ERR_BEGIN_VAL))
#define RealRestErr(x)  (-((-(x))- REST_ERR_BEGIN_VAL))

#define isJsonErr(x)   (inRange((-x), JSON_ERR_BEGIN_VAL, JSON_ERR_LAST))
#define isCurlErr(x)   (inRange((-x), CURL_ERR_BEGIN_VAL, CURL_ERR_LAST))
#define isRestErr(x)   (inRange((-x), REST_ERR_BEGIN_VAL, REST_ERR_LAST))

#define RestIsSuccess(x)    ((-(x)) == REST_ERR_SUCCESS)
#define RestIsError(x)    !RestIsSuccess(x)
#define CurlIsSuccess(x)    ((-(x)) == CURLE_OK)
#define CurlIsError(x)    !RestIsSuccess(x)

enum REST_DATA_FLAGS {
    DATA_TYPE_JSON  = 0x01,
    DATA_TYPE_TEXT  = 0x02,
    DATA_TYPE_HTML  = 0x04,
    DATA_PERM_READ  = 0x08,
    DATA_PERM_WRITE = 0x10,
    DATA_DYNAMIC    = 0x20,
};

#define DATA_TYPE_NULL (~(DATA_TYPE_JSON | DATA_TYPE_TEXT | DATA_TYPE_HTML))
#define MIN2(a,b)      ((a) < (b) ? (a) : (b))
#define MIN3(a,b,c)    ((a) < (b) ? MIN2((a),(c) : MIN2((b),(c))))
#define HTTP_BUFER_SIZE (10*1024)

static int g_instace_count = 0;

/* Buffer for HTTP Operations */
struct buffer
{
    size_t size;                    /* Buffer Size */
    size_t len;                     /* Data length in buffer */
    size_t index;                   /* Read Index */
    unsigned int flags;             /* Flags */
    struct buffer *next;            /* Next Data */
    struct buffer *prev;            /* Prev Data */
    char *data;                     /* Data Ptr */
    char payload[0];                /* Actual data */
};

/*HTTP Buffer List*/
struct http_data
{
    unsigned int count;             /* Buffer counts*/
    unsigned int flags;             /* Flags for data */
    const char* name;               /* Name of Buffer*/
    struct buffer* start;           /* Start of list */
    struct buffer* end;             /* End of list */
    struct buffer* current;         /* Current Pointer for Read Operations */
};

/* Rest Handle */
struct rest_handle
{
    CURL *curl;                     /* Curl handle */
    int options;                    /* options */
    int state;                      /* state of handle */
    struct http_data read_buffer; /* Read HTTP Buffer */
    struct http_data write_buffer;/* Write HTTP Buffer */
};

/* Function Declarations */
static struct buffer* buffer_new(struct buffer* prev, unsigned int flags, const char *data, size_t size);
static void buffer_del(struct buffer *buffer);
static void http_data_init(struct http_data *http_data, int flags, struct buffer *buffer);
static void http_data_del(struct http_data* buffer);
static int http_data_len(struct http_data *http_data);
static char* http_data_get(struct http_data *http_data, int *length);
static int http_data_write(struct http_data *http_data, const char* data, size_t datalen);
static int http_data_read(struct http_data *http_data, char* data, size_t datalen);
static size_t curl_easy_write(char *bufptr, size_t size, size_t nitem, void *userp);
static size_t curl_easy_read(char *bufptr, size_t size, size_t nitem, void *userp);
static int http_method(struct rest_handle *handle, const char *url, int curl_method);


static struct buffer* buffer_new(struct buffer* prev, unsigned int flags, const char* data, size_t size)
{
    struct buffer *new_buf = NULL;
    size_t buff_size = sizeof(struct buffer);

    if(size == 0){
        /* Default size*/
        size = HTTP_BUFER_SIZE;
    }
    
    /* If Data is not given then also allocate payload size */
    if(!data){
        /* Payload size needs ot be allocated*/
         buff_size += size;
    }

    /* Allocate new buffer */
    if((new_buf = malloc(buff_size))){

        new_buf->size = size;
        new_buf->flags = flags;
        new_buf->index = 0;
        new_buf->next = NULL;
        new_buf->prev = prev;

        /* Data */
        if(data){
            new_buf->data = (char*)data;
            new_buf->len = size;
        } else {
            new_buf->data = new_buf->payload;
            new_buf->len = 0;
        }
    } else {
        TRACE(ERROR, "Memory allocation failed");
    }

    if(prev){
        prev->next = new_buf;
    }

    return new_buf;
}

static void buffer_del(struct buffer *buffer)
{
    if(buffer){
        if((buffer->flags & DATA_DYNAMIC) && (buffer->data != buffer->payload)){
            TRACE(DEBUG, "Found a dynamic buffer with http buffer");
            free(buffer->data);
        }
        free(buffer);
    }
}

static void http_data_del(struct http_data *http_data)
{
    struct buffer *temp = NULL;
    struct buffer *buffer = NULL;
    if(http_data){
        for(buffer = http_data->start ;buffer; buffer = temp){
            temp = buffer->next;
            buffer_del(buffer);
        } 
        http_data->start = http_data->end = NULL;
    } else {
        TRACE(WARN, "NULL http_data");
    }
}

static void http_data_init(struct http_data *http_data, int flags, struct buffer *buffer)
{
    if(http_data){
        http_data_del(http_data);
        http_data->current = NULL;
        http_data->flags = flags;
        if(buffer){
            http_data->start = buffer;
        }
    } else {
        TRACE(WARN, "NULL http_data");
    }
}

static int http_data_len(struct http_data *http_data)
{
    int len = -1;
    struct buffer *buffer = NULL;
    if(http_data){
        len = 0;
        buffer = http_data->current ? http_data->current : http_data->start;
        for(; buffer; buffer = buffer->next){
            len += buffer->len - buffer->index;
        }
    } else {
        TRACE(WARN, "NULL http_data");
    }
    return len;
}

static char* http_data_get(struct http_data *http_data, int *length)
{
    char* data = NULL;
    size_t len, l;
    
    if(http_data){
        if((len = http_data_len(http_data)) > 0){
            data = malloc(sizeof(char) * len);
            if(data){
                if((l=http_data_read(http_data, data, len)) == len ){
                    if(length) *length = len;
                    return data;
                } else {
                    TRACE(WARN, "Failed to read all %lu bytes, read : %lu bytes", len, l);
                    free(data);
                    data = NULL;
                }
            } else {
                TRACE(ERROR, "Failed to allocate, memory");
            }
        }
    } else {
        TRACE(WARN, "NULL http_data");
    }

    return data;
}

static int http_data_write(struct http_data *http_data, const char* data, size_t datalen)
{
    struct buffer* buffer = NULL;
    int copylen = 0;
    int len = 0;
    int err;
    /* Validate data */
    if(http_data && data && (datalen > 0)){
        /* Last Buffer in http_data */
        buffer = http_data->end;

        /* Check if http_data is empty or completed filled*/
        if(!buffer || (buffer->len >= buffer->size )){

            /* Allocate a new HTTP Buffer */
            buffer = buffer_new(buffer, http_data->flags, NULL, 0);

            /* Set Start and End of http_data*/
            if(!http_data->end)
                http_data->start = http_data->end = buffer;
        }

        /* Check for NULL node */
        if(buffer){
            /* Remaining space in buffer*/
            copylen =  buffer->size - buffer->len;
            copylen = MIN2(datalen, copylen);

            /* copy data and update pointers */
            memcpy(&buffer->data[buffer->len], data, copylen);
            buffer->len += copylen;
            err = copylen;
            TRACE(DEBUG,"Written %d bytes", copylen);

            /* Check if all data copied */
            if(copylen != datalen){
                TRACE(DEBUG,"Remaining %d bytes",datalen - copylen);
                /* Still some data left, call recursively*/
                 len = http_data_write(http_data, &data[copylen], datalen - copylen);
                 if( len < 0 ){
                     TRACE(ERROR, "Failed to read buffer error :%d", len);
                     err = len;
                 } else {
                     err += len;
                 }
            }
        } else {
            /* Memory allocation failure */
            TRACE(ERROR, "Failed to allocate a new HTTP buffer");
            err = RestErr(REST_ERR_NO_MEM);
        }
    } else {
        TRACE(ERROR, "NULL http_data");
        err = RestErr(REST_ERR_ARGS);
    }
    return err;
}

static int http_data_read(struct http_data *http_data, char* data, size_t datalen)
{
    struct buffer* buffer = NULL;
    int err;
    int len;
    int copylen = 0;

    if(http_data && data && (datalen > 0)){
        buffer = http_data->current;
        /* Move current to Start of http_data*/
        if(( buffer == NULL) || (buffer->index >= buffer->len)){
            http_data->current = buffer ? buffer->next : http_data->start;
            buffer = http_data->current;
            if(buffer)
                buffer->index = 0;
        }

        /* Check for NULL node */
        if(buffer){
            /* Remaining space in buffer*/
            copylen =  buffer->len - buffer->index;
            copylen = MIN2(datalen, copylen);

            /* copy data and update pointers */
            memcpy(data, &buffer->data[buffer->index], copylen);
            buffer->index += copylen;
            err = copylen;
            TRACE(DEBUG,"Read %d bytes", copylen);
            /* Check if all data copied */
            if((copylen != datalen) &&(buffer->index >= buffer->len )){
                TRACE(DEBUG,"Remaining %d bytes",datalen - copylen);
                /* Still some data left, call recursively*/
                 len = http_data_read(http_data, &data[copylen], datalen - copylen);
                 if( len < 0 ){
                     TRACE(ERROR, "Failed to read buffer");
                     err = len;
                 } else {
                     err += len;
                 }
            }
        } else {
            /* Nothing to read */
            TRACE(DEBUG,"Nothing to read");
            err = 0;
        }
    } else {
        TRACE(ERROR,"NULL http_data");
        err = RestErr(REST_ERR_ARGS);
    }

    return err;
}


static size_t curl_easy_write(char *bufptr, size_t size, size_t nitem, void *userp)
{
    struct rest_handle *handle = (struct rest_handle*)userp;

    /* Write data */
    return http_data_write(&handle->write_buffer, (const char*)bufptr, size * nitem);
}

static size_t curl_easy_read(char *bufptr, size_t size, size_t nitem, void *userp)
{
    struct rest_handle *handle = (struct rest_handle*)userp;

    /* Read data */
    return http_data_read(&handle->read_buffer, bufptr, size * nitem);
}

static int curl_parse_data_type(char * content_type, struct http_data *http_data)
{
    int err = 0;
    TRACE(DEBUG, "Content-Type:%s", content_type);
    if( content_type && http_data ){
        /* Check Data Type */
        if(strncmp(content_type, "application/json",16) == 0){
            /* Json Data*/
            http_data->flags |= DATA_TYPE_JSON;
            err = 1;
        } else if(strncmp(content_type, "text/text", 9) == 0){
            /* Text Data */ 
            http_data->flags |= DATA_TYPE_TEXT;
            err = 1;
        } else if(strncmp(content_type, "text/html", 9) == 0){
            http_data->flags |= DATA_TYPE_HTML;
            err = 1;
        }
    }
    TRACE(DEBUG, "List Flags : 0%0X", http_data->flags);
    return err;
}

static int http_method(struct rest_handle *handle, const char *url, int curl_method)
{
    CURL* curl = NULL;
    char *ct = NULL;
    CURLcode res;
    struct curl_slist *headers = NULL;
    int err = 0;
    int datalen = 0;

    /* Check all input */
    if (handle && url )
    {
        /* Init Curl Handle */
        if(handle->curl){
            curl = handle->curl;
            http_data_init(&handle->write_buffer, DATA_PERM_WRITE,  NULL);

            /* Url for HTTP */
            curl_easy_setopt(curl, CURLOPT_URL, url);

            /* Get POST Headers */
            headers = curl_slist_append(headers, "Accept: application/json");
            headers = curl_slist_append(headers, "Content-Type: application/json");
            headers = curl_slist_append(headers, "charsets: utf-8");

            /* HTTP Method*/
            curl_easy_setopt(curl, curl_method, 1);
            /* Set headers*/
            curl_easy_setopt(curl, CURLOPT_HTTPHEADER, headers); 

            /* Custom Write function */
            curl_easy_setopt(curl, CURLOPT_WRITEFUNCTION, curl_easy_write);
            curl_easy_setopt(curl, CURLOPT_WRITEDATA, handle);

            /* Check method to execute*/
            if(curl_method == CURLOPT_POST){
                /* Set the size of the data to send */
                datalen = http_data_len(&handle->read_buffer);
                curl_easy_setopt(curl, CURLOPT_POSTFIELDSIZE, datalen);

                /* Custom read function */ 
                curl_easy_setopt(curl, CURLOPT_READFUNCTION, curl_easy_read);
                curl_easy_setopt(curl, CURLOPT_READDATA, handle);

            } else if(curl_method == CURLOPT_PUT){
                /* Set the size of the data to send */
                datalen = http_data_len(&handle->read_buffer);
                curl_easy_setopt(curl, CURLOPT_INFILESIZE_LARGE, datalen);

                /* Custom read function */ 
                curl_easy_setopt(curl, CURLOPT_READFUNCTION, curl_easy_read);
                curl_easy_setopt(curl, CURLOPT_READDATA, handle);
            } 

            /* Perform the request, res will get the return code */
            res = curl_easy_perform(curl);

            /* Check for errors */
            if(CurlIsError(res)) {
                TRACE(ERROR, "curl_easy_perform() failed: %s\n", curl_easy_strerror(res));
                err = CurlErr(res);
            } else {
                
                /* Reset Data Type in buffer */
                handle->write_buffer.flags &= DATA_TYPE_NULL;

                res = curl_easy_getinfo(curl, CURLINFO_CONTENT_TYPE, &ct);
                /* Ask for the content-type */ 
                if(CurlIsSuccess(res) && ct){
                    if(curl_parse_data_type(ct, &handle->write_buffer)){
                        /* Return length of bytes read */
                        err = http_data_len(&handle->write_buffer);
                    } else {
                        TRACE(ERROR, "Unknown Content Type\n");
                        err = RestErr(REST_ERR_DATA_TYPE);
                    }
                } else {
                    TRACE(ERROR, "Failed to get data type: %s", curl_easy_strerror(res));
                    err = CurlErr(res);
                }
            }
            curl_slist_free_all(headers);
        } else {
            TRACE(ERROR, "Module not initialized");
            err = RestErr(REST_ERR_INIT);
        }
       
    } else {
        TRACE(ERROR, "Input args error");
        err =  RestErr(REST_ERR_ARGS);
    }

    return err;
}


struct json* rest_get(struct rest_handle *handle, const char *url, int *err)
{
    struct json* json = NULL;
    char *data = NULL;
    int len = 0;

    /* Chek for valid input */
    if(handle && url){
        /* Check if handle is ready */
        if(handle->state == REST_READY){
            /* Handle is busy*/
            handle->state = REST_BUSY;

            /* Perform HTTP Get Method */
            if((len = http_method(handle, url, CURLOPT_HTTPGET)) > 0){
                TRACE(DEBUG, "Recieved %d bytes", len);

                /* Check Data Type */
                if(handle->write_buffer.flags & DATA_TYPE_JSON){   

                    /* Read Data to contigous memory */
                    if((data = http_data_get(&handle->write_buffer, &len))){
                        TRACE(DEBUG, "Read %d bytes from HTTP Buffer", len);
                        /* Parse Data to JSON*/
                        if(!(json = json_loads(data, data+len, &len))){
                            TRACE(ERROR, "Failed to parse json : %s", json_sterror(len));
                            /* Error */
                            if(err)
                                *err = JsonErr(len);
                        } else if (err){
                            *err = JsonErr(JSON_ERR_SUCCESS);
                        }

                        /* Free Data */
                        free(data);
                    } else {
                        /* HTTP Buffer Read Failed */
                        TRACE(ERROR, "Failed to read HTTP Buffer");
                        if(err) 
                            *err = len;
                    }
                } else {
                    /* Data Type is not JSON */
                    TRACE(ERROR, "JSON data not recieved\n: %s", data);
                    if(err) 
                        *err = RestErr(REST_ERR_DATA_TYPE);
                }
            } else {
                /* Error from HTTP Method */
                TRACE(ERROR, "HTTP Method Error:%s", rest_sterror(len));
                if(err) 
                    *err = len;
            }
            /* Free all data */
            http_data_del(&handle->write_buffer);
            http_data_del(&handle->read_buffer);
            /* Handle is ready again */
            handle->state = REST_READY;
        } else {
            /* Handle is busy */
            TRACE(ERROR,  "Handle not ready");
            if(err) 
                *err = RestErr(REST_ERR_NOT_READY);
        }
    } else {
        /* Check args */
        TRACE(ERROR, "Arguments Error");
        if(err) 
            *err = RestErr(REST_ERR_ARGS);
    }

    return json;
}

struct json* rest_post(struct rest_handle *handle, const char *url, struct json* json, int *err)
{
    struct json* json_rsp = NULL;
    struct buffer *buffer = NULL;
    char *data = NULL;
    int len = 0;
    /* Check data */
    if(handle && url && json){

        /* Check state is not busy */
        if(handle->state == REST_READY){
            /* Now Handle is Busy */
            handle->state = REST_BUSY;

            /* Get string representation for JSON */
            if((data = (char*)json_str(json, &len, 0))){
                TRACE(DEBUG, "JSON string length:%d bytes", len);

                /* Prepare HTTP Buffer from data */
                if((buffer = buffer_new(NULL, DATA_DYNAMIC, data, len)) > 0){

                    /* Init Read Data with new buffer */
                    http_data_init(&handle->read_buffer, DATA_PERM_READ, buffer);

                    /* Perform HTTP Method */
                    if((len = http_method(handle, url, CURLOPT_POST)) > 0){
                        TRACE(DEBUG, "Recieved %d bytes", len);

                        /* Check Data Type returned*/
                        if(handle->write_buffer.flags & DATA_TYPE_JSON){
                            /* Read data into contigous */
                            if((data = http_data_get(&handle->write_buffer, &len))){
                                TRACE(DEBUG, "Read %d bytes from HTTP Buffer", len);
                                /* Read Json Data */
                                if(!(json_rsp = json_loads(data, data+len, &len))){
                                    TRACE(ERROR, "Failed to read json data : %s", json_sterror(len));
                                    if(err)
                                        *err = JsonErr(len);
                                } else if(err) {
                                    *err = JsonErr(JSON_ERR_SUCCESS);
                                }
                                free(data);
                            } else {
                                /* HTTP Buffer Read Failed */
                                TRACE(ERROR, "Failed to read HTTP Buffer : %s", rest_sterror(len));
                                if(err) 
                                    *err = len;
                            }
                        } else {
                            /* Content Type is not Json */
                            TRACE(ERROR, "JSON data not recieved\n%s\n", data);
                            if(err) 
                                *err = RestErr(REST_ERR_DATA_TYPE);
                        }
                    } else {
                        /* Error in HTTP Method Error*/
                        if(err) 
                            *err = len;
                        TRACE(ERROR, "HTTP Method error:%s", rest_sterror(len));
                    }
                } else {
                    /* Free Data Buffer */
                    free(data);
                    TRACE(ERROR, "Memory allocation failure");
                    if(err) 
                        *err = RestErr(REST_ERR_NO_MEM);
                }
            } else {
                /* Memory allocation failed */
                TRACE(ERROR, "Memory allocation failure");
                if(err) 
                    *err = RestErr(REST_ERR_NO_MEM);
            }
             /* Free all data */
            http_data_del(&handle->write_buffer);
            http_data_del(&handle->read_buffer);
            handle->state = REST_READY;
        } else {
            /* Busy*/
            TRACE(ERROR, "Handle not ready");
            if(err) 
                *err = RestErr(REST_ERR_NOT_READY);
        }
    } else {
        /* Check args */
        TRACE(ERROR, "Arguments Error");
        if(err) 
            *err = RestErr(REST_ERR_ARGS);
    }
    return json_rsp;
}

struct json* rest_put(struct rest_handle *handle, const char *url, struct json* json, int *err)
{
    struct json* json_rsp = NULL;
    struct buffer *buffer =NULL;
    char *data = NULL;
    int len = 0;
    /* Check data */
    if(handle && url && json){
        /* Check if handle is busy */
        if(handle->state == REST_READY){

            /* Set State to Busy*/
            handle->state = REST_BUSY;

            /* Get string representation for JSON */
            if((data = (char*)json_str(json, &len, 0))){
                TRACE(DEBUG, "JSON string length:%d bytes", len);

                /* Prepare HTTP Buffer from data */
                if((buffer = buffer_new(NULL, DATA_DYNAMIC, data, len)) > 0){

                    /* Init Read Data with new buffer */
                    http_data_init(&handle->read_buffer, DATA_PERM_READ, buffer);

                    /* Perform HTTP Method */
                    if((len = http_method(handle, url, CURLOPT_PUT)) > 0){
                        TRACE(DEBUG, "Recieved %d bytes", len);

                        /* Check Content Type */
                        if(handle->write_buffer.flags & DATA_TYPE_JSON){
                            /* Read Data */
                            if((data = http_data_get(&handle->write_buffer, &len))){
                                TRACE(DEBUG, "Read %d bytes from HTTP Buffer", len);

                                /* Load JSON Data */
                                if(!(json_rsp = json_loads(data, data+len, &len))){
                                    TRACE(ERROR, "Failed to read json data");
                                    if(err)
                                        *err = JsonErr(len);
                                } else if(err){
                                    *err = JsonErr(REST_ERR_SUCCESS);
                                }
                                free(data);
                            } else {
                                /* Failed to read HTTP Buffer*/
                                TRACE(ERROR, "Failed to read HTTP Buffer : %s", rest_sterror(len));
                                if(err) 
                                    *err = len;
                            }
                        } else {
                            /* Data is not JSON */
                            TRACE(ERROR, "JSON data not recieved\n %s", data);
                            if(err) 
                                *err = RestErr(REST_ERR_DATA_TYPE);
                        }
                    } else {
                        if(err) 
                            *err = len;
                        TRACE(ERROR, "HTTP Method Error :%s", rest_sterror(len));
                    }
                } else {
                    /* Free Buffer */
                    free(data);
                    data = NULL;

                    TRACE(ERROR, "Memory allocation failure");
                    if(err) 
                        *err = RestErr(REST_ERR_NO_MEM);
                }
                /* Free Buffers */
                http_data_del(&handle->write_buffer);
                http_data_del(&handle->read_buffer);
            } else {
                /* Memory allocation failed*/
                TRACE(ERROR, "Memory allocation failure");
                if(err) 
                    *err = RestErr(REST_ERR_NO_MEM);
            }
            /* Handle is ready */
            handle->state = REST_READY;
        } else {
            /* Handle is busy */
            TRACE(ERROR, "Handle not ready");
            if(err) 
                *err = RestErr(REST_ERR_NOT_READY);
        }
    } else {
        /* Check args */
        TRACE(ERROR, "Arguments Error");
        if(err) 
            *err = RestErr(REST_ERR_ARGS);
    }
    return json_rsp;
}

struct rest_handle* rest_init(int options)
{
    struct rest_handle *handle = NULL;
    static const char* _str_names[] = {"Read Buffer", "Write Buffer"};

    if(g_instace_count == 0){
        /* Module initalization */
        curl_global_init( CURL_GLOBAL_ALL );

        g_instace_count++;
    }

    /* Allocate memory*/
    if((handle = calloc(sizeof(struct rest_handle), 1))){
        /* Curl initialization*/
        if((handle->curl = curl_easy_init())){ 
            /* Set HTTPS options */
            if(options & REST_NO_PEER_VERIFY)
                curl_easy_setopt(handle->curl, CURLOPT_SSL_VERIFYPEER, 0L);
            /* Set HTTPS Options */
            if(options & REST_NO_HOST_VERIFY)
                curl_easy_setopt(handle->curl, CURLOPT_SSL_VERIFYHOST, 0L);
            /* Debug Mode */
            if(options & REST_DEBUG)
                curl_easy_setopt(handle->curl, CURLOPT_VERBOSE, 1L);
            
            /* Handle is ready*/
            handle->state = REST_READY;
            
            handle->read_buffer.name = _str_names[0];
            handle->write_buffer.name = _str_names[1];
            http_data_init(&handle->read_buffer, DATA_PERM_READ, NULL);
            http_data_init(&handle->write_buffer, DATA_PERM_READ, NULL);

        } else {
            /* Curl initalization failed*/
            free(handle);
            TRACE(ERROR, "Failed to init curl");
            handle = NULL;
        }
    } else {
        /* Memory issue*/
        TRACE(ERROR, "Failed to allocate memroy");
    }

    return handle;
}

void rest_cleanup(struct rest_handle *handle)
{
    if(g_instace_count == 0){
        TRACE(ERROR, "System is not initialized");
    } else {
        /* Check for valid handle */
        if(handle){
            if(g_instace_count > 0){
                /* always cleanup */
                curl_easy_cleanup(handle->curl);   
                g_instace_count--;
            }

            free(handle);
        }
        /* Module Cleanup */
        if(g_instace_count == 0)
            curl_global_cleanup();
    }
}

const char* rest_sterror(int err)
{
    static const char* _err_table[] ={
        [REST_ERR_SUCCESS]    =  "Success",
        [REST_ERR_INIT]       =  "Not initialized",
        [REST_ERR_ERROR]      =  "Generic Error",
        [REST_ERR_ARGS]       =  "Invalid Arguments",
        [REST_ERR_NO_MEM]     =  "Not enough memory",
        [REST_ERR_NOT_READY]  =  "Handle is not ready",
        [REST_ERR_DATA_TYPE]  =  "Data type mismatch",
        [REST_ERR_LAST]       =  "Invalid Error"
    };

    if(isRestErr(err)){
        return _err_table[-err];
    } else if(isJsonErr(err)){
        return json_sterror(RealJsonErr(err));
    } else if(isCurlErr(err)){
        return curl_easy_strerror(RealCurlErr(err));
    } else {
        TRACE(WARN,"Invalid Error code:%d", err);
        return "Not a valid error code";
    }
}

