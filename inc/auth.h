#ifndef _LIB_AUTH_H_
#define _LIB_AUTH_H_

#define _PROD_  0
#define _QA_ 1
#define _DEV_ 2

#ifndef LIB_AUTH_BUILD
#define LIB_AUTH_BUILD _PROD_
#endif

#define LIB_AUTH_TOKEN_SIZE 512

#define LIB_AUTH_DEBUG


int login(char *username, char *passwd);

void mod_init();
void mod_cleanup();
int http_post(char *url, char *data, size_t datalen, char *buffer, size_t buf_size);


#endif