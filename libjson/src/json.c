#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <ctype.h>
#include "json.h"
#include "json_parse.h"
#include "alloc.h"
#include "utils.h"

/*
* A Simple dict based on linked list
*/
int json_dict_add(json_t *json, const char *key, const json_val_t* val)
{
    int err = 0;
    json_dict_t* dict = NULL;
    json_val_t *temp;
    /* Check data */
    if( json && key && val ){
        for(dict = json->dict_start; dict; dict = dict->next){
            if(strcmp(dict->key, key)== 0){
                fprintf(stderr,"key %s can not come in same dict more than once", key);
                return 0;
            }
        }
        /* Allocate dict */
        dict = json_alloc_dict(key, val);
        if( dict ){
            /* Add in the end */
            dict->prev = json->dict_end;

             /* If end is not set it is first */
            if(json->dict_end){
                json->dict_end->next = dict;
            } else {
                json->dict_start = dict;
            }
            json->dict_end = dict;
            json->count++;
            err = 1;
        }
    }
    return err;
}

int json_list_add(json_list_t* list, json_val_t* val)
{
    int err = 0;
    /* Check data */
    if(list && val){
        /* Add in the end */
        val->prev = list->end;
        /* If end is not set it is first */
        if(list->end){
            list->end->next = val;
        } else {
            list->start = val;
        }
        list->end = val;
        list->count++;
        err = 1;
    }
    return err;
}

/*
* Load Json from buffer from memory
*/
json_err_t json_loads(const char *start, const char* end, json_t **json)
{
    json_err_t err = JSON_ERR_ARGS;

    /* Check data */
    if( start && end && json ){
        /* Process Buffer */

        *json = json_parse(start, end, &err);
    } else {
        /* Invalid input */
        fprintf(stderr, "%s:%d>Invalid params\n",__func__, __LINE__);
    }

    return err;
}
/* 
* Load JSON data from a file
*/
json_err_t json_load(const char* fname, json_t **json)
{
    const char* temp = NULL;
    json_err_t err = JSON_ERR_ARGS;
    unsigned int len = 0;
    char *buffer = NULL;

    /* Check for data*/
    if(fname && json){
        /* Read all data */
        buffer = readall(fname, &len);

        /* Check if data was read correctly */            
        if(( len > 0 ) && buffer){

            /* Start Parsing */
            err = json_loads(buffer, buffer + len, json);

            /* Free Buffer */ 
            free(buffer); 
        } else {
            /* Failed to read file in buffer*/
            fprintf(stderr, "%s:%d>Failed to read file : %s\n", __func__, __LINE__, fname);

            err = JSON_ERR_SYS;
        }
    } else {
        /* Invalid arguments*/
        fprintf(stderr, "%s:%d>Invalid args", __func__, __LINE__);
        err = JSON_ERR_ARGS;
    }
    return err;
}

static int json_print_val(FILE *stream, json_val_t *val, unsigned int indent, unsigned int level);
static int json_print_obj(FILE *stream, json_t *json, unsigned int indent, unsigned int level);
/*
* JSON print json value
*/
static int json_print_val(FILE *stream, json_val_t *val, unsigned int indent, unsigned int level)
{
    int ret = 0;
    int count = 0;
    switch(val->type){
        case JSON_TYPE_NULL:
        break;
        case JSON_TYPE_OBJ:
            ret = json_print_obj(stream, val->json_obj, indent, level + 1);
        break;
        case JSON_TYPE_STR:
            ret = fprintf(stream, "\"%s\"",val->string);
        break;
        case JSON_TYPE_BOOL:
            ret = fprintf(stream, "%s",val->boolean == true ? "true" : "false");
        break;
        case JSON_TYPE_DOUBLE:
            ret = fprintf(stream, "%lf",val->double_number);
        break;
        case JSON_TYPE_INT:
            ret = fprintf(stream, "%d",val->int_number);
        break;
        case JSON_TYPE_LONG:
            ret = fprintf(stream, "%llu",val->long_number);
        break;
        case JSON_TYPE_UINT:
            ret = fprintf(stream, "%u",val->uint_number);
        break;
        case JSON_TYPE_HEX:
            ret = fprintf(stream, "0x%0x",val->uint_number);
        break;
        case JSON_TYPE_OCTAL:
            ret = fprintf(stream, "0%o",val->uint_number);
        break;
        case JSON_TYPE_LIST:
            fprintf(stream, "[");
            for(val=val->list->start;val; val=val->next){
                if(count){
                    fprintf(stream, ",");
                    ret++;
                }
                count++;
                ret += json_print_val(stream, val, indent, level);
            }  
            fprintf(stream, "]");
            ret += 2;
        break;
        default:
        break;
    }

    return ret;
}

