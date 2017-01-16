#ifndef __ALLOC_H__
#define __ALLOC_H__

#include <stddef.h>

#include "json.h"
json_t* json_alloc_obj();
json_val_t* json_alloc_val(json_type_t json_type, const void* data);
json_list_t* json_alloc_list();
json_dict_t * json_alloc_dict(const char* key, const json_val_t * val);
void json_free(json_t* json);
void json_free_list(json_list_t* list);
void json_free_dict(json_dict_t *dict);
void json_free_val(json_val_t* va);
char *buffer_alloc(size_t size);
void buffer_free(const char * buffer);
#endif