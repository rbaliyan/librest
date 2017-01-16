#ifndef __UTILS_H__
#define __UTILS_H__

#include <stdio.h>
#include <stdlib.h>
FILE *fmemopen(void *buf, size_t size, const char *mode);
char* readall(const char *fname, unsigned int *len);
const char* trim(const char *start, const char *end);
int tohex(char ch);
int todigit(char ch);
int tohex(char ch);
#endif