#ifndef _LIB_REST_H_
#define _LIB_REST_H_

#include <stdlib.h>

enum REST_ERR
{
    REST_ERR_BEGIN = 0,
    REST_ERR_SUCCESS = 0,
    REST_ERR_INIT,
    REST_ERR_ERROR,
    REST_ERR_ARGS,
    REST_ERR_NO_MEM,
    REST_ERR_NOT_READY,
    REST_ERR_DATA_TYPE,
    REST_ERR_LAST,
};

enum REST_OPTIONS {
  REST_OPT_NULL          = 0x00,
  REST_DEBUG             = 0x01,
  REST_NO_PEER_VERIFY    = 0x02,
  REST_NO_HOST_VERIFY    = 0x04, 
  REST_AUTOCLOSE         = 0x08,
  REST_OPT_INVALID,
};

enum rest_state {
    REST_ERROR = 0x00,
    REST_READY = 0x01,
    REST_BUSY  = 0x02,
};

struct rest_handle;
//int login(char *username, char *passwd);

struct rest_handle* rest_init(int options);
void rest_cleanup(struct rest_handle*);
struct json* rest_get(struct rest_handle *handle, const char *url, int *err);
struct json* rest_post(struct rest_handle *handle, const char *url, struct json* json, int *err);
struct json* rest_put(struct rest_handle *handle, const char *url, struct json* json, int *err);
const char* rest_sterror(int err);
#endif