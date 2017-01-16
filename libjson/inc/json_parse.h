#ifndef __JSON_PARSE_H__
#define __JSON_PARSE_H__

#include <stdlib.h>
#include "json.h"

json_t* json_parse(const char *start, const char *end, json_err_t *err);
#endif