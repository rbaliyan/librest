#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
#include <fcntl.h>
#include <unistd.h>
#include <sys/mman.h>

struct fmem {
  size_t pos;
  size_t size;
  char *buffer;
};
typedef struct fmem fmem_t;

static int readfn(void *handler, char *buf, int size)
{
  fmem_t *mem = handler;
  size_t available = mem->size - mem->pos;
  
  if (size > available) {
    size = available;
  }
  memcpy(buf, mem->buffer + mem->pos, sizeof(char) * size);
  mem->pos += size;
  
  return size;
}

static int writefn(void *handler, const char *buf, int size)
{
  fmem_t *mem = handler;
  size_t available = mem->size - mem->pos;

  if (size > available) {
    size = available;
  }
  
  memcpy(mem->buffer + mem->pos, buf, sizeof(char) * size);
  mem->pos += size;
  return size;
}

static fpos_t seekfn(void *handler, fpos_t offset, int whence)
{
  size_t pos;
  fmem_t *mem = handler;

  switch (whence) {
    case SEEK_SET: {
      if (offset >= 0) {
        pos = (size_t)offset;
      } else {
        pos = 0;
      }
      break;
    }
    case SEEK_CUR: {
      if (offset >= 0 || (size_t)(-offset) <= mem->pos) {
        pos = mem->pos + (size_t)offset;
      } else {
        pos = 0;
      }
      break;
    }
    case SEEK_END: pos = mem->size + (size_t)offset; break;
    default: return -1;
  }

  if (pos > mem->size) {
    return -1;
  }

  mem->pos = pos;
  return (fpos_t)pos;
}

static int closefn(void *handler)
{
  free(handler);
  return 0;
}

FILE *fmemopen(void *buf, size_t size, const char *mode)
{
  // This data is released on fclose.
  fmem_t* mem = (fmem_t *) malloc(sizeof(fmem_t));

  // Zero-out the structure.
  memset(mem, 0, sizeof(fmem_t));

  mem->size = size;
  mem->buffer = buf;

  // funopen's man page: https://developer.apple.com/library/mac/#documentation/Darwin/Reference/ManPages/man3/funopen.3.html
  return funopen(mem, readfn, writefn, seekfn, closefn);
}


/**
* The same function can be used in reverse also, by reversing arguments
* just skip all spaces
*/
const char* trim(const char *start, const char *end)
{
    /* Check for valid ptrs */
    if(start && end){
        /* If length is negative then trim in reverse */
        if(start >  end){
            /* trim from the end */
            /* Skip all space, including null characters */
            for(; (start > end) && (isspace(*start) || !*start) ; start--);

        } else {
            /* trim from beginning */
            /* Skip all space and stop at null character or any other valid characters*/
            for(; (start < end) && (!*start || isspace(*start)); start++);
        }
    }
     /* Return the trimmed ptr, start and end will be handled by caller */
    return start;
}

/* Convert characters to hex digit,
* For invalid hex return -1 
*/
int tohex(char ch)
{
    int val = -1;
    /* Valid Hex values should be between 
    *'A' and 'F'
    *'a' and 'f'
    *'0' and '9', including 
    */
    if((ch >= 'a' ) && ( ch <='f')){
        val = ch - 'a' + 10;
    } else if((ch >= 'A' ) && ( ch <='F')){
        val = ch - 'A' + 10;
    } else if((ch >= '0' ) && ( ch <='9')){
        val = ch - '0';
    }

    return val;
}

/* Convert character to digit , return -1 for invalid value */
int todigit(char ch)
{
    int val = -1;
    /* Valid digit should be between 
    * '0' and '9' including
    */
    if((ch >= '0' ) && ( ch <='9')){
        val = ch - '0';
    }

    return val;
}

/*
* Open a file in read mode and read all data in buffer
*/
char* readall(const char *fname, unsigned int *len)
{
    int ret = -1;
    int fd, rlen;
    char *buffer;
    off_t size = 0;
    int index = 0;

    /* Check data */
    if(fname){
        /* Open File */
        if((fd = open(fname, O_RDONLY)) >= 0){
            /* Goto end of file */
            if((size = lseek(fd, 0, SEEK_END)) > 0){
                /* Retrun to beginning */
                lseek(fd, 0, SEEK_SET);

                /* File needs to be in memeory */
                /* Allocate buffer for file data */
                if((buffer = malloc(size + 1))){
                    
                    /* Read entire file in buffer */
                    for(index = 0; index < size; index += rlen){
                        /* Read data from file */
                        rlen = read(fd, &buffer[index], size - index);
                        if(rlen < 0){
                            /* Dara read error */
                            fprintf(stderr, "%s:%d>Failed to read file : %s", __func__, __LINE__, fname);
                            /* Free buffer */
                            free(buffer);
                            break;
                        }
                    }
                    
                    /* Check if all data was read, do not process incomplete data */
                    if(index == size ){  
                      /* Make sure to NULL terminate */
                      buffer[index] = '\0';  
                        if(len)
                            *len = (unsigned int)size;

                        return buffer;
                    } else {
                        /* Free Buffer */
                        free(buffer);
                    }
                } else {
                    /* Memory allocation failure */
                    fprintf(stderr, "%s:%d>Failed to allocate memeory", __func__, __LINE__);
                }
            } else {
                /* Seek Fail, might have holes */
                fprintf(stderr, "%s:%d>Failed to seek in file", __func__, __LINE__);
            }
        } else {   
            /* File open fail*/          
            fprintf(stderr, "%s:%d>Failed to open file : %s", __func__, __LINE__,fname);
        } 
    } else {
        /* Invalid parameters */
        fprintf(stderr, "%s:%d>Invalid params", __func__, __LINE__);
    }
    return NULL;
}
