#include <stdio.h>
#include <curl/curl.h>
#include <strings.h>
#include <limits.h>
#include "auth.h"

/*
#if LIB_AUTH_BUILD == _DEV_
#define LIB_AUTH_URL "https://dev.api.crunchgallery.com"
#elif LIB_AUTH_BUILD == _QA_
#define LIB_AUTH_URL "https://qa.api.crunchgallery.com"
#elif LIB_AUTH_BUILD == _PROD_
#define LIB_AUTH_URL "https://api.crunchgallery.com"
#endif
*/

#define LIB_AUTH_URL "http://10.0.0.127/standalone/login"

#define MIN(a,b)    (a<b?a:b)
#define HTTP_BUFFER_DYNAMIC     

typedef struct http_buffer_s
{
    size_t size;            // Buffer Size
    size_t len;             // Data length in buffer
    unsigned int flags;      // Flags 
    char *data;             // Actual data
    //struct http_buffer_s *next;     // Next Data
} http_buffer_t;


void hexdump (char *desc, void *addr, int len) {
    int i;
    unsigned char buff[17];
    unsigned char *pc = (unsigned char*)addr;

    // Output description if given.
    if (desc != NULL)
        printf ("%s:\n", desc);

    if (len == 0) {
        printf("  ZERO LENGTH\n");
        return;
    }
    if (len < 0) {
        printf("  NEGATIVE LENGTH: %i\n",len);
        return;
    }

    // Process every byte in the data.
    for (i = 0; i < len; i++) {
        // Multiple of 16 means new line (with line offset).

        if ((i % 16) == 0) {
            // Just don't print ASCII for the zeroth line.
            if (i != 0)
                printf ("  %s\n", buff);

            // Output the offset.
            printf ("  %04x ", i);
        }

        // Now the hex code for the specific character.
        printf (" %02x", pc[i]);

        // And store a printable ASCII character for later.
        if ((pc[i] < 0x20) || (pc[i] > 0x7e))
            buff[i % 16] = '.';
        else
            buff[i % 16] = pc[i];
        buff[(i % 16) + 1] = '\0';
    }

    // Pad out last line if not exactly 16 characters.
    while ((i % 16) != 0) {
        printf ("   ");
        i++;
    }

    // And print the final ASCII bit.
    printf ("  %s\n", buff);
}


static size_t curl_easy_write(char *bufptr, size_t size, size_t nitem, void *userp)
{
    int datalen = size * nitem;
    int copylen = 0;
    http_buffer_t *http_buffer = (http_buffer_t*)userp;

    if( http_buffer->len < http_buffer->size )
    {
        copylen =  http_buffer->size - http_buffer->len;
        copylen = MIN(copylen, datalen);
        memcpy(http_buffer->data, bufptr, copylen);
    }

    if( datalen - copylen)
    {
        fprintf(stderr, "Buffer size insufficent");
    }

    // It always stores the length of total data 
    http_buffer->len += datalen;

    printf("Return :%d\n", datalen);
    /* If returned data is not same as input its an error */
    return datalen;
}

int http_post(char *url, char *data, size_t datalen, char *buffer, size_t buf_size)
{
    CURL *curl;
    CURLcode res;
    struct curl_slist *headers = NULL;
    http_buffer_t http_buffer;
    int err = 0;

    /* Check all input */
    if (url && data && buffer && buf_size )
    {
        /* Init Curl Handle */
        if((curl = curl_easy_init())) 
        {
            curl_easy_setopt(curl, CURLOPT_URL, url);

#ifdef LIB_AUTH_NO_PEER_VERIFY
            curl_easy_setopt(curl, CURLOPT_SSL_VERIFYPEER, 0L);
#endif

#ifdef LIB_AUTH_DEBUG
            curl_easy_setopt(curl, CURLOPT_VERBOSE, 1L);
#endif

#ifdef LIB_AUTH_NO_HOST_VERIFY
            curl_easy_setopt(curl, CURLOPT_SSL_VERIFYHOST, 0L);
#endif

            headers = curl_slist_append(headers, "Accept: application/json");
            headers = curl_slist_append(headers, "Content-Type: application/json");
            headers = curl_slist_append(headers, "charsets: utf-8");

            curl_easy_setopt(curl, CURLOPT_POST, 1);
            curl_easy_setopt(curl, CURLOPT_HTTPHEADER, headers); 
            curl_easy_setopt(curl, CURLOPT_POSTFIELDS, data);
            curl_easy_setopt(curl, CURLOPT_POSTFIELDSIZE, datalen);

#ifdef LIB_AUTH_DEBUG
            hexdump("Input", data, datalen);
#endif
            http_buffer.data = buffer;
            http_buffer.size  = buf_size;
            http_buffer.len   = 0;
            
            curl_easy_setopt(curl, CURLOPT_WRITEFUNCTION, curl_easy_write);
            curl_easy_setopt(curl, CURLOPT_WRITEDATA, &http_buffer);

            /* Perform the request, res will get the return code */
            res = curl_easy_perform(curl);

            /* Check for errors */
            if(res != CURLE_OK)
            {
                fprintf(stderr, "curl_easy_perform() failed: %s\n",curl_easy_strerror(res));
                err = -1;
            }
            else
            {
                err = http_buffer.len;
#ifdef LIB_AUTH_DEBUG
                hexdump("Output",buffer, http_buffer.len);
#endif
            }

            curl_slist_free_all(headers);

            /* always cleanup */
            curl_easy_cleanup(curl);
        }
        else
        {
            fprintf(stderr, "Failed to init curl");
            err =  -1;
        }
    }
    else
    {
        fprintf(stderr, "Input args error");
        err =  -2;
    }
    return err;
}

void mod_init()
{
    /* Module initalization */
    curl_global_init( CURL_GLOBAL_ALL );
}

void mod_cleanup()
{
    /* Module Cleanup */
    curl_global_cleanup();
}

int json_encode(char *name[], char *value[], char count, char *json, size_t json_size)
{
    int i = 0;
    int len = 0;
    int temp = 0;
    if( json && json_size )
    {
        json[len++] = '{';
        for(i = 0; i < count; i++)
        {
            temp = snprintf(&json[len], json_size - len - 2, "\"%s\":\"%s\"", name[i], value[i]);
            if( temp <= 0 )
                break;

            len += temp;
            if(( i < count - 1 ) && ( json_size - len ) > 2)
            {
                json[len++] = ',';
            }
        }

        json[len++]='}';
        json[len]= '\0';
    }

    return len;
}


int login(char *username, char *passwd)
{ 
  char jsonObj[1024];
  int jsonObjSize = json_encode( (char* []){"email", "password"}, (char* []){username, passwd}, 2, jsonObj, sizeof(jsonObj));
  printf("Sending : %s\n", jsonObj);
  int len = http_post(LIB_AUTH_URL, jsonObj, jsonObjSize, jsonObj, sizeof(jsonObj));
  if( len > 0 )
  {
      printf("Login successfull : %s\n", jsonObj);
      hexdump("Login", jsonObj, len);
  }
  return 0;
}