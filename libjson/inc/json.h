#ifndef __JSON_H__
#define __JSON_H__

#include <stddef.h>

#ifdef __cplusplus
extern "C" {
#endif

typedef enum bool_e{
    false,
    true,
} bool;

typedef enum json_err
{
    JSON_ERR_SUCCESS, 
    JSON_ERR_NO_MEM,
    JSON_ERR_KEY_NOT_FOUND,
    JSON_ERR_ARGS,
    JSON_ERR_PARSE,
    JSON_ERR_OVERFLOW,
    JSON_ERR_SYS,
} json_err_t;

typedef enum 
{
    JSON_TYPE_INVALID,
    JSON_TYPE_NULL,
    JSON_TYPE_OBJ,
    JSON_TYPE_STR ,
    JSON_TYPE_BOOL,
    JSON_TYPE_INT,
    JSON_TYPE_UINT,
    JSON_TYPE_LONG,
    JSON_TYPE_DOUBLE,
    JSON_TYPE_HEX,
    JSON_TYPE_OCTAL,        
    JSON_TYPE_LIST,
    /* Rest aren't for parsing*/
    JSON_TYPE_ITER,
} json_type_t;

typedef struct json_val_s
{
    json_type_t type;
    union
    {
        const void* data;
        unsigned int uint_number;
        long long long_number;
        double double_number;
        int int_number;
        const char *string;
        bool boolean;
        struct json_s* json_obj;
        struct json_list_s* list;
    };
    struct json_val_s *next;
    struct json_val_s *prev;
} json_val_t;

typedef struct json_list_s
{
    size_t count;
    json_val_t* start;
    json_val_t* end; 
} json_list_t;

typedef struct json_dict_s
{
    const char *key;
    json_val_t *val;
    struct json_dict_s *next;
    struct json_dict_s *prev;
} json_dict_t;

typedef struct json_s
{
    size_t count;
    json_dict_t *dict_start;
    json_dict_t *dict_end;
} json_t;

typedef struct json_iter_s
{
    json_t *json_obj;
    json_list_t *list;
    json_val_t *current;
    json_type_t type;
} json_iter_t;


json_err_t json_loads(const char *start, const char* end, json_t **json);
json_err_t json_load(const char* fname, json_t** json);
const char* json_get_err(int err);
const void* json_get(json_t *json, const char *key, json_type_t *type, json_iter_t *iter);
json_err_t json_set(json_t *json, const char *key, json_type_t type, void *val);
const void* json_iter_next(json_iter_t *iter,  json_type_t *type);
int json_print(json_t *json, unsigned int indent);
int json_printf(json_t *json, const char *fname, unsigned int indent);
int json_prints(json_t *json, const char *buffer, unsigned int size, unsigned int indent);

#ifdef __cplusplus
}
#endif
#endif