/*
* Print indentation for JSON
*/
static int json_indent(FILE *stream, int indent, int level)
{
    int i;
    int indentation;
    if((level <= 0) ||( indent <= 0))
        return 0;

    indentation = indent * level;
    fprintf(stream, "%*c",indentation, ' ');
    //for(i = 0; i < indentation; i++)
    //    fprintf(stream, " ");
    return indentation;
}

/*
* JSON print single object
*/
static int json_print_obj(FILE *stream, json_t *json, unsigned int indent, unsigned int level)
{
    int i = 0;
    int ret = 0;
    int count = 0;
    json_val_t *val = NULL;
    json_dict_t *dict = NULL;
    
    /* Check data */
    if(json){
        fprintf(stream, "{");
        ret++;
        /* Traverse all dict keys */
        for(dict = json->dict_start; dict; dict = dict->next){
            if(count > 0){
                ret += fprintf(stream, ",");
            }
            if(indent){
                ret += fprintf(stream, "\n");
            }

            count++;
            ret += json_indent(stream, indent, level + 1);
            ret += fprintf(stream, "\"%s\":", dict->key);
            ret += json_print_val(stream, dict->val, indent, level);
        }
        if(indent){
            ret += fprintf(stream, "\n");
        }
        ret += json_indent(stream, indent, level);
        ret += fprintf(stream, "}");
    }

    return ret;
}

/*
* Print json data on screen
*/
int json_print(json_t *json, unsigned int indent)
{
    return json_print_obj(stdout, json, indent, 0);
}

/*
* Print json data to File
*/
int json_printf(json_t *json, const char *fname, unsigned int indent)
{
    FILE *fp = fopen(fname, "w");
    if(fp){
         return json_print_obj(fp, json, indent, 0);
    } else {
        fprintf(stderr, "%s:%d>Failed to open file : %s", __func__, __LINE__, fname);
    }
   return -1;
}
/*
* Print json data to string
*/
int json_prints(json_t *json, const char *buffer, unsigned int size, unsigned int indent)
{
    int len = -1;
    FILE *fp = fmemopen((void*)buffer, size,  "w");
    if(fp){
         len = json_print_obj(fp, json, indent, 0);
         fclose(fp);
         return len;
    } else {
        fprintf(stderr, "%s:%d>Failed to initialized buffer as file", __func__, __LINE__);
    }
   return -1;
}


