#include <stdio.h>
#include "json.h"


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

    int len = 0;
    char buffer[1024] = {0};
    json_t *json = NULL;
    json_load("test.json", &json);
    if(json){
        json_set(json, "a", JSON_TYPE_STR, "THis is another test");
        //len =  json_print(json, 4);
        //printf("#########\n");
        len = json_prints(json, buffer, sizeof(buffer), 4);
        printf("%s", buffer);

    }
}

