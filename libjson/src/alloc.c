#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include "json.h"
#include "alloc.h"

/*
* Json Object allocate 
*/
json_t* json_alloc_obj()
{
    json_t *json = calloc(sizeof(json_t), 1);
    if(json){
        /* Set Params*/
        json->count = 0;
        json->dict_start = NULL;
        json->dict_end = NULL;
    }
    return json;
}
/*
* Json Value allocate 
*/
json_val_t* json_alloc_val(json_type_t json_type, const void* data)
{
    json_val_t *val = calloc(sizeof(json_val_t), 1);
    if(val){
        val->type = json_type;
        /* Set Value according to type*/
        switch(json_type){
            case JSON_TYPE_BOOL:
                val->boolean = *(bool*)data;
                break;

            case JSON_TYPE_UINT:
            case JSON_TYPE_INT:
            case JSON_TYPE_HEX:
            case JSON_TYPE_OCTAL:
                memcpy(&val->int_number, data, sizeof(val->int_number));
                break;

            case JSON_TYPE_LONG:
                memcpy(&val->long_number, data, sizeof(val->long_number));
                break;

            case JSON_TYPE_DOUBLE:
                memcpy(&val->double_number, data, sizeof(val->double_number));
                break;

            case JSON_TYPE_LIST:
                val->list = (json_list_t*)data;
                break;
            case JSON_TYPE_STR:
                val->string = (const char*)data;
                break;
            case JSON_TYPE_OBJ:
                val->json_obj = (json_t*)data;
                break;
            default:
                val->data = data;
        }
        val->next = val->prev = NULL;
    }
    return val;
}

/*
* Json List allocate
*/
json_list_t* json_alloc_list()
{
    json_list_t *list = calloc(sizeof(json_list_t), 1);
    if(list){
        /* Set Params*/
        list->start = list->end = NULL;
        list->count = 0;
    }
    return list;
}
/*
* Json dict allocate 
*/
json_dict_t * json_alloc_dict(const char* key, const json_val_t * val)
{
    json_dict_t *dict = calloc(sizeof(json_dict_t), 1);
    if(dict){
        /* Set params*/
        dict->key = key;
        dict->val = (json_val_t*)val;
    }
    return dict;
}

/*
* Json Object free 
*/
void json_free(json_t* json)
{
    json_dict_t *dict  = NULL;
    json_dict_t *next_dict  = NULL;
    /* Traverse all dicts*/
    for(dict = json->dict_start; dict; dict=next_dict){
        /* Save next dict and free current*/
        next_dict = dict->next;
        json_free_dict(dict);
    }
}

/*
* Json dict free 
*/
void json_free_dict(json_dict_t *dict)
{
    /* Dict Key is also allcated at the time of parsing*/
    buffer_free(dict->key);

    /* Free Value */
    json_free_val(dict->val);
}

/*
* Json list free 
*/
void json_free_list(json_list_t* list)
{
    json_val_t* val = NULL;
    json_val_t* temp = NULL;
    /* Traverse all list*/
    for(val = list->start; val; val = temp){
        /* Save next and free current pointer*/
        temp = val->next;
        json_free_val(val);
    }
}

/*
* Json value free 
*/
void json_free_val(json_val_t* val)
{
    /* Free Value based on the its type*/
    switch(val->type){
        case JSON_TYPE_OBJ:
        /* Free JSON Object*/
        json_free(val->json_obj);
        break;
        case JSON_TYPE_LIST:
        /* Free List*/
        json_free_list(val->list);
        break;
        case JSON_TYPE_STR:
        /* Free String */
        buffer_free(val->string);
        break;
        default:
        /* Rest types do not need free*/
        break;
    }
}

/*
* Buffer allocate 
*/
char *buffer_alloc(size_t size)
{
    return (char*)malloc(size);
}

/*
* Buffer free
*/
void buffer_free(const char *buffer)
{
    free((void*)buffer);
}