/*
* Get value for key from json
* List value is not returned, instead iterator is returned 
*/
const void* json_get(json_t *json, const char *key, json_type_t *type, json_iter_t *iter)
{
    json_dict_t *dict = NULL;

    /* Check for valid data  */
    if(json && key && type && iter){
        /* Zero iterator */
        memset(iter, 0, sizeof(json_iter_t));

        /* Find key in json object */
        for(dict = json->dict_start; dict; dict = dict->next){
            /* Check Key */
            if(strcmp(dict->key, key) == 0 ){
                /* List and json objects are not returned, instead iterators are returned */
                if(dict->val->type == JSON_TYPE_LIST){
                    /* Set List for Iterator */
                    iter->list = dict->val->list;
                    iter->current = NULL;
                    iter->type = JSON_TYPE_LIST;
                    *type = JSON_TYPE_ITER;
                    return iter;
                } else if(dict->val->type == JSON_TYPE_OBJ){
                    /* Set JSON object */
                    iter->json_obj = dict->val->json_obj;
                    iter->current = NULL;
                    iter->type = JSON_TYPE_OBJ;
                    *type = JSON_TYPE_ITER;
                    return iter;
                }
                /* Rest of data can be returned */
                *type = dict->val->type;
                return dict->val->data;
            }
        }
    }
    return NULL;
}
/*
* Set Key in JSON object
* If Provided value is NULL key will be removed
* For List the key will be added
* For others values will be replcaed, if key exists or it will be added
*/
json_err_t json_set(json_t *json, const char *key, json_type_t type, void *val)
{
    json_err_t err = JSON_ERR_ARGS;
    json_dict_t *dict = NULL;
    json_val_t *json_val = NULL;
    char * key_copy = NULL;

    /* Check data */
    if(json && key && type && type != JSON_TYPE_LIST){
        /* Find key in json object */
        for(dict = json->dict_start; dict; dict = dict->next){
            /* Match dict key */
            if(strcmp(dict->key, key) == 0 ){
                /* NULL value is used to delete the key*/
                if( val ){
                    /* Allocate value and assign*/
                    if((json_val = json_alloc_val(type, (const void*)val))){
                        /* For List value is added*/
                        if(dict->val->type != JSON_TYPE_LIST){
                            json_free_val(dict->val);
                            dict->val = json_val;
                            err = JSON_ERR_SUCCESS;
                        } else {
                            /* If not List then replace the value*/
                            if(json_list_add(dict->val->list, json_val)){
                                fprintf(stderr, "%s:%d> Failed to add in list \n", __func__, __LINE__);
                                json_free_val(json_val);
                                err = JSON_ERR_NO_MEM;
                            } else {
                                /* Success*/
                                err = JSON_ERR_SUCCESS;
                            }
                        }
                    } else {
                        /* Memeory allocation failed*/
                        fprintf(stderr, "%s:%d> Memeory allocation failed\n", __func__, __LINE__);
                        err = JSON_ERR_NO_MEM;
                    }  
                } else {
                    /* NULL Value Free dict entry*/
                    if(dict->prev){
                        dict->prev->next = dict->next;
                    }
                    if(dict->next){
                        dict->next->prev = dict->prev;
                    }
                    json_free_dict(dict);
                    err = JSON_ERR_SUCCESS;
                }
            }
        }
        /* Check if No match found */
        if((dict == NULL) && val){
            if((key_copy = buffer_alloc(strlen(key)))){
                /* Make a copy of key */
                strcpy(key_copy, key);
                if((json_val = json_alloc_val(type, (const void*)val))){
                    /* No match found */
                    if(json_dict_add(json, key, json_val)){
                        fprintf(stderr, "%s:%d> Memeory allocation failed\n", __func__, __LINE__);
                        err = JSON_ERR_NO_MEM;
                        buffer_free(key_copy);
                    }
                } else {
                    /* Failed to allocate memory*/
                    fprintf(stderr, "%s:%d> Memeory allocation failed\n", __func__, __LINE__);
                    err = JSON_ERR_NO_MEM;
                    buffer_free(key_copy);
                }
            } else {
                /* Buffer allocation failed for key*/
                fprintf(stderr, "%s:%d> Memeory allocation failed\n", __func__, __LINE__);
                err = JSON_ERR_NO_MEM;
            }
        }
    }
    return err;
}
/*
* Iterator
*/
const void* json_iter_next(json_iter_t *iter,  json_type_t *type)
{
    if(iter && type){
        if(iter->type == JSON_TYPE_LIST){
            /* If Current is not set then move to start*/
            if(iter->current){
                iter->current = iter->current->next;
            } else {
                iter->current = iter->list->start;
            }
            
            if(iter->current){
                *type = iter->current->type;
                return iter->current->data;
            } else {
                *type = JSON_TYPE_NULL;
            }
        } else if(iter->type == JSON_TYPE_OBJ){

        } else {

        }
    }

    return NULL;
}