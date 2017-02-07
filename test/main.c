#include <stdio.h>
#include "json.h"
#include "rest.h"


int main(int argc, char *argv[])
{
    /*
    char *url = "https://api.crunchgallery.com/users";
    size_t buf_size = 0;

    char buffer[512];
    char data[]="{\"email\":\"test@test.com\"}";

    int len = http_post(url, data,sizeof(data), buffer, sizeof(buffer));
    printf("%d\n", len);
    printf("%s\n", buffer);
    */

    //login("sarvesh@icelero.com", "test");
    int err;
    struct rest_handle *handle = rest_init(0);
    struct json *json1 = json_new();
    json_set(json1, "title", JSON_TYPE_STR, "Test Title");
    json_set(json1, "type", JSON_TYPE_STR, "INFORMATION");
    json_set(json1, "api_key", JSON_TYPE_STR, "dev_test_secret_key");
    printf("New\n");
    json_print(json1, 2);
    struct json* json = rest_post(handle, "http://localhost:8000/alerts", json1, &err);
    //struct json* json = rest_get(handle, "https://api.crunchgallery.com/users", &err);
    const void *data;
    char *id = NULL;
    int type;
    char url[1024];
    json_del(json1);
    if( json ){
        data = json_get(json, "id", &type);
        if(type == JSON_TYPE_STR){
            id = (char*)data;
            sprintf(url, "http://localhost:8000/alerts/%s", id);
            json_set(json, "api_key", JSON_TYPE_STR, "dev_test_secret_key");
            json_set(json, "status", JSON_TYPE_STR, "WORKING");
            json_print(json, 2);
            printf("Set Working\n");
            json1 = rest_put(handle, url, json, &err);
            if(json1){
                json_print(json1, 2);
                printf("Set Closed\n");
                json_set(json, "status", JSON_TYPE_STR, "CLOSED");
                json_print(json, 2);
                json1 = rest_put(handle, url, json, &err);
                json_print(json1, 2);
            }
        }
    }
    
    /*
    if(json){
        
        data = json_get(json, NULL,&type);
        if(type == JSON_TYPE_ITER){
            struct json_iter *iter = (struct json_iter *)data;
            while((data=json_iter_next(iter, &type))){
                if(type == JSON_TYPE_OBJ){
                    struct json* json1 = (struct json*)data;
                    data = json_get(json1, "id", &type);
                    data1 = json_get(json1, "email", &type);
                    printf("%s:%s\n", (char*)data, (char*)data1);
                }
            }
        }
        //json_print(json, 2);
    }
    */
    
}

