# 1 "src/auth.c"
# 1 "<built-in>" 1
# 1 "<built-in>" 3
# 331 "<built-in>" 3
# 1 "<command line>" 1
# 1 "<built-in>" 2
# 1 "src/auth.c" 2
# 1 "/usr/include/stdio.h" 1 3 4
# 64 "/usr/include/stdio.h" 3 4
# 1 "/usr/include/sys/cdefs.h" 1 3 4
# 587 "/usr/include/sys/cdefs.h" 3 4
# 1 "/usr/include/sys/_symbol_aliasing.h" 1 3 4
# 588 "/usr/include/sys/cdefs.h" 2 3 4
# 653 "/usr/include/sys/cdefs.h" 3 4
# 1 "/usr/include/sys/_posix_availability.h" 1 3 4
# 654 "/usr/include/sys/cdefs.h" 2 3 4
# 65 "/usr/include/stdio.h" 2 3 4
# 1 "/usr/include/Availability.h" 1 3 4
# 184 "/usr/include/Availability.h" 3 4
# 1 "/usr/include/AvailabilityInternal.h" 1 3 4
# 185 "/usr/include/Availability.h" 2 3 4
# 66 "/usr/include/stdio.h" 2 3 4

# 1 "/usr/include/_types.h" 1 3 4
# 27 "/usr/include/_types.h" 3 4
# 1 "/usr/include/sys/_types.h" 1 3 4
# 33 "/usr/include/sys/_types.h" 3 4
# 1 "/usr/include/machine/_types.h" 1 3 4
# 32 "/usr/include/machine/_types.h" 3 4
# 1 "/usr/include/i386/_types.h" 1 3 4
# 37 "/usr/include/i386/_types.h" 3 4
typedef signed char __int8_t;



typedef unsigned char __uint8_t;
typedef short __int16_t;
typedef unsigned short __uint16_t;
typedef int __int32_t;
typedef unsigned int __uint32_t;
typedef long long __int64_t;
typedef unsigned long long __uint64_t;

typedef long __darwin_intptr_t;
typedef unsigned int __darwin_natural_t;
# 70 "/usr/include/i386/_types.h" 3 4
typedef int __darwin_ct_rune_t;





typedef union {
 char __mbstate8[128];
 long long _mbstateL;
} __mbstate_t;

typedef __mbstate_t __darwin_mbstate_t;


typedef long int __darwin_ptrdiff_t;







typedef long unsigned int __darwin_size_t;





typedef __builtin_va_list __darwin_va_list;





typedef int __darwin_wchar_t;




typedef __darwin_wchar_t __darwin_rune_t;


typedef int __darwin_wint_t;




typedef unsigned long __darwin_clock_t;
typedef __uint32_t __darwin_socklen_t;
typedef long __darwin_ssize_t;
typedef long __darwin_time_t;
# 33 "/usr/include/machine/_types.h" 2 3 4
# 34 "/usr/include/sys/_types.h" 2 3 4
# 55 "/usr/include/sys/_types.h" 3 4
typedef __int64_t __darwin_blkcnt_t;
typedef __int32_t __darwin_blksize_t;
typedef __int32_t __darwin_dev_t;
typedef unsigned int __darwin_fsblkcnt_t;
typedef unsigned int __darwin_fsfilcnt_t;
typedef __uint32_t __darwin_gid_t;
typedef __uint32_t __darwin_id_t;
typedef __uint64_t __darwin_ino64_t;

typedef __darwin_ino64_t __darwin_ino_t;



typedef __darwin_natural_t __darwin_mach_port_name_t;
typedef __darwin_mach_port_name_t __darwin_mach_port_t;
typedef __uint16_t __darwin_mode_t;
typedef __int64_t __darwin_off_t;
typedef __int32_t __darwin_pid_t;
typedef __uint32_t __darwin_sigset_t;
typedef __int32_t __darwin_suseconds_t;
typedef __uint32_t __darwin_uid_t;
typedef __uint32_t __darwin_useconds_t;
typedef unsigned char __darwin_uuid_t[16];
typedef char __darwin_uuid_string_t[37];


# 1 "/usr/include/sys/_pthread/_pthread_types.h" 1 3 4
# 57 "/usr/include/sys/_pthread/_pthread_types.h" 3 4
struct __darwin_pthread_handler_rec {
 void (*__routine)(void *);
 void *__arg;
 struct __darwin_pthread_handler_rec *__next;
};

struct _opaque_pthread_attr_t {
 long __sig;
 char __opaque[56];
};

struct _opaque_pthread_cond_t {
 long __sig;
 char __opaque[40];
};

struct _opaque_pthread_condattr_t {
 long __sig;
 char __opaque[8];
};

struct _opaque_pthread_mutex_t {
 long __sig;
 char __opaque[56];
};

struct _opaque_pthread_mutexattr_t {
 long __sig;
 char __opaque[8];
};

struct _opaque_pthread_once_t {
 long __sig;
 char __opaque[8];
};

struct _opaque_pthread_rwlock_t {
 long __sig;
 char __opaque[192];
};

struct _opaque_pthread_rwlockattr_t {
 long __sig;
 char __opaque[16];
};

struct _opaque_pthread_t {
 long __sig;
 struct __darwin_pthread_handler_rec *__cleanup_stack;
 char __opaque[8176];
};

typedef struct _opaque_pthread_attr_t __darwin_pthread_attr_t;
typedef struct _opaque_pthread_cond_t __darwin_pthread_cond_t;
typedef struct _opaque_pthread_condattr_t __darwin_pthread_condattr_t;
typedef unsigned long __darwin_pthread_key_t;
typedef struct _opaque_pthread_mutex_t __darwin_pthread_mutex_t;
typedef struct _opaque_pthread_mutexattr_t __darwin_pthread_mutexattr_t;
typedef struct _opaque_pthread_once_t __darwin_pthread_once_t;
typedef struct _opaque_pthread_rwlock_t __darwin_pthread_rwlock_t;
typedef struct _opaque_pthread_rwlockattr_t __darwin_pthread_rwlockattr_t;
typedef struct _opaque_pthread_t *__darwin_pthread_t;
# 81 "/usr/include/sys/_types.h" 2 3 4
# 28 "/usr/include/_types.h" 2 3 4
# 39 "/usr/include/_types.h" 3 4
typedef int __darwin_nl_item;
typedef int __darwin_wctrans_t;

typedef __uint32_t __darwin_wctype_t;
# 68 "/usr/include/stdio.h" 2 3 4



# 1 "/usr/include/sys/_types/_va_list.h" 1 3 4
# 31 "/usr/include/sys/_types/_va_list.h" 3 4
typedef __darwin_va_list va_list;
# 72 "/usr/include/stdio.h" 2 3 4
# 1 "/usr/include/sys/_types/_size_t.h" 1 3 4
# 30 "/usr/include/sys/_types/_size_t.h" 3 4
typedef __darwin_size_t size_t;
# 73 "/usr/include/stdio.h" 2 3 4
# 1 "/usr/include/sys/_types/_null.h" 1 3 4
# 74 "/usr/include/stdio.h" 2 3 4

# 1 "/usr/include/sys/stdio.h" 1 3 4
# 39 "/usr/include/sys/stdio.h" 3 4
int renameat(int, const char *, int, const char *) __attribute__((availability(macosx,introduced=10.10)));






int renamex_np(const char *, const char *, unsigned int) __attribute__((availability(macosx,introduced=10.12))) __attribute__((availability(ios,introduced=10.0))) __attribute__((availability(tvos,introduced=10.0))) __attribute__((availability(watchos,introduced=3.0)));
int renameatx_np(int, const char *, int, const char *, unsigned int) __attribute__((availability(macosx,introduced=10.12))) __attribute__((availability(ios,introduced=10.0))) __attribute__((availability(tvos,introduced=10.0))) __attribute__((availability(watchos,introduced=3.0)));
# 76 "/usr/include/stdio.h" 2 3 4

typedef __darwin_off_t fpos_t;
# 88 "/usr/include/stdio.h" 3 4
struct __sbuf {
 unsigned char *_base;
 int _size;
};


struct __sFILEX;
# 122 "/usr/include/stdio.h" 3 4
typedef struct __sFILE {
 unsigned char *_p;
 int _r;
 int _w;
 short _flags;
 short _file;
 struct __sbuf _bf;
 int _lbfsize;


 void *_cookie;
 int (* _Nullable _close)(void *);
 int (* _Nullable _read) (void *, char *, int);
 fpos_t (* _Nullable _seek) (void *, fpos_t, int);
 int (* _Nullable _write)(void *, const char *, int);


 struct __sbuf _ub;
 struct __sFILEX *_extra;
 int _ur;


 unsigned char _ubuf[3];
 unsigned char _nbuf[1];


 struct __sbuf _lb;


 int _blksize;
 fpos_t _offset;
} FILE;


extern FILE *__stdinp;
extern FILE *__stdoutp;
extern FILE *__stderrp;
# 231 "/usr/include/stdio.h" 3 4
void clearerr(FILE *);
int fclose(FILE *);
int feof(FILE *);
int ferror(FILE *);
int fflush(FILE *);
int fgetc(FILE *);
int fgetpos(FILE * restrict, fpos_t *);
char *fgets(char * restrict, int, FILE *);



FILE *fopen(const char * restrict __filename, const char * restrict __mode) __asm("_" "fopen" );

int fprintf(FILE * restrict, const char * restrict, ...) __attribute__((__format__ (__printf__, 2, 3)));
int fputc(int, FILE *);
int fputs(const char * restrict, FILE * restrict) __asm("_" "fputs" );
size_t fread(void * restrict __ptr, size_t __size, size_t __nitems, FILE * restrict __stream);
FILE *freopen(const char * restrict, const char * restrict,
                 FILE * restrict) __asm("_" "freopen" );
int fscanf(FILE * restrict, const char * restrict, ...) __attribute__((__format__ (__scanf__, 2, 3)));
int fseek(FILE *, long, int);
int fsetpos(FILE *, const fpos_t *);
long ftell(FILE *);
size_t fwrite(const void * restrict __ptr, size_t __size, size_t __nitems, FILE * restrict __stream) __asm("_" "fwrite" );
int getc(FILE *);
int getchar(void);
char *gets(char *);
void perror(const char *);
int printf(const char * restrict, ...) __attribute__((__format__ (__printf__, 1, 2)));
int putc(int, FILE *);
int putchar(int);
int puts(const char *);
int remove(const char *);
int rename (const char *__old, const char *__new);
void rewind(FILE *);
int scanf(const char * restrict, ...) __attribute__((__format__ (__scanf__, 1, 2)));
void setbuf(FILE * restrict, char * restrict);
int setvbuf(FILE * restrict, char * restrict, int, size_t);
int sprintf(char * restrict, const char * restrict, ...) __attribute__((__format__ (__printf__, 2, 3))) __attribute__((__availability__(swift, unavailable, message="Use snprintf instead.")));
int sscanf(const char * restrict, const char * restrict, ...) __attribute__((__format__ (__scanf__, 2, 3)));
FILE *tmpfile(void);

__attribute__((__availability__(swift, unavailable, message="Use mkstemp(3) instead.")))

__attribute__((deprecated("This function is provided for compatibility reasons only.  Due to security concerns inherent in the design of tmpnam(3), it is highly recommended that you use mkstemp(3) instead.")))

char *tmpnam(char *);
int ungetc(int, FILE *);
int vfprintf(FILE * restrict, const char * restrict, va_list) __attribute__((__format__ (__printf__, 2, 0)));
int vprintf(const char * restrict, va_list) __attribute__((__format__ (__printf__, 1, 0)));
int vsprintf(char * restrict, const char * restrict, va_list) __attribute__((__format__ (__printf__, 2, 0))) __attribute__((__availability__(swift, unavailable, message="Use vsnprintf instead.")));
# 297 "/usr/include/stdio.h" 3 4
char *ctermid(char *);





FILE *fdopen(int, const char *) __asm("_" "fdopen" );

int fileno(FILE *);
# 321 "/usr/include/stdio.h" 3 4
int pclose(FILE *) __attribute__((__availability__(swift, unavailable, message="Use posix_spawn APIs or NSTask instead.")));



FILE *popen(const char *, const char *) __asm("_" "popen" ) __attribute__((__availability__(swift, unavailable, message="Use posix_spawn APIs or NSTask instead.")));
# 342 "/usr/include/stdio.h" 3 4
int __srget(FILE *);
int __svfscanf(FILE *, const char *, va_list) __attribute__((__format__ (__scanf__, 2, 0)));
int __swbuf(int, FILE *);
# 353 "/usr/include/stdio.h" 3 4
inline __attribute__ ((__always_inline__)) int __sputc(int _c, FILE *_p) {
 if (--_p->_w >= 0 || (_p->_w >= _p->_lbfsize && (char)_c != '\n'))
  return (*_p->_p++ = _c);
 else
  return (__swbuf(_c, _p));
}
# 379 "/usr/include/stdio.h" 3 4
void flockfile(FILE *);
int ftrylockfile(FILE *);
void funlockfile(FILE *);
int getc_unlocked(FILE *);
int getchar_unlocked(void);
int putc_unlocked(int, FILE *);
int putchar_unlocked(int);



int getw(FILE *);
int putw(int, FILE *);


__attribute__((__availability__(swift, unavailable, message="Use mkstemp(3) instead.")))

__attribute__((deprecated("This function is provided for compatibility reasons only.  Due to security concerns inherent in the design of tempnam(3), it is highly recommended that you use mkstemp(3) instead.")))

char *tempnam(const char *__dir, const char *__prefix) __asm("_" "tempnam" );
# 417 "/usr/include/stdio.h" 3 4
# 1 "/usr/include/sys/_types/_off_t.h" 1 3 4
# 30 "/usr/include/sys/_types/_off_t.h" 3 4
typedef __darwin_off_t off_t;
# 418 "/usr/include/stdio.h" 2 3 4


int fseeko(FILE * __stream, off_t __offset, int __whence);
off_t ftello(FILE * __stream);





int snprintf(char * restrict __str, size_t __size, const char * restrict __format, ...) __attribute__((__format__ (__printf__, 3, 4)));
int vfscanf(FILE * restrict __stream, const char * restrict __format, va_list) __attribute__((__format__ (__scanf__, 2, 0)));
int vscanf(const char * restrict __format, va_list) __attribute__((__format__ (__scanf__, 1, 0)));
int vsnprintf(char * restrict __str, size_t __size, const char * restrict __format, va_list) __attribute__((__format__ (__printf__, 3, 0)));
int vsscanf(const char * restrict __str, const char * restrict __format, va_list) __attribute__((__format__ (__scanf__, 2, 0)));
# 442 "/usr/include/stdio.h" 3 4
# 1 "/usr/include/sys/_types/_ssize_t.h" 1 3 4
# 30 "/usr/include/sys/_types/_ssize_t.h" 3 4
typedef __darwin_ssize_t ssize_t;
# 443 "/usr/include/stdio.h" 2 3 4


int dprintf(int, const char * restrict, ...) __attribute__((__format__ (__printf__, 2, 3))) __attribute__((availability(macosx,introduced=10.7)));
int vdprintf(int, const char * restrict, va_list) __attribute__((__format__ (__printf__, 2, 0))) __attribute__((availability(macosx,introduced=10.7)));
ssize_t getdelim(char ** restrict __linep, size_t * restrict __linecapp, int __delimiter, FILE * restrict __stream) __attribute__((availability(macosx,introduced=10.7)));
ssize_t getline(char ** restrict __linep, size_t * restrict __linecapp, FILE * restrict __stream) __attribute__((availability(macosx,introduced=10.7)));
# 458 "/usr/include/stdio.h" 3 4
extern const int sys_nerr;
extern const char *const sys_errlist[];

int asprintf(char ** restrict, const char * restrict, ...) __attribute__((__format__ (__printf__, 2, 3)));
char *ctermid_r(char *);
char *fgetln(FILE *, size_t *);
const char *fmtcheck(const char *, const char *);
int fpurge(FILE *);
void setbuffer(FILE *, char *, int);
int setlinebuf(FILE *);
int vasprintf(char ** restrict, const char * restrict, va_list) __attribute__((__format__ (__printf__, 2, 0)));
FILE *zopen(const char *, const char *, int);





FILE *funopen(const void *,
                 int (* _Nullable)(void *, char *, int),
                 int (* _Nullable)(void *, const char *, int),
                 fpos_t (* _Nullable)(void *, fpos_t, int),
                 int (* _Nullable)(void *));
# 498 "/usr/include/stdio.h" 3 4
# 1 "/usr/include/secure/_stdio.h" 1 3 4
# 31 "/usr/include/secure/_stdio.h" 3 4
# 1 "/usr/include/secure/_common.h" 1 3 4
# 32 "/usr/include/secure/_stdio.h" 2 3 4
# 42 "/usr/include/secure/_stdio.h" 3 4
extern int __sprintf_chk (char * restrict, int, size_t,
     const char * restrict, ...);
# 52 "/usr/include/secure/_stdio.h" 3 4
extern int __snprintf_chk (char * restrict, size_t, int, size_t,
      const char * restrict, ...);







extern int __vsprintf_chk (char * restrict, int, size_t,
      const char * restrict, va_list);







extern int __vsnprintf_chk (char * restrict, size_t, int, size_t,
       const char * restrict, va_list);
# 499 "/usr/include/stdio.h" 2 3 4
# 2 "src/auth.c" 2
# 1 "/usr/include/curl/curl.h" 1 3 4
# 37 "/usr/include/curl/curl.h" 3 4
# 1 "/usr/include/curl/curlver.h" 1 3 4
# 38 "/usr/include/curl/curl.h" 2 3 4
# 1 "/usr/include/curl/curlbuild.h" 1 3 4
# 131 "/usr/include/curl/curlbuild.h" 3 4
# 1 "/usr/include/sys/types.h" 1 3 4
# 72 "/usr/include/sys/types.h" 3 4
# 1 "/usr/include/sys/appleapiopts.h" 1 3 4
# 73 "/usr/include/sys/types.h" 2 3 4





# 1 "/usr/include/machine/types.h" 1 3 4
# 35 "/usr/include/machine/types.h" 3 4
# 1 "/usr/include/i386/types.h" 1 3 4
# 76 "/usr/include/i386/types.h" 3 4
# 1 "/usr/include/sys/_types/_int8_t.h" 1 3 4
# 30 "/usr/include/sys/_types/_int8_t.h" 3 4
typedef signed char int8_t;
# 77 "/usr/include/i386/types.h" 2 3 4
# 1 "/usr/include/sys/_types/_int16_t.h" 1 3 4
# 30 "/usr/include/sys/_types/_int16_t.h" 3 4
typedef short int16_t;
# 78 "/usr/include/i386/types.h" 2 3 4
# 1 "/usr/include/sys/_types/_int32_t.h" 1 3 4
# 30 "/usr/include/sys/_types/_int32_t.h" 3 4
typedef int int32_t;
# 79 "/usr/include/i386/types.h" 2 3 4
# 1 "/usr/include/sys/_types/_int64_t.h" 1 3 4
# 30 "/usr/include/sys/_types/_int64_t.h" 3 4
typedef long long int64_t;
# 80 "/usr/include/i386/types.h" 2 3 4

# 1 "/usr/include/sys/_types/_u_int8_t.h" 1 3 4
# 30 "/usr/include/sys/_types/_u_int8_t.h" 3 4
typedef unsigned char u_int8_t;
# 82 "/usr/include/i386/types.h" 2 3 4
# 1 "/usr/include/sys/_types/_u_int16_t.h" 1 3 4
# 30 "/usr/include/sys/_types/_u_int16_t.h" 3 4
typedef unsigned short u_int16_t;
# 83 "/usr/include/i386/types.h" 2 3 4
# 1 "/usr/include/sys/_types/_u_int32_t.h" 1 3 4
# 30 "/usr/include/sys/_types/_u_int32_t.h" 3 4
typedef unsigned int u_int32_t;
# 84 "/usr/include/i386/types.h" 2 3 4
# 1 "/usr/include/sys/_types/_u_int64_t.h" 1 3 4
# 30 "/usr/include/sys/_types/_u_int64_t.h" 3 4
typedef unsigned long long u_int64_t;
# 85 "/usr/include/i386/types.h" 2 3 4


typedef int64_t register_t;





# 1 "/usr/include/sys/_types/_intptr_t.h" 1 3 4
# 30 "/usr/include/sys/_types/_intptr_t.h" 3 4
typedef __darwin_intptr_t intptr_t;
# 93 "/usr/include/i386/types.h" 2 3 4
# 1 "/usr/include/sys/_types/_uintptr_t.h" 1 3 4
# 30 "/usr/include/sys/_types/_uintptr_t.h" 3 4
typedef unsigned long uintptr_t;
# 94 "/usr/include/i386/types.h" 2 3 4



typedef u_int64_t user_addr_t;
typedef u_int64_t user_size_t;
typedef int64_t user_ssize_t;
typedef int64_t user_long_t;
typedef u_int64_t user_ulong_t;
typedef int64_t user_time_t;
typedef int64_t user_off_t;







typedef u_int64_t syscall_arg_t;
# 36 "/usr/include/machine/types.h" 2 3 4
# 79 "/usr/include/sys/types.h" 2 3 4


# 1 "/usr/include/machine/endian.h" 1 3 4
# 35 "/usr/include/machine/endian.h" 3 4
# 1 "/usr/include/i386/endian.h" 1 3 4
# 99 "/usr/include/i386/endian.h" 3 4
# 1 "/usr/include/sys/_endian.h" 1 3 4
# 130 "/usr/include/sys/_endian.h" 3 4
# 1 "/usr/include/libkern/_OSByteOrder.h" 1 3 4
# 66 "/usr/include/libkern/_OSByteOrder.h" 3 4
# 1 "/usr/include/libkern/i386/_OSByteOrder.h" 1 3 4
# 44 "/usr/include/libkern/i386/_OSByteOrder.h" 3 4
static inline
__uint16_t
_OSSwapInt16(
    __uint16_t _data
)
{
    return ((__uint16_t)((_data << 8) | (_data >> 8)));
}

static inline
__uint32_t
_OSSwapInt32(
    __uint32_t _data
)
{

    return __builtin_bswap32(_data);




}


static inline
__uint64_t
_OSSwapInt64(
    __uint64_t _data
)
{
    return __builtin_bswap64(_data);
}
# 67 "/usr/include/libkern/_OSByteOrder.h" 2 3 4
# 131 "/usr/include/sys/_endian.h" 2 3 4
# 100 "/usr/include/i386/endian.h" 2 3 4
# 36 "/usr/include/machine/endian.h" 2 3 4
# 82 "/usr/include/sys/types.h" 2 3 4


typedef unsigned char u_char;
typedef unsigned short u_short;
typedef unsigned int u_int;

typedef unsigned long u_long;


typedef unsigned short ushort;
typedef unsigned int uint;


typedef u_int64_t u_quad_t;
typedef int64_t quad_t;
typedef quad_t * qaddr_t;

typedef char * caddr_t;
typedef int32_t daddr_t;


# 1 "/usr/include/sys/_types/_dev_t.h" 1 3 4
# 30 "/usr/include/sys/_types/_dev_t.h" 3 4
typedef __darwin_dev_t dev_t;
# 103 "/usr/include/sys/types.h" 2 3 4

typedef u_int32_t fixpt_t;


# 1 "/usr/include/sys/_types/_blkcnt_t.h" 1 3 4
# 30 "/usr/include/sys/_types/_blkcnt_t.h" 3 4
typedef __darwin_blkcnt_t blkcnt_t;
# 107 "/usr/include/sys/types.h" 2 3 4
# 1 "/usr/include/sys/_types/_blksize_t.h" 1 3 4
# 30 "/usr/include/sys/_types/_blksize_t.h" 3 4
typedef __darwin_blksize_t blksize_t;
# 108 "/usr/include/sys/types.h" 2 3 4
# 1 "/usr/include/sys/_types/_gid_t.h" 1 3 4
# 30 "/usr/include/sys/_types/_gid_t.h" 3 4
typedef __darwin_gid_t gid_t;
# 109 "/usr/include/sys/types.h" 2 3 4
# 1 "/usr/include/sys/_types/_in_addr_t.h" 1 3 4
# 30 "/usr/include/sys/_types/_in_addr_t.h" 3 4
typedef __uint32_t in_addr_t;
# 110 "/usr/include/sys/types.h" 2 3 4
# 1 "/usr/include/sys/_types/_in_port_t.h" 1 3 4
# 30 "/usr/include/sys/_types/_in_port_t.h" 3 4
typedef __uint16_t in_port_t;
# 111 "/usr/include/sys/types.h" 2 3 4
# 1 "/usr/include/sys/_types/_ino_t.h" 1 3 4
# 30 "/usr/include/sys/_types/_ino_t.h" 3 4
typedef __darwin_ino_t ino_t;
# 112 "/usr/include/sys/types.h" 2 3 4


# 1 "/usr/include/sys/_types/_ino64_t.h" 1 3 4
# 30 "/usr/include/sys/_types/_ino64_t.h" 3 4
typedef __darwin_ino64_t ino64_t;
# 115 "/usr/include/sys/types.h" 2 3 4


# 1 "/usr/include/sys/_types/_key_t.h" 1 3 4
# 30 "/usr/include/sys/_types/_key_t.h" 3 4
typedef __int32_t key_t;
# 118 "/usr/include/sys/types.h" 2 3 4
# 1 "/usr/include/sys/_types/_mode_t.h" 1 3 4
# 30 "/usr/include/sys/_types/_mode_t.h" 3 4
typedef __darwin_mode_t mode_t;
# 119 "/usr/include/sys/types.h" 2 3 4
# 1 "/usr/include/sys/_types/_nlink_t.h" 1 3 4
# 30 "/usr/include/sys/_types/_nlink_t.h" 3 4
typedef __uint16_t nlink_t;
# 120 "/usr/include/sys/types.h" 2 3 4
# 1 "/usr/include/sys/_types/_id_t.h" 1 3 4
# 30 "/usr/include/sys/_types/_id_t.h" 3 4
typedef __darwin_id_t id_t;
# 121 "/usr/include/sys/types.h" 2 3 4
# 1 "/usr/include/sys/_types/_pid_t.h" 1 3 4
# 30 "/usr/include/sys/_types/_pid_t.h" 3 4
typedef __darwin_pid_t pid_t;
# 122 "/usr/include/sys/types.h" 2 3 4


typedef int32_t segsz_t;
typedef int32_t swblk_t;


# 1 "/usr/include/sys/_types/_uid_t.h" 1 3 4
# 30 "/usr/include/sys/_types/_uid_t.h" 3 4
typedef __darwin_uid_t uid_t;
# 128 "/usr/include/sys/types.h" 2 3 4
# 161 "/usr/include/sys/types.h" 3 4
# 1 "/usr/include/sys/_types/_clock_t.h" 1 3 4
# 30 "/usr/include/sys/_types/_clock_t.h" 3 4
typedef __darwin_clock_t clock_t;
# 162 "/usr/include/sys/types.h" 2 3 4


# 1 "/usr/include/sys/_types/_time_t.h" 1 3 4
# 30 "/usr/include/sys/_types/_time_t.h" 3 4
typedef __darwin_time_t time_t;
# 165 "/usr/include/sys/types.h" 2 3 4

# 1 "/usr/include/sys/_types/_useconds_t.h" 1 3 4
# 30 "/usr/include/sys/_types/_useconds_t.h" 3 4
typedef __darwin_useconds_t useconds_t;
# 167 "/usr/include/sys/types.h" 2 3 4
# 1 "/usr/include/sys/_types/_suseconds_t.h" 1 3 4
# 30 "/usr/include/sys/_types/_suseconds_t.h" 3 4
typedef __darwin_suseconds_t suseconds_t;
# 168 "/usr/include/sys/types.h" 2 3 4


# 1 "/usr/include/sys/_types/_rsize_t.h" 1 3 4
# 30 "/usr/include/sys/_types/_rsize_t.h" 3 4
typedef __darwin_size_t rsize_t;
# 171 "/usr/include/sys/types.h" 2 3 4
# 1 "/usr/include/sys/_types/_errno_t.h" 1 3 4
# 30 "/usr/include/sys/_types/_errno_t.h" 3 4
typedef int errno_t;
# 172 "/usr/include/sys/types.h" 2 3 4








# 1 "/usr/include/sys/_types/_fd_def.h" 1 3 4
# 46 "/usr/include/sys/_types/_fd_def.h" 3 4
typedef struct fd_set {
 __int32_t fds_bits[((((1024) % ((sizeof(__int32_t) * 8))) == 0) ? ((1024) / ((sizeof(__int32_t) * 8))) : (((1024) / ((sizeof(__int32_t) * 8))) + 1))];
} fd_set;



static __inline int
__darwin_fd_isset(int _n, const struct fd_set *_p)
{
 return (_p->fds_bits[(unsigned long)_n/(sizeof(__int32_t) * 8)] & ((__int32_t)(((unsigned long)1)<<((unsigned long)_n % (sizeof(__int32_t) * 8)))));
}
# 181 "/usr/include/sys/types.h" 2 3 4




typedef __int32_t fd_mask;








# 1 "/usr/include/sys/_types/_fd_setsize.h" 1 3 4
# 194 "/usr/include/sys/types.h" 2 3 4
# 1 "/usr/include/sys/_types/_fd_set.h" 1 3 4
# 195 "/usr/include/sys/types.h" 2 3 4
# 1 "/usr/include/sys/_types/_fd_clr.h" 1 3 4
# 196 "/usr/include/sys/types.h" 2 3 4
# 1 "/usr/include/sys/_types/_fd_zero.h" 1 3 4
# 197 "/usr/include/sys/types.h" 2 3 4
# 1 "/usr/include/sys/_types/_fd_isset.h" 1 3 4
# 198 "/usr/include/sys/types.h" 2 3 4


# 1 "/usr/include/sys/_types/_fd_copy.h" 1 3 4
# 201 "/usr/include/sys/types.h" 2 3 4
# 211 "/usr/include/sys/types.h" 3 4
# 1 "/usr/include/sys/_pthread/_pthread_attr_t.h" 1 3 4
# 30 "/usr/include/sys/_pthread/_pthread_attr_t.h" 3 4
typedef __darwin_pthread_attr_t pthread_attr_t;
# 212 "/usr/include/sys/types.h" 2 3 4
# 1 "/usr/include/sys/_pthread/_pthread_cond_t.h" 1 3 4
# 30 "/usr/include/sys/_pthread/_pthread_cond_t.h" 3 4
typedef __darwin_pthread_cond_t pthread_cond_t;
# 213 "/usr/include/sys/types.h" 2 3 4
# 1 "/usr/include/sys/_pthread/_pthread_condattr_t.h" 1 3 4
# 30 "/usr/include/sys/_pthread/_pthread_condattr_t.h" 3 4
typedef __darwin_pthread_condattr_t pthread_condattr_t;
# 214 "/usr/include/sys/types.h" 2 3 4
# 1 "/usr/include/sys/_pthread/_pthread_mutex_t.h" 1 3 4
# 30 "/usr/include/sys/_pthread/_pthread_mutex_t.h" 3 4
typedef __darwin_pthread_mutex_t pthread_mutex_t;
# 215 "/usr/include/sys/types.h" 2 3 4
# 1 "/usr/include/sys/_pthread/_pthread_mutexattr_t.h" 1 3 4
# 30 "/usr/include/sys/_pthread/_pthread_mutexattr_t.h" 3 4
typedef __darwin_pthread_mutexattr_t pthread_mutexattr_t;
# 216 "/usr/include/sys/types.h" 2 3 4
# 1 "/usr/include/sys/_pthread/_pthread_once_t.h" 1 3 4
# 30 "/usr/include/sys/_pthread/_pthread_once_t.h" 3 4
typedef __darwin_pthread_once_t pthread_once_t;
# 217 "/usr/include/sys/types.h" 2 3 4
# 1 "/usr/include/sys/_pthread/_pthread_rwlock_t.h" 1 3 4
# 30 "/usr/include/sys/_pthread/_pthread_rwlock_t.h" 3 4
typedef __darwin_pthread_rwlock_t pthread_rwlock_t;
# 218 "/usr/include/sys/types.h" 2 3 4
# 1 "/usr/include/sys/_pthread/_pthread_rwlockattr_t.h" 1 3 4
# 30 "/usr/include/sys/_pthread/_pthread_rwlockattr_t.h" 3 4
typedef __darwin_pthread_rwlockattr_t pthread_rwlockattr_t;
# 219 "/usr/include/sys/types.h" 2 3 4
# 1 "/usr/include/sys/_pthread/_pthread_t.h" 1 3 4
# 30 "/usr/include/sys/_pthread/_pthread_t.h" 3 4
typedef __darwin_pthread_t pthread_t;
# 220 "/usr/include/sys/types.h" 2 3 4



# 1 "/usr/include/sys/_pthread/_pthread_key_t.h" 1 3 4
# 30 "/usr/include/sys/_pthread/_pthread_key_t.h" 3 4
typedef __darwin_pthread_key_t pthread_key_t;
# 224 "/usr/include/sys/types.h" 2 3 4




# 1 "/usr/include/sys/_types/_fsblkcnt_t.h" 1 3 4
# 30 "/usr/include/sys/_types/_fsblkcnt_t.h" 3 4
typedef __darwin_fsblkcnt_t fsblkcnt_t;
# 229 "/usr/include/sys/types.h" 2 3 4
# 1 "/usr/include/sys/_types/_fsfilcnt_t.h" 1 3 4
# 30 "/usr/include/sys/_types/_fsfilcnt_t.h" 3 4
typedef __darwin_fsfilcnt_t fsfilcnt_t;
# 230 "/usr/include/sys/types.h" 2 3 4
# 132 "/usr/include/curl/curlbuild.h" 2 3 4






# 1 "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/../lib/clang/8.0.0/include/stdint.h" 1 3 4
# 63 "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/../lib/clang/8.0.0/include/stdint.h" 3 4
# 1 "/usr/include/stdint.h" 1 3 4
# 23 "/usr/include/stdint.h" 3 4
# 1 "/usr/include/_types/_uint8_t.h" 1 3 4
# 31 "/usr/include/_types/_uint8_t.h" 3 4
typedef unsigned char uint8_t;
# 24 "/usr/include/stdint.h" 2 3 4
# 1 "/usr/include/_types/_uint16_t.h" 1 3 4
# 31 "/usr/include/_types/_uint16_t.h" 3 4
typedef unsigned short uint16_t;
# 25 "/usr/include/stdint.h" 2 3 4
# 1 "/usr/include/_types/_uint32_t.h" 1 3 4
# 31 "/usr/include/_types/_uint32_t.h" 3 4
typedef unsigned int uint32_t;
# 26 "/usr/include/stdint.h" 2 3 4
# 1 "/usr/include/_types/_uint64_t.h" 1 3 4
# 31 "/usr/include/_types/_uint64_t.h" 3 4
typedef unsigned long long uint64_t;
# 27 "/usr/include/stdint.h" 2 3 4


typedef int8_t int_least8_t;
typedef int16_t int_least16_t;
typedef int32_t int_least32_t;
typedef int64_t int_least64_t;
typedef uint8_t uint_least8_t;
typedef uint16_t uint_least16_t;
typedef uint32_t uint_least32_t;
typedef uint64_t uint_least64_t;



typedef int8_t int_fast8_t;
typedef int16_t int_fast16_t;
typedef int32_t int_fast32_t;
typedef int64_t int_fast64_t;
typedef uint8_t uint_fast8_t;
typedef uint16_t uint_fast16_t;
typedef uint32_t uint_fast32_t;
typedef uint64_t uint_fast64_t;
# 58 "/usr/include/stdint.h" 3 4
# 1 "/usr/include/_types/_intmax_t.h" 1 3 4
# 32 "/usr/include/_types/_intmax_t.h" 3 4
typedef long int intmax_t;
# 59 "/usr/include/stdint.h" 2 3 4
# 1 "/usr/include/_types/_uintmax_t.h" 1 3 4
# 32 "/usr/include/_types/_uintmax_t.h" 3 4
typedef long unsigned int uintmax_t;
# 60 "/usr/include/stdint.h" 2 3 4
# 64 "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/../lib/clang/8.0.0/include/stdint.h" 2 3 4
# 139 "/usr/include/curl/curlbuild.h" 2 3 4






# 1 "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/../lib/clang/8.0.0/include/inttypes.h" 1 3 4
# 26 "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/../lib/clang/8.0.0/include/inttypes.h" 3 4
# 1 "/usr/include/inttypes.h" 1 3 4
# 227 "/usr/include/inttypes.h" 3 4
# 1 "/usr/include/sys/_types/_wchar_t.h" 1 3 4
# 33 "/usr/include/sys/_types/_wchar_t.h" 3 4
typedef __darwin_wchar_t wchar_t;
# 228 "/usr/include/inttypes.h" 2 3 4






__attribute__((availability(macosx,introduced=10.4)))
extern intmax_t
imaxabs(intmax_t j);


typedef struct {
 intmax_t quot;
 intmax_t rem;
} imaxdiv_t;

__attribute__((availability(macosx,introduced=10.4)))
extern imaxdiv_t
imaxdiv(intmax_t __numer, intmax_t __denom);


__attribute__((availability(macosx,introduced=10.4)))
extern intmax_t
strtoimax(const char * restrict __nptr,
   char ** restrict __endptr,
   int __base);

__attribute__((availability(macosx,introduced=10.4)))
extern uintmax_t
strtoumax(const char * restrict __nptr,
   char ** restrict __endptr,
   int __base);


__attribute__((availability(macosx,introduced=10.4)))
extern intmax_t
wcstoimax(const wchar_t * restrict __nptr,
   wchar_t ** restrict __endptr,
   int __base);

__attribute__((availability(macosx,introduced=10.4)))
extern uintmax_t
wcstoumax(const wchar_t * restrict __nptr,
   wchar_t ** restrict __endptr,
   int __base);
# 27 "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/../lib/clang/8.0.0/include/inttypes.h" 2 3 4
# 146 "/usr/include/curl/curlbuild.h" 2 3 4






# 1 "/usr/include/sys/socket.h" 1 3 4
# 77 "/usr/include/sys/socket.h" 3 4
# 1 "/usr/include/machine/_param.h" 1 3 4
# 29 "/usr/include/machine/_param.h" 3 4
# 1 "/usr/include/i386/_param.h" 1 3 4
# 30 "/usr/include/machine/_param.h" 2 3 4
# 78 "/usr/include/sys/socket.h" 2 3 4
# 1 "/usr/include/net/net_kev.h" 1 3 4
# 79 "/usr/include/sys/socket.h" 2 3 4
# 94 "/usr/include/sys/socket.h" 3 4
# 1 "/usr/include/sys/_types/_sa_family_t.h" 1 3 4
# 30 "/usr/include/sys/_types/_sa_family_t.h" 3 4
typedef __uint8_t sa_family_t;
# 95 "/usr/include/sys/socket.h" 2 3 4
# 1 "/usr/include/sys/_types/_socklen_t.h" 1 3 4
# 30 "/usr/include/sys/_types/_socklen_t.h" 3 4
typedef __darwin_socklen_t socklen_t;
# 96 "/usr/include/sys/socket.h" 2 3 4
# 106 "/usr/include/sys/socket.h" 3 4
# 1 "/usr/include/sys/_types/_iovec_t.h" 1 3 4
# 30 "/usr/include/sys/_types/_iovec_t.h" 3 4
struct iovec {
 void * iov_base;
 size_t iov_len;
};
# 107 "/usr/include/sys/socket.h" 2 3 4
# 286 "/usr/include/sys/socket.h" 3 4
typedef __uint32_t sae_associd_t;



typedef __uint32_t sae_connid_t;
# 299 "/usr/include/sys/socket.h" 3 4
typedef struct sa_endpoints {
 unsigned int sae_srcif;
 const struct sockaddr *sae_srcaddr;
 socklen_t sae_srcaddrlen;
 const struct sockaddr *sae_dstaddr;
 socklen_t sae_dstaddrlen;
} sa_endpoints_t;





struct linger {
 int l_onoff;
 int l_linger;
};
# 329 "/usr/include/sys/socket.h" 3 4
struct so_np_extensions {
 u_int32_t npx_flags;
 u_int32_t npx_mask;
};
# 403 "/usr/include/sys/socket.h" 3 4
struct sockaddr {
 __uint8_t sa_len;
 sa_family_t sa_family;
 char sa_data[14];
};
# 416 "/usr/include/sys/socket.h" 3 4
struct sockproto {
 __uint16_t sp_family;
 __uint16_t sp_protocol;
};
# 436 "/usr/include/sys/socket.h" 3 4
struct sockaddr_storage {
 __uint8_t ss_len;
 sa_family_t ss_family;
 char __ss_pad1[((sizeof(__int64_t)) - sizeof(__uint8_t) - sizeof(sa_family_t))];
 __int64_t __ss_align;
 char __ss_pad2[(128 - sizeof(__uint8_t) - sizeof(sa_family_t) - ((sizeof(__int64_t)) - sizeof(__uint8_t) - sizeof(sa_family_t)) - (sizeof(__int64_t)))];
};
# 536 "/usr/include/sys/socket.h" 3 4
struct msghdr {
 void *msg_name;
 socklen_t msg_namelen;
 struct iovec *msg_iov;
 int msg_iovlen;
 void *msg_control;
 socklen_t msg_controllen;
 int msg_flags;
};
# 577 "/usr/include/sys/socket.h" 3 4
struct cmsghdr {
 socklen_t cmsg_len;
 int cmsg_level;
 int cmsg_type;

};
# 668 "/usr/include/sys/socket.h" 3 4
struct sf_hdtr {
 struct iovec *headers;
 int hdr_cnt;
 struct iovec *trailers;
 int trl_cnt;
};







int accept(int, struct sockaddr * restrict, socklen_t * restrict)
  __asm("_" "accept" );
int bind(int, const struct sockaddr *, socklen_t) __asm("_" "bind" );
int connect(int, const struct sockaddr *, socklen_t) __asm("_" "connect" );
int getpeername(int, struct sockaddr * restrict, socklen_t * restrict)
  __asm("_" "getpeername" );
int getsockname(int, struct sockaddr * restrict, socklen_t * restrict)
  __asm("_" "getsockname" );
int getsockopt(int, int, int, void * restrict, socklen_t * restrict);
int listen(int, int) __asm("_" "listen" );
ssize_t recv(int, void *, size_t, int) __asm("_" "recv" );
ssize_t recvfrom(int, void *, size_t, int, struct sockaddr * restrict,
  socklen_t * restrict) __asm("_" "recvfrom" );
ssize_t recvmsg(int, struct msghdr *, int) __asm("_" "recvmsg" );
ssize_t send(int, const void *, size_t, int) __asm("_" "send" );
ssize_t sendmsg(int, const struct msghdr *, int) __asm("_" "sendmsg" );
ssize_t sendto(int, const void *, size_t,
  int, const struct sockaddr *, socklen_t) __asm("_" "sendto" );
int setsockopt(int, int, int, const void *, socklen_t);
int shutdown(int, int);
int sockatmark(int) __attribute__((availability(macosx,introduced=10.5)));
int socket(int, int, int);
int socketpair(int, int, int, int *) __asm("_" "socketpair" );


int sendfile(int, int, off_t, off_t *, struct sf_hdtr *, int);



void pfctlinput(int, struct sockaddr *);
int connectx(int, const sa_endpoints_t *, sae_associd_t, unsigned int,
    const struct iovec *, unsigned int, size_t *, sae_connid_t *);
int disconnectx(int, sae_associd_t, sae_connid_t);
# 153 "/usr/include/curl/curlbuild.h" 2 3 4
# 176 "/usr/include/curl/curlbuild.h" 3 4
typedef socklen_t curl_socklen_t;





typedef int64_t curl_off_t;
# 39 "/usr/include/curl/curl.h" 2 3 4
# 1 "/usr/include/curl/curlrules.h" 1 3 4
# 141 "/usr/include/curl/curlrules.h" 3 4
typedef char
  __curl_rule_01__
    [sizeof(long) == 8 ? 1 : -1];







typedef char
  __curl_rule_02__
    [sizeof(curl_off_t) == 8 ? 1 : -1];







typedef char
  __curl_rule_03__
    [sizeof(curl_off_t) >= sizeof(long) ? 1 : -1];







typedef char
  __curl_rule_04__
    [sizeof(curl_socklen_t) == 4 ? 1 : -1];







typedef char
  __curl_rule_05__
    [sizeof(curl_socklen_t) >= sizeof(int) ? 1 : -1];
# 40 "/usr/include/curl/curl.h" 2 3 4
# 51 "/usr/include/curl/curl.h" 3 4
# 1 "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/../lib/clang/8.0.0/include/limits.h" 1 3 4
# 37 "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/../lib/clang/8.0.0/include/limits.h" 3 4
# 1 "/usr/include/limits.h" 1 3 4
# 64 "/usr/include/limits.h" 3 4
# 1 "/usr/include/machine/limits.h" 1 3 4





# 1 "/usr/include/i386/limits.h" 1 3 4
# 40 "/usr/include/i386/limits.h" 3 4
# 1 "/usr/include/i386/_limits.h" 1 3 4
# 41 "/usr/include/i386/limits.h" 2 3 4
# 7 "/usr/include/machine/limits.h" 2 3 4
# 65 "/usr/include/limits.h" 2 3 4
# 1 "/usr/include/sys/syslimits.h" 1 3 4
# 66 "/usr/include/limits.h" 2 3 4
# 38 "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/../lib/clang/8.0.0/include/limits.h" 2 3 4
# 52 "/usr/include/curl/curl.h" 2 3 4








# 1 "/usr/include/time.h" 1 3 4
# 72 "/usr/include/time.h" 3 4
# 1 "/usr/include/sys/_types/_timespec.h" 1 3 4
# 30 "/usr/include/sys/_types/_timespec.h" 3 4
struct timespec
{
 __darwin_time_t tv_sec;
 long tv_nsec;
};
# 73 "/usr/include/time.h" 2 3 4

struct tm {
 int tm_sec;
 int tm_min;
 int tm_hour;
 int tm_mday;
 int tm_mon;
 int tm_year;
 int tm_wday;
 int tm_yday;
 int tm_isdst;
 long tm_gmtoff;
 char *tm_zone;
};
# 97 "/usr/include/time.h" 3 4
extern char *tzname[];


extern int getdate_err;

extern long timezone __asm("_" "timezone" );

extern int daylight;


char *asctime(const struct tm *);
clock_t clock(void) __asm("_" "clock" );
char *ctime(const time_t *);
double difftime(time_t, time_t);
struct tm *getdate(const char *);
struct tm *gmtime(const time_t *);
struct tm *localtime(const time_t *);
time_t mktime(struct tm *) __asm("_" "mktime" );
size_t strftime(char * restrict, size_t, const char * restrict, const struct tm * restrict) __asm("_" "strftime" );
char *strptime(const char * restrict, const char * restrict, struct tm * restrict) __asm("_" "strptime" );
time_t time(time_t *);


void tzset(void);



char *asctime_r(const struct tm * restrict, char * restrict);
char *ctime_r(const time_t *, char *);
struct tm *gmtime_r(const time_t * restrict, struct tm * restrict);
struct tm *localtime_r(const time_t * restrict, struct tm * restrict);


time_t posix2time(time_t);



void tzsetwall(void);
time_t time2posix(time_t);
time_t timelocal(struct tm * const);
time_t timegm(struct tm * const);



int nanosleep(const struct timespec *__rqtp, struct timespec *__rmtp) __asm("_" "nanosleep" );
# 152 "/usr/include/time.h" 3 4
typedef enum {
_CLOCK_REALTIME __attribute__((availability(macosx,introduced=10.12))) __attribute__((availability(ios,introduced=10.0))) __attribute__((availability(tvos,introduced=10.0))) __attribute__((availability(watchos,introduced=3.0))) = 0,

_CLOCK_MONOTONIC __attribute__((availability(macosx,introduced=10.12))) __attribute__((availability(ios,introduced=10.0))) __attribute__((availability(tvos,introduced=10.0))) __attribute__((availability(watchos,introduced=3.0))) = 6,


_CLOCK_MONOTONIC_RAW __attribute__((availability(macosx,introduced=10.12))) __attribute__((availability(ios,introduced=10.0))) __attribute__((availability(tvos,introduced=10.0))) __attribute__((availability(watchos,introduced=3.0))) = 4,

_CLOCK_MONOTONIC_RAW_APPROX __attribute__((availability(macosx,introduced=10.12))) __attribute__((availability(ios,introduced=10.0))) __attribute__((availability(tvos,introduced=10.0))) __attribute__((availability(watchos,introduced=3.0))) = 5,

_CLOCK_UPTIME_RAW __attribute__((availability(macosx,introduced=10.12))) __attribute__((availability(ios,introduced=10.0))) __attribute__((availability(tvos,introduced=10.0))) __attribute__((availability(watchos,introduced=3.0))) = 8,

_CLOCK_UPTIME_RAW_APPROX __attribute__((availability(macosx,introduced=10.12))) __attribute__((availability(ios,introduced=10.0))) __attribute__((availability(tvos,introduced=10.0))) __attribute__((availability(watchos,introduced=3.0))) = 9,


_CLOCK_PROCESS_CPUTIME_ID __attribute__((availability(macosx,introduced=10.12))) __attribute__((availability(ios,introduced=10.0))) __attribute__((availability(tvos,introduced=10.0))) __attribute__((availability(watchos,introduced=3.0))) = 12,

_CLOCK_THREAD_CPUTIME_ID __attribute__((availability(macosx,introduced=10.12))) __attribute__((availability(ios,introduced=10.0))) __attribute__((availability(tvos,introduced=10.0))) __attribute__((availability(watchos,introduced=3.0))) = 16

} clockid_t;

__attribute__((availability(macosx,introduced=10.12))) __attribute__((availability(ios,introduced=10.0))) __attribute__((availability(tvos,introduced=10.0))) __attribute__((availability(watchos,introduced=3.0)))
int clock_getres(clockid_t __clock_id, struct timespec *__res);

__attribute__((availability(macosx,introduced=10.12))) __attribute__((availability(ios,introduced=10.0))) __attribute__((availability(tvos,introduced=10.0))) __attribute__((availability(watchos,introduced=3.0)))
int clock_gettime(clockid_t __clock_id, struct timespec *__tp);


__attribute__((availability(macosx,introduced=10.12))) __attribute__((availability(ios,introduced=10.0))) __attribute__((availability(tvos,introduced=10.0))) __attribute__((availability(watchos,introduced=3.0)))
__uint64_t clock_gettime_nsec_np(clockid_t __clock_id);


__attribute__((availability(macosx,introduced=10.12))) __attribute__((availability(ios,unavailable)))
__attribute__((availability(tvos,unavailable))) __attribute__((availability(watchos,unavailable)))
int clock_settime(clockid_t __clock_id, const struct timespec *__tp);
# 61 "/usr/include/curl/curl.h" 2 3 4
# 87 "/usr/include/curl/curl.h" 3 4
# 1 "/usr/include/sys/time.h" 1 3 4
# 77 "/usr/include/sys/time.h" 3 4
# 1 "/usr/include/sys/_types/_timeval.h" 1 3 4
# 30 "/usr/include/sys/_types/_timeval.h" 3 4
struct timeval
{
 __darwin_time_t tv_sec;
 __darwin_suseconds_t tv_usec;
};
# 78 "/usr/include/sys/time.h" 2 3 4


# 1 "/usr/include/sys/_types/_timeval64.h" 1 3 4
# 31 "/usr/include/sys/_types/_timeval64.h" 3 4
struct timeval64
{
 __int64_t tv_sec;
 __int64_t tv_usec;
};
# 81 "/usr/include/sys/time.h" 2 3 4
# 91 "/usr/include/sys/time.h" 3 4
struct itimerval {
 struct timeval it_interval;
 struct timeval it_value;
};
# 129 "/usr/include/sys/time.h" 3 4
struct timezone {
 int tz_minuteswest;
 int tz_dsttime;
};
# 172 "/usr/include/sys/time.h" 3 4
struct clockinfo {
 int hz;
 int tick;
 int tickadj;
 int stathz;
 int profhz;
};
# 189 "/usr/include/sys/time.h" 3 4
int adjtime(const struct timeval *, struct timeval *);
int futimes(int, const struct timeval *);
int lutimes(const char *, const struct timeval *) __attribute__((availability(macosx,introduced=10.5)));
int settimeofday(const struct timeval *, const struct timezone *);


int getitimer(int, struct itimerval *);
int gettimeofday(struct timeval * restrict, void * restrict);


# 1 "/usr/include/sys/_select.h" 1 3 4
# 39 "/usr/include/sys/_select.h" 3 4
int select(int, fd_set * restrict, fd_set * restrict,
  fd_set * restrict, struct timeval * restrict)




  __asm("_" "select" "$1050")




  ;
# 199 "/usr/include/sys/time.h" 2 3 4

int setitimer(int, const struct itimerval * restrict,
  struct itimerval * restrict);
int utimes(const char *, const struct timeval *);
# 88 "/usr/include/curl/curl.h" 2 3 4
# 102 "/usr/include/curl/curl.h" 3 4
typedef void CURL;
typedef void CURLSH;
# 130 "/usr/include/curl/curl.h" 3 4
typedef int curl_socket_t;





struct curl_httppost {
  struct curl_httppost *next;
  char *name;
  long namelength;
  char *contents;
  long contentslength;

  char *buffer;
  long bufferlength;
  char *contenttype;
  struct curl_slist* contentheader;
  struct curl_httppost *more;


  long flags;
# 170 "/usr/include/curl/curl.h" 3 4
  char *showfilename;


  void *userp;

  curl_off_t contentlen;


};



typedef int (*curl_progress_callback)(void *clientp,
                                      double dltotal,
                                      double dlnow,
                                      double ultotal,
                                      double ulnow);



typedef int (*curl_xferinfo_callback)(void *clientp,
                                      curl_off_t dltotal,
                                      curl_off_t dlnow,
                                      curl_off_t ultotal,
                                      curl_off_t ulnow);
# 217 "/usr/include/curl/curl.h" 3 4
typedef size_t (*curl_write_callback)(char *buffer,
                                      size_t size,
                                      size_t nitems,
                                      void *outstream);




typedef enum {
  CURLFILETYPE_FILE = 0,
  CURLFILETYPE_DIRECTORY,
  CURLFILETYPE_SYMLINK,
  CURLFILETYPE_DEVICE_BLOCK,
  CURLFILETYPE_DEVICE_CHAR,
  CURLFILETYPE_NAMEDPIPE,
  CURLFILETYPE_SOCKET,
  CURLFILETYPE_DOOR,

  CURLFILETYPE_UNKNOWN
} curlfiletype;
# 251 "/usr/include/curl/curl.h" 3 4
struct curl_fileinfo {
  char *filename;
  curlfiletype filetype;
  time_t time;
  unsigned int perm;
  int uid;
  int gid;
  curl_off_t size;
  long int hardlinks;

  struct {

    char *time;
    char *perm;
    char *user;
    char *group;
    char *target;
  } strings;

  unsigned int flags;


  char * b_data;
  size_t b_size;
  size_t b_used;
};
# 286 "/usr/include/curl/curl.h" 3 4
typedef long (*curl_chunk_bgn_callback)(const void *transfer_info,
                                        void *ptr,
                                        int remains);
# 300 "/usr/include/curl/curl.h" 3 4
typedef long (*curl_chunk_end_callback)(void *ptr);
# 309 "/usr/include/curl/curl.h" 3 4
typedef int (*curl_fnmatch_callback)(void *ptr,
                                     const char *pattern,
                                     const char *string);






typedef int (*curl_seek_callback)(void *instream,
                                  curl_off_t offset,
                                  int origin);
# 329 "/usr/include/curl/curl.h" 3 4
typedef size_t (*curl_read_callback)(char *buffer,
                                      size_t size,
                                      size_t nitems,
                                      void *instream);

typedef enum {
  CURLSOCKTYPE_IPCXN,
  CURLSOCKTYPE_ACCEPT,
  CURLSOCKTYPE_LAST
} curlsocktype;
# 347 "/usr/include/curl/curl.h" 3 4
typedef int (*curl_sockopt_callback)(void *clientp,
                                     curl_socket_t curlfd,
                                     curlsocktype purpose);

struct curl_sockaddr {
  int family;
  int socktype;
  int protocol;
  unsigned int addrlen;


  struct sockaddr addr;
};

typedef curl_socket_t
(*curl_opensocket_callback)(void *clientp,
                            curlsocktype purpose,
                            struct curl_sockaddr *address);

typedef int
(*curl_closesocket_callback)(void *clientp, curl_socket_t item);

typedef enum {
  CURLIOE_OK,
  CURLIOE_UNKNOWNCMD,
  CURLIOE_FAILRESTART,
  CURLIOE_LAST
} curlioerr;

typedef enum {
  CURLIOCMD_NOP,
  CURLIOCMD_RESTARTREAD,
  CURLIOCMD_LAST
} curliocmd;

typedef curlioerr (*curl_ioctl_callback)(CURL *handle,
                                         int cmd,
                                         void *clientp);
# 393 "/usr/include/curl/curl.h" 3 4
typedef void *(*curl_malloc_callback)(size_t size);
typedef void (*curl_free_callback)(void *ptr);
typedef void *(*curl_realloc_callback)(void *ptr, size_t size);
typedef char *(*curl_strdup_callback)(const char *str);
typedef void *(*curl_calloc_callback)(size_t nmemb, size_t size);





typedef enum {
  CURLINFO_TEXT = 0,
  CURLINFO_HEADER_IN,
  CURLINFO_HEADER_OUT,
  CURLINFO_DATA_IN,
  CURLINFO_DATA_OUT,
  CURLINFO_SSL_DATA_IN,
  CURLINFO_SSL_DATA_OUT,
  CURLINFO_END
} curl_infotype;

typedef int (*curl_debug_callback)
       (CURL *handle,
        curl_infotype type,
        char *data,
        size_t size,
        void *userptr);
# 428 "/usr/include/curl/curl.h" 3 4
typedef enum {
  CURLE_OK = 0,
  CURLE_UNSUPPORTED_PROTOCOL,
  CURLE_FAILED_INIT,
  CURLE_URL_MALFORMAT,
  CURLE_NOT_BUILT_IN,

  CURLE_COULDNT_RESOLVE_PROXY,
  CURLE_COULDNT_RESOLVE_HOST,
  CURLE_COULDNT_CONNECT,
  CURLE_WEIRD_SERVER_REPLY,
  CURLE_REMOTE_ACCESS_DENIED,


  CURLE_FTP_ACCEPT_FAILED,

  CURLE_FTP_WEIRD_PASS_REPLY,
  CURLE_FTP_ACCEPT_TIMEOUT,


  CURLE_FTP_WEIRD_PASV_REPLY,
  CURLE_FTP_WEIRD_227_FORMAT,
  CURLE_FTP_CANT_GET_HOST,
  CURLE_HTTP2,


  CURLE_FTP_COULDNT_SET_TYPE,
  CURLE_PARTIAL_FILE,
  CURLE_FTP_COULDNT_RETR_FILE,
  CURLE_OBSOLETE20,
  CURLE_QUOTE_ERROR,
  CURLE_HTTP_RETURNED_ERROR,
  CURLE_WRITE_ERROR,
  CURLE_OBSOLETE24,
  CURLE_UPLOAD_FAILED,
  CURLE_READ_ERROR,
  CURLE_OUT_OF_MEMORY,




  CURLE_OPERATION_TIMEDOUT,
  CURLE_OBSOLETE29,
  CURLE_FTP_PORT_FAILED,
  CURLE_FTP_COULDNT_USE_REST,
  CURLE_OBSOLETE32,
  CURLE_RANGE_ERROR,
  CURLE_HTTP_POST_ERROR,
  CURLE_SSL_CONNECT_ERROR,
  CURLE_BAD_DOWNLOAD_RESUME,
  CURLE_FILE_COULDNT_READ_FILE,
  CURLE_LDAP_CANNOT_BIND,
  CURLE_LDAP_SEARCH_FAILED,
  CURLE_OBSOLETE40,
  CURLE_FUNCTION_NOT_FOUND,
  CURLE_ABORTED_BY_CALLBACK,
  CURLE_BAD_FUNCTION_ARGUMENT,
  CURLE_OBSOLETE44,
  CURLE_INTERFACE_FAILED,
  CURLE_OBSOLETE46,
  CURLE_TOO_MANY_REDIRECTS,
  CURLE_UNKNOWN_OPTION,
  CURLE_TELNET_OPTION_SYNTAX,
  CURLE_OBSOLETE50,
  CURLE_PEER_FAILED_VERIFICATION,

  CURLE_GOT_NOTHING,
  CURLE_SSL_ENGINE_NOTFOUND,
  CURLE_SSL_ENGINE_SETFAILED,

  CURLE_SEND_ERROR,
  CURLE_RECV_ERROR,
  CURLE_OBSOLETE57,
  CURLE_SSL_CERTPROBLEM,
  CURLE_SSL_CIPHER,
  CURLE_SSL_CACERT,
  CURLE_BAD_CONTENT_ENCODING,
  CURLE_LDAP_INVALID_URL,
  CURLE_FILESIZE_EXCEEDED,
  CURLE_USE_SSL_FAILED,
  CURLE_SEND_FAIL_REWIND,

  CURLE_SSL_ENGINE_INITFAILED,
  CURLE_LOGIN_DENIED,

  CURLE_TFTP_NOTFOUND,
  CURLE_TFTP_PERM,
  CURLE_REMOTE_DISK_FULL,
  CURLE_TFTP_ILLEGAL,
  CURLE_TFTP_UNKNOWNID,
  CURLE_REMOTE_FILE_EXISTS,
  CURLE_TFTP_NOSUCHUSER,
  CURLE_CONV_FAILED,
  CURLE_CONV_REQD,




  CURLE_SSL_CACERT_BADFILE,

  CURLE_REMOTE_FILE_NOT_FOUND,
  CURLE_SSH,



  CURLE_SSL_SHUTDOWN_FAILED,

  CURLE_AGAIN,


  CURLE_SSL_CRL_BADFILE,

  CURLE_SSL_ISSUER_ERROR,

  CURLE_FTP_PRET_FAILED,
  CURLE_RTSP_CSEQ_ERROR,
  CURLE_RTSP_SESSION_ERROR,
  CURLE_FTP_BAD_FILE_LIST,
  CURLE_CHUNK_FAILED,
  CURLE_NO_CONNECTION_AVAILABLE,

  CURLE_SSL_PINNEDPUBKEYNOTMATCH,

  CURLE_SSL_INVALIDCERTSTATUS,
  CURLE_HTTP2_STREAM,

  CURL_LAST
} CURLcode;
# 631 "/usr/include/curl/curl.h" 3 4
typedef CURLcode (*curl_conv_callback)(char *buffer, size_t length);

typedef CURLcode (*curl_ssl_ctx_callback)(CURL *curl,
                                          void *ssl_ctx,

                                          void *userptr);

typedef enum {
  CURLPROXY_HTTP = 0,

  CURLPROXY_HTTP_1_0 = 1,

  CURLPROXY_SOCKS4 = 4,

  CURLPROXY_SOCKS5 = 5,
  CURLPROXY_SOCKS4A = 6,
  CURLPROXY_SOCKS5_HOSTNAME = 7


} curl_proxytype;
# 697 "/usr/include/curl/curl.h" 3 4
enum curl_khtype {
  CURLKHTYPE_UNKNOWN,
  CURLKHTYPE_RSA1,
  CURLKHTYPE_RSA,
  CURLKHTYPE_DSS
};

struct curl_khkey {
  const char *key;

  size_t len;
  enum curl_khtype keytype;
};



enum curl_khstat {
  CURLKHSTAT_FINE_ADD_TO_FILE,
  CURLKHSTAT_FINE,
  CURLKHSTAT_REJECT,
  CURLKHSTAT_DEFER,


  CURLKHSTAT_LAST
};


enum curl_khmatch {
  CURLKHMATCH_OK,
  CURLKHMATCH_MISMATCH,
  CURLKHMATCH_MISSING,
  CURLKHMATCH_LAST
};

typedef int
  (*curl_sshkeycallback) (CURL *easy,
                          const struct curl_khkey *knownkey,
                          const struct curl_khkey *foundkey,
                          enum curl_khmatch,
                          void *clientp);


typedef enum {
  CURLUSESSL_NONE,
  CURLUSESSL_TRY,
  CURLUSESSL_CONTROL,
  CURLUSESSL_ALL,
  CURLUSESSL_LAST
} curl_usessl;
# 775 "/usr/include/curl/curl.h" 3 4
typedef enum {
  CURLFTPSSL_CCC_NONE,
  CURLFTPSSL_CCC_PASSIVE,
  CURLFTPSSL_CCC_ACTIVE,
  CURLFTPSSL_CCC_LAST
} curl_ftpccc;


typedef enum {
  CURLFTPAUTH_DEFAULT,
  CURLFTPAUTH_SSL,
  CURLFTPAUTH_TLS,
  CURLFTPAUTH_LAST
} curl_ftpauth;


typedef enum {
  CURLFTP_CREATE_DIR_NONE,
  CURLFTP_CREATE_DIR,


  CURLFTP_CREATE_DIR_RETRY,

  CURLFTP_CREATE_DIR_LAST
} curl_ftpcreatedir;


typedef enum {
  CURLFTPMETHOD_DEFAULT,
  CURLFTPMETHOD_MULTICWD,
  CURLFTPMETHOD_NOCWD,
  CURLFTPMETHOD_SINGLECWD,
  CURLFTPMETHOD_LAST
} curl_ftpmethod;
# 881 "/usr/include/curl/curl.h" 3 4
typedef enum {

  CURLOPT_WRITEDATA = 10000 + 1,


  CURLOPT_URL = 10000 + 2,


  CURLOPT_PORT = 0 + 3,


  CURLOPT_PROXY = 10000 + 4,


  CURLOPT_USERPWD = 10000 + 5,


  CURLOPT_PROXYUSERPWD = 10000 + 6,


  CURLOPT_RANGE = 10000 + 7,




  CURLOPT_READDATA = 10000 + 9,



  CURLOPT_ERRORBUFFER = 10000 + 10,



  CURLOPT_WRITEFUNCTION = 20000 + 11,



  CURLOPT_READFUNCTION = 20000 + 12,


  CURLOPT_TIMEOUT = 0 + 13,
# 932 "/usr/include/curl/curl.h" 3 4
  CURLOPT_INFILESIZE = 0 + 14,


  CURLOPT_POSTFIELDS = 10000 + 15,


  CURLOPT_REFERER = 10000 + 16,



  CURLOPT_FTPPORT = 10000 + 17,


  CURLOPT_USERAGENT = 10000 + 18,
# 954 "/usr/include/curl/curl.h" 3 4
  CURLOPT_LOW_SPEED_LIMIT = 0 + 19,


  CURLOPT_LOW_SPEED_TIME = 0 + 20,







  CURLOPT_RESUME_FROM = 0 + 21,


  CURLOPT_COOKIE = 10000 + 22,



  CURLOPT_HTTPHEADER = 10000 + 23,


  CURLOPT_HTTPPOST = 10000 + 24,


  CURLOPT_SSLCERT = 10000 + 25,


  CURLOPT_KEYPASSWD = 10000 + 26,


  CURLOPT_CRLF = 0 + 27,


  CURLOPT_QUOTE = 10000 + 28,



  CURLOPT_HEADERDATA = 10000 + 29,



  CURLOPT_COOKIEFILE = 10000 + 31,



  CURLOPT_SSLVERSION = 0 + 32,


  CURLOPT_TIMECONDITION = 0 + 33,



  CURLOPT_TIMEVALUE = 0 + 34,







  CURLOPT_CUSTOMREQUEST = 10000 + 36,


  CURLOPT_STDERR = 10000 + 37,




  CURLOPT_POSTQUOTE = 10000 + 39,

  CURLOPT_OBSOLETE40 = 10000 + 40,

  CURLOPT_VERBOSE = 0 + 41,
  CURLOPT_HEADER = 0 + 42,
  CURLOPT_NOPROGRESS = 0 + 43,
  CURLOPT_NOBODY = 0 + 44,
  CURLOPT_FAILONERROR = 0 + 45,
  CURLOPT_UPLOAD = 0 + 46,
  CURLOPT_POST = 0 + 47,
  CURLOPT_DIRLISTONLY = 0 + 48,

  CURLOPT_APPEND = 0 + 50,



  CURLOPT_NETRC = 0 + 51,

  CURLOPT_FOLLOWLOCATION = 0 + 52,

  CURLOPT_TRANSFERTEXT = 0 + 53,
  CURLOPT_PUT = 0 + 54,







  CURLOPT_PROGRESSFUNCTION = 20000 + 56,



  CURLOPT_PROGRESSDATA = 10000 + 57,



  CURLOPT_AUTOREFERER = 0 + 58,



  CURLOPT_PROXYPORT = 0 + 59,


  CURLOPT_POSTFIELDSIZE = 0 + 60,


  CURLOPT_HTTPPROXYTUNNEL = 0 + 61,


  CURLOPT_INTERFACE = 10000 + 62,




  CURLOPT_KRBLEVEL = 10000 + 63,


  CURLOPT_SSL_VERIFYPEER = 0 + 64,



  CURLOPT_CAINFO = 10000 + 65,





  CURLOPT_MAXREDIRS = 0 + 68,



  CURLOPT_FILETIME = 0 + 69,


  CURLOPT_TELNETOPTIONS = 10000 + 70,


  CURLOPT_MAXCONNECTS = 0 + 71,

  CURLOPT_OBSOLETE72 = 0 + 72,






  CURLOPT_FRESH_CONNECT = 0 + 74,




  CURLOPT_FORBID_REUSE = 0 + 75,



  CURLOPT_RANDOM_FILE = 10000 + 76,


  CURLOPT_EGDSOCKET = 10000 + 77,



  CURLOPT_CONNECTTIMEOUT = 0 + 78,



  CURLOPT_HEADERFUNCTION = 20000 + 79,




  CURLOPT_HTTPGET = 0 + 80,




  CURLOPT_SSL_VERIFYHOST = 0 + 81,



  CURLOPT_COOKIEJAR = 10000 + 82,


  CURLOPT_SSL_CIPHER_LIST = 10000 + 83,



  CURLOPT_HTTP_VERSION = 0 + 84,




  CURLOPT_FTP_USE_EPSV = 0 + 85,


  CURLOPT_SSLCERTTYPE = 10000 + 86,


  CURLOPT_SSLKEY = 10000 + 87,


  CURLOPT_SSLKEYTYPE = 10000 + 88,


  CURLOPT_SSLENGINE = 10000 + 89,




  CURLOPT_SSLENGINE_DEFAULT = 0 + 90,


  CURLOPT_DNS_USE_GLOBAL_CACHE = 0 + 91,


  CURLOPT_DNS_CACHE_TIMEOUT = 0 + 92,


  CURLOPT_PREQUOTE = 10000 + 93,


  CURLOPT_DEBUGFUNCTION = 20000 + 94,


  CURLOPT_DEBUGDATA = 10000 + 95,


  CURLOPT_COOKIESESSION = 0 + 96,



  CURLOPT_CAPATH = 10000 + 97,


  CURLOPT_BUFFERSIZE = 0 + 98,




  CURLOPT_NOSIGNAL = 0 + 99,


  CURLOPT_SHARE = 10000 + 100,



  CURLOPT_PROXYTYPE = 0 + 101,




  CURLOPT_ACCEPT_ENCODING = 10000 + 102,


  CURLOPT_PRIVATE = 10000 + 103,


  CURLOPT_HTTP200ALIASES = 10000 + 104,




  CURLOPT_UNRESTRICTED_AUTH = 0 + 105,




  CURLOPT_FTP_USE_EPRT = 0 + 106,




  CURLOPT_HTTPAUTH = 0 + 107,




  CURLOPT_SSL_CTX_FUNCTION = 20000 + 108,



  CURLOPT_SSL_CTX_DATA = 10000 + 109,





  CURLOPT_FTP_CREATE_MISSING_DIRS = 0 + 110,




  CURLOPT_PROXYAUTH = 0 + 111,





  CURLOPT_FTP_RESPONSE_TIMEOUT = 0 + 112,





  CURLOPT_IPRESOLVE = 0 + 113,






  CURLOPT_MAXFILESIZE = 0 + 114,




  CURLOPT_INFILESIZE_LARGE = 30000 + 115,




  CURLOPT_RESUME_FROM_LARGE = 30000 + 116,




  CURLOPT_MAXFILESIZE_LARGE = 30000 + 117,





  CURLOPT_NETRC_FILE = 10000 + 118,






  CURLOPT_USE_SSL = 0 + 119,


  CURLOPT_POSTFIELDSIZE_LARGE = 30000 + 120,


  CURLOPT_TCP_NODELAY = 0 + 121,
# 1329 "/usr/include/curl/curl.h" 3 4
  CURLOPT_FTPSSLAUTH = 0 + 129,

  CURLOPT_IOCTLFUNCTION = 20000 + 130,
  CURLOPT_IOCTLDATA = 10000 + 131,






  CURLOPT_FTP_ACCOUNT = 10000 + 134,


  CURLOPT_COOKIELIST = 10000 + 135,


  CURLOPT_IGNORE_CONTENT_LENGTH = 0 + 136,





  CURLOPT_FTP_SKIP_PASV_IP = 0 + 137,



  CURLOPT_FTP_FILEMETHOD = 0 + 138,


  CURLOPT_LOCALPORT = 0 + 139,




  CURLOPT_LOCALPORTRANGE = 0 + 140,



  CURLOPT_CONNECT_ONLY = 0 + 141,



  CURLOPT_CONV_FROM_NETWORK_FUNCTION = 20000 + 142,



  CURLOPT_CONV_TO_NETWORK_FUNCTION = 20000 + 143,




  CURLOPT_CONV_FROM_UTF8_FUNCTION = 20000 + 144,



  CURLOPT_MAX_SEND_SPEED_LARGE = 30000 + 145,
  CURLOPT_MAX_RECV_SPEED_LARGE = 30000 + 146,


  CURLOPT_FTP_ALTERNATIVE_TO_USER = 10000 + 147,


  CURLOPT_SOCKOPTFUNCTION = 20000 + 148,
  CURLOPT_SOCKOPTDATA = 10000 + 149,



  CURLOPT_SSL_SESSIONID_CACHE = 0 + 150,


  CURLOPT_SSH_AUTH_TYPES = 0 + 151,


  CURLOPT_SSH_PUBLIC_KEYFILE = 10000 + 152,
  CURLOPT_SSH_PRIVATE_KEYFILE = 10000 + 153,


  CURLOPT_FTP_SSL_CCC = 0 + 154,


  CURLOPT_TIMEOUT_MS = 0 + 155,
  CURLOPT_CONNECTTIMEOUT_MS = 0 + 156,



  CURLOPT_HTTP_TRANSFER_DECODING = 0 + 157,
  CURLOPT_HTTP_CONTENT_DECODING = 0 + 158,



  CURLOPT_NEW_FILE_PERMS = 0 + 159,
  CURLOPT_NEW_DIRECTORY_PERMS = 0 + 160,



  CURLOPT_POSTREDIR = 0 + 161,


  CURLOPT_SSH_HOST_PUBLIC_KEY_MD5 = 10000 + 162,





  CURLOPT_OPENSOCKETFUNCTION = 20000 + 163,
  CURLOPT_OPENSOCKETDATA = 10000 + 164,


  CURLOPT_COPYPOSTFIELDS = 10000 + 165,


  CURLOPT_PROXY_TRANSFER_MODE = 0 + 166,


  CURLOPT_SEEKFUNCTION = 20000 + 167,
  CURLOPT_SEEKDATA = 10000 + 168,


  CURLOPT_CRLFILE = 10000 + 169,


  CURLOPT_ISSUERCERT = 10000 + 170,


  CURLOPT_ADDRESS_SCOPE = 0 + 171,



  CURLOPT_CERTINFO = 0 + 172,


  CURLOPT_USERNAME = 10000 + 173,
  CURLOPT_PASSWORD = 10000 + 174,


  CURLOPT_PROXYUSERNAME = 10000 + 175,
  CURLOPT_PROXYPASSWORD = 10000 + 176,
# 1474 "/usr/include/curl/curl.h" 3 4
  CURLOPT_NOPROXY = 10000 + 177,


  CURLOPT_TFTP_BLKSIZE = 0 + 178,


  CURLOPT_SOCKS5_GSSAPI_SERVICE = 10000 + 179,


  CURLOPT_SOCKS5_GSSAPI_NEC = 0 + 180,





  CURLOPT_PROTOCOLS = 0 + 181,





  CURLOPT_REDIR_PROTOCOLS = 0 + 182,


  CURLOPT_SSH_KNOWNHOSTS = 10000 + 183,



  CURLOPT_SSH_KEYFUNCTION = 20000 + 184,


  CURLOPT_SSH_KEYDATA = 10000 + 185,


  CURLOPT_MAIL_FROM = 10000 + 186,


  CURLOPT_MAIL_RCPT = 10000 + 187,


  CURLOPT_FTP_USE_PRET = 0 + 188,


  CURLOPT_RTSP_REQUEST = 0 + 189,


  CURLOPT_RTSP_SESSION_ID = 10000 + 190,


  CURLOPT_RTSP_STREAM_URI = 10000 + 191,


  CURLOPT_RTSP_TRANSPORT = 10000 + 192,


  CURLOPT_RTSP_CLIENT_CSEQ = 0 + 193,


  CURLOPT_RTSP_SERVER_CSEQ = 0 + 194,


  CURLOPT_INTERLEAVEDATA = 10000 + 195,


  CURLOPT_INTERLEAVEFUNCTION = 20000 + 196,


  CURLOPT_WILDCARDMATCH = 0 + 197,



  CURLOPT_CHUNK_BGN_FUNCTION = 20000 + 198,



  CURLOPT_CHUNK_END_FUNCTION = 20000 + 199,


  CURLOPT_FNMATCH_FUNCTION = 20000 + 200,


  CURLOPT_CHUNK_DATA = 10000 + 201,


  CURLOPT_FNMATCH_DATA = 10000 + 202,


  CURLOPT_RESOLVE = 10000 + 203,


  CURLOPT_TLSAUTH_USERNAME = 10000 + 204,


  CURLOPT_TLSAUTH_PASSWORD = 10000 + 205,


  CURLOPT_TLSAUTH_TYPE = 10000 + 206,
# 1582 "/usr/include/curl/curl.h" 3 4
  CURLOPT_TRANSFER_ENCODING = 0 + 207,



  CURLOPT_CLOSESOCKETFUNCTION = 20000 + 208,
  CURLOPT_CLOSESOCKETDATA = 10000 + 209,


  CURLOPT_GSSAPI_DELEGATION = 0 + 210,


  CURLOPT_DNS_SERVERS = 10000 + 211,



  CURLOPT_ACCEPTTIMEOUT_MS = 0 + 212,


  CURLOPT_TCP_KEEPALIVE = 0 + 213,


  CURLOPT_TCP_KEEPIDLE = 0 + 214,
  CURLOPT_TCP_KEEPINTVL = 0 + 215,


  CURLOPT_SSL_OPTIONS = 0 + 216,


  CURLOPT_MAIL_AUTH = 10000 + 217,


  CURLOPT_SASL_IR = 0 + 218,




  CURLOPT_XFERINFOFUNCTION = 20000 + 219,


  CURLOPT_XOAUTH2_BEARER = 10000 + 220,




  CURLOPT_DNS_INTERFACE = 10000 + 221,



  CURLOPT_DNS_LOCAL_IP4 = 10000 + 222,



  CURLOPT_DNS_LOCAL_IP6 = 10000 + 223,


  CURLOPT_LOGIN_OPTIONS = 10000 + 224,


  CURLOPT_SSL_ENABLE_NPN = 0 + 225,


  CURLOPT_SSL_ENABLE_ALPN = 0 + 226,



  CURLOPT_EXPECT_100_TIMEOUT_MS = 0 + 227,



  CURLOPT_PROXYHEADER = 10000 + 228,


  CURLOPT_HEADEROPT = 0 + 229,



  CURLOPT_PINNEDPUBLICKEY = 10000 + 230,


  CURLOPT_UNIX_SOCKET_PATH = 10000 + 231,


  CURLOPT_SSL_VERIFYSTATUS = 0 + 232,


  CURLOPT_SSL_FALSESTART = 0 + 233,


  CURLOPT_PATH_AS_IS = 0 + 234,


  CURLOPT_PROXY_SERVICE_NAME = 10000 + 235,


  CURLOPT_SERVICE_NAME = 10000 + 236,


  CURLOPT_PIPEWAIT = 0 + 237,


  CURLOPT_DEFAULT_PROTOCOL = 10000 + 238,


  CURLOPT_STREAM_WEIGHT = 0 + 239,


  CURLOPT_STREAM_DEPENDS = 10000 + 240,


  CURLOPT_STREAM_DEPENDS_E = 10000 + 241,


  CURLOPT_TFTP_NO_OPTIONS = 0 + 242,



  CURLOPT_CONNECT_TO = 10000 + 243,


  CURLOPT_TCP_FASTOPEN = 0 + 244,



  CURLOPT_KEEP_SENDING_ON_ERROR = 0 + 245,

  CURLOPT_LASTENTRY
} CURLoption;
# 1750 "/usr/include/curl/curl.h" 3 4
enum {
  CURL_HTTP_VERSION_NONE,


  CURL_HTTP_VERSION_1_0,
  CURL_HTTP_VERSION_1_1,
  CURL_HTTP_VERSION_2_0,
  CURL_HTTP_VERSION_2TLS,
  CURL_HTTP_VERSION_2_PRIOR_KNOWLEDGE,


  CURL_HTTP_VERSION_LAST
};
# 1772 "/usr/include/curl/curl.h" 3 4
enum {
    CURL_RTSPREQ_NONE,
    CURL_RTSPREQ_OPTIONS,
    CURL_RTSPREQ_DESCRIBE,
    CURL_RTSPREQ_ANNOUNCE,
    CURL_RTSPREQ_SETUP,
    CURL_RTSPREQ_PLAY,
    CURL_RTSPREQ_PAUSE,
    CURL_RTSPREQ_TEARDOWN,
    CURL_RTSPREQ_GET_PARAMETER,
    CURL_RTSPREQ_SET_PARAMETER,
    CURL_RTSPREQ_RECORD,
    CURL_RTSPREQ_RECEIVE,
    CURL_RTSPREQ_LAST
};


enum CURL_NETRC_OPTION {
  CURL_NETRC_IGNORED,

  CURL_NETRC_OPTIONAL,

  CURL_NETRC_REQUIRED,


  CURL_NETRC_LAST
};

enum {
  CURL_SSLVERSION_DEFAULT,
  CURL_SSLVERSION_TLSv1,
  CURL_SSLVERSION_SSLv2,
  CURL_SSLVERSION_SSLv3,
  CURL_SSLVERSION_TLSv1_0,
  CURL_SSLVERSION_TLSv1_1,
  CURL_SSLVERSION_TLSv1_2,

  CURL_SSLVERSION_LAST
};

enum CURL_TLSAUTH {
  CURL_TLSAUTH_NONE,
  CURL_TLSAUTH_SRP,
  CURL_TLSAUTH_LAST
};
# 1830 "/usr/include/curl/curl.h" 3 4
typedef enum {
  CURL_TIMECOND_NONE,

  CURL_TIMECOND_IFMODSINCE,
  CURL_TIMECOND_IFUNMODSINCE,
  CURL_TIMECOND_LASTMOD,

  CURL_TIMECOND_LAST
} curl_TimeCond;




            int (curl_strequal)(const char *s1, const char *s2);
            int (curl_strnequal)(const char *s1, const char *s2, size_t n);
# 1858 "/usr/include/curl/curl.h" 3 4
typedef enum {
  CURLFORM_NOTHING,


  CURLFORM_COPYNAME,
  CURLFORM_PTRNAME,
  CURLFORM_NAMELENGTH,
  CURLFORM_COPYCONTENTS,
  CURLFORM_PTRCONTENTS,
  CURLFORM_CONTENTSLENGTH,
  CURLFORM_FILECONTENT,
  CURLFORM_ARRAY,
  CURLFORM_OBSOLETE,
  CURLFORM_FILE,

  CURLFORM_BUFFER,
  CURLFORM_BUFFERPTR,
  CURLFORM_BUFFERLENGTH,

  CURLFORM_CONTENTTYPE,
  CURLFORM_CONTENTHEADER,
  CURLFORM_FILENAME,
  CURLFORM_END,
  CURLFORM_OBSOLETE2,

  CURLFORM_STREAM,
  CURLFORM_CONTENTLEN,

  CURLFORM_LASTENTRY
} CURLformoption;




struct curl_forms {
  CURLformoption option;
  const char *value;
};
# 1913 "/usr/include/curl/curl.h" 3 4
typedef enum {
  CURL_FORMADD_OK,

  CURL_FORMADD_MEMORY,
  CURL_FORMADD_OPTION_TWICE,
  CURL_FORMADD_NULL,
  CURL_FORMADD_UNKNOWN_OPTION,
  CURL_FORMADD_INCOMPLETE,
  CURL_FORMADD_ILLEGAL_ARRAY,
  CURL_FORMADD_DISABLED,

  CURL_FORMADD_LAST
} CURLFORMcode;
# 1936 "/usr/include/curl/curl.h" 3 4
            CURLFORMcode curl_formadd(struct curl_httppost **httppost,
                                      struct curl_httppost **last_post,
                                      ...);
# 1948 "/usr/include/curl/curl.h" 3 4
typedef size_t (*curl_formget_callback)(void *arg, const char *buf,
                                        size_t len);
# 1961 "/usr/include/curl/curl.h" 3 4
            int curl_formget(struct curl_httppost *form, void *arg,
                             curl_formget_callback append);







            void curl_formfree(struct curl_httppost *form);
# 1980 "/usr/include/curl/curl.h" 3 4
            char *curl_getenv(const char *variable);
# 1989 "/usr/include/curl/curl.h" 3 4
            char *curl_version(void);
# 2000 "/usr/include/curl/curl.h" 3 4
            char *curl_easy_escape(CURL *handle,
                                   const char *string,
                                   int length);


            char *curl_escape(const char *string,
                              int length);
# 2020 "/usr/include/curl/curl.h" 3 4
            char *curl_easy_unescape(CURL *handle,
                                     const char *string,
                                     int length,
                                     int *outlength);


            char *curl_unescape(const char *string,
                                int length);
# 2037 "/usr/include/curl/curl.h" 3 4
            void curl_free(void *p);
# 2049 "/usr/include/curl/curl.h" 3 4
            CURLcode curl_global_init(long flags);
# 2064 "/usr/include/curl/curl.h" 3 4
            CURLcode curl_global_init_mem(long flags,
                                          curl_malloc_callback m,
                                          curl_free_callback f,
                                          curl_realloc_callback r,
                                          curl_strdup_callback s,
                                          curl_calloc_callback c);
# 2079 "/usr/include/curl/curl.h" 3 4
            void curl_global_cleanup(void);


struct curl_slist {
  char *data;
  struct curl_slist *next;
};
# 2095 "/usr/include/curl/curl.h" 3 4
            struct curl_slist *curl_slist_append(struct curl_slist *,
                                                 const char *);
# 2105 "/usr/include/curl/curl.h" 3 4
            void curl_slist_free_all(struct curl_slist *);
# 2116 "/usr/include/curl/curl.h" 3 4
            time_t curl_getdate(const char *p, const time_t *unused);



struct curl_certinfo {
  int num_of_certs;
  struct curl_slist **certinfo;


};


typedef enum {
  CURLSSLBACKEND_NONE = 0,
  CURLSSLBACKEND_OPENSSL = 1,
  CURLSSLBACKEND_GNUTLS = 2,
  CURLSSLBACKEND_NSS = 3,
  CURLSSLBACKEND_OBSOLETE4 = 4,
  CURLSSLBACKEND_GSKIT = 5,
  CURLSSLBACKEND_POLARSSL = 6,
  CURLSSLBACKEND_CYASSL = 7,
  CURLSSLBACKEND_SCHANNEL = 8,
  CURLSSLBACKEND_DARWINSSL = 9,
  CURLSSLBACKEND_AXTLS = 10,
  CURLSSLBACKEND_MBEDTLS = 11
} curl_sslbackend;
# 2151 "/usr/include/curl/curl.h" 3 4
struct curl_tlssessioninfo {
  curl_sslbackend backend;
  void *internals;
};
# 2164 "/usr/include/curl/curl.h" 3 4
typedef enum {
  CURLINFO_NONE,
  CURLINFO_EFFECTIVE_URL = 0x100000 + 1,
  CURLINFO_RESPONSE_CODE = 0x200000 + 2,
  CURLINFO_TOTAL_TIME = 0x300000 + 3,
  CURLINFO_NAMELOOKUP_TIME = 0x300000 + 4,
  CURLINFO_CONNECT_TIME = 0x300000 + 5,
  CURLINFO_PRETRANSFER_TIME = 0x300000 + 6,
  CURLINFO_SIZE_UPLOAD = 0x300000 + 7,
  CURLINFO_SIZE_DOWNLOAD = 0x300000 + 8,
  CURLINFO_SPEED_DOWNLOAD = 0x300000 + 9,
  CURLINFO_SPEED_UPLOAD = 0x300000 + 10,
  CURLINFO_HEADER_SIZE = 0x200000 + 11,
  CURLINFO_REQUEST_SIZE = 0x200000 + 12,
  CURLINFO_SSL_VERIFYRESULT = 0x200000 + 13,
  CURLINFO_FILETIME = 0x200000 + 14,
  CURLINFO_CONTENT_LENGTH_DOWNLOAD = 0x300000 + 15,
  CURLINFO_CONTENT_LENGTH_UPLOAD = 0x300000 + 16,
  CURLINFO_STARTTRANSFER_TIME = 0x300000 + 17,
  CURLINFO_CONTENT_TYPE = 0x100000 + 18,
  CURLINFO_REDIRECT_TIME = 0x300000 + 19,
  CURLINFO_REDIRECT_COUNT = 0x200000 + 20,
  CURLINFO_PRIVATE = 0x100000 + 21,
  CURLINFO_HTTP_CONNECTCODE = 0x200000 + 22,
  CURLINFO_HTTPAUTH_AVAIL = 0x200000 + 23,
  CURLINFO_PROXYAUTH_AVAIL = 0x200000 + 24,
  CURLINFO_OS_ERRNO = 0x200000 + 25,
  CURLINFO_NUM_CONNECTS = 0x200000 + 26,
  CURLINFO_SSL_ENGINES = 0x400000 + 27,
  CURLINFO_COOKIELIST = 0x400000 + 28,
  CURLINFO_LASTSOCKET = 0x200000 + 29,
  CURLINFO_FTP_ENTRY_PATH = 0x100000 + 30,
  CURLINFO_REDIRECT_URL = 0x100000 + 31,
  CURLINFO_PRIMARY_IP = 0x100000 + 32,
  CURLINFO_APPCONNECT_TIME = 0x300000 + 33,
  CURLINFO_CERTINFO = 0x400000 + 34,
  CURLINFO_CONDITION_UNMET = 0x200000 + 35,
  CURLINFO_RTSP_SESSION_ID = 0x100000 + 36,
  CURLINFO_RTSP_CLIENT_CSEQ = 0x200000 + 37,
  CURLINFO_RTSP_SERVER_CSEQ = 0x200000 + 38,
  CURLINFO_RTSP_CSEQ_RECV = 0x200000 + 39,
  CURLINFO_PRIMARY_PORT = 0x200000 + 40,
  CURLINFO_LOCAL_IP = 0x100000 + 41,
  CURLINFO_LOCAL_PORT = 0x200000 + 42,
  CURLINFO_TLS_SESSION = 0x400000 + 43,
  CURLINFO_ACTIVESOCKET = 0x500000 + 44,
  CURLINFO_TLS_SSL_PTR = 0x400000 + 45,
  CURLINFO_HTTP_VERSION = 0x200000 + 46,


  CURLINFO_LASTONE = 46
} CURLINFO;





typedef enum {
  CURLCLOSEPOLICY_NONE,

  CURLCLOSEPOLICY_OLDEST,
  CURLCLOSEPOLICY_LEAST_RECENTLY_USED,
  CURLCLOSEPOLICY_LEAST_TRAFFIC,
  CURLCLOSEPOLICY_SLOWEST,
  CURLCLOSEPOLICY_CALLBACK,

  CURLCLOSEPOLICY_LAST
} curl_closepolicy;
# 2246 "/usr/include/curl/curl.h" 3 4
typedef enum {
  CURL_LOCK_DATA_NONE = 0,




  CURL_LOCK_DATA_SHARE,
  CURL_LOCK_DATA_COOKIE,
  CURL_LOCK_DATA_DNS,
  CURL_LOCK_DATA_SSL_SESSION,
  CURL_LOCK_DATA_CONNECT,
  CURL_LOCK_DATA_LAST
} curl_lock_data;


typedef enum {
  CURL_LOCK_ACCESS_NONE = 0,
  CURL_LOCK_ACCESS_SHARED = 1,
  CURL_LOCK_ACCESS_SINGLE = 2,
  CURL_LOCK_ACCESS_LAST
} curl_lock_access;

typedef void (*curl_lock_function)(CURL *handle,
                                   curl_lock_data data,
                                   curl_lock_access locktype,
                                   void *userptr);
typedef void (*curl_unlock_function)(CURL *handle,
                                     curl_lock_data data,
                                     void *userptr);


typedef enum {
  CURLSHE_OK,
  CURLSHE_BAD_OPTION,
  CURLSHE_IN_USE,
  CURLSHE_INVALID,
  CURLSHE_NOMEM,
  CURLSHE_NOT_BUILT_IN,
  CURLSHE_LAST
} CURLSHcode;

typedef enum {
  CURLSHOPT_NONE,
  CURLSHOPT_SHARE,
  CURLSHOPT_UNSHARE,
  CURLSHOPT_LOCKFUNC,
  CURLSHOPT_UNLOCKFUNC,
  CURLSHOPT_USERDATA,

  CURLSHOPT_LAST
} CURLSHoption;

            CURLSH *curl_share_init(void);
            CURLSHcode curl_share_setopt(CURLSH *, CURLSHoption option, ...);
            CURLSHcode curl_share_cleanup(CURLSH *);





typedef enum {
  CURLVERSION_FIRST,
  CURLVERSION_SECOND,
  CURLVERSION_THIRD,
  CURLVERSION_FOURTH,
  CURLVERSION_LAST
} CURLversion;
# 2321 "/usr/include/curl/curl.h" 3 4
typedef struct {
  CURLversion age;
  const char *version;
  unsigned int version_num;
  const char *host;
  int features;
  const char *ssl_version;
  long ssl_version_num;
  const char *libz_version;

  const char * const *protocols;


  const char *ares;
  int ares_num;


  const char *libidn;




  int iconv_ver_num;

  const char *libssh_version;

} curl_version_info_data;
# 2384 "/usr/include/curl/curl.h" 3 4
            curl_version_info_data *curl_version_info(CURLversion);
# 2395 "/usr/include/curl/curl.h" 3 4
            const char *curl_easy_strerror(CURLcode);
# 2406 "/usr/include/curl/curl.h" 3 4
            const char *curl_share_strerror(CURLSHcode);
# 2417 "/usr/include/curl/curl.h" 3 4
            CURLcode curl_easy_pause(CURL *handle, int bitmask);
# 2434 "/usr/include/curl/curl.h" 3 4
# 1 "/usr/include/curl/easy.h" 1 3 4
# 28 "/usr/include/curl/easy.h" 3 4
            CURL *curl_easy_init(void);
            CURLcode curl_easy_setopt(CURL *curl, CURLoption option, ...);
            CURLcode curl_easy_perform(CURL *curl);
            void curl_easy_cleanup(CURL *curl);
# 46 "/usr/include/curl/easy.h" 3 4
            CURLcode curl_easy_getinfo(CURL *curl, CURLINFO info, ...);
# 61 "/usr/include/curl/easy.h" 3 4
            CURL* curl_easy_duphandle(CURL *curl);
# 74 "/usr/include/curl/easy.h" 3 4
            void curl_easy_reset(CURL *curl);
# 84 "/usr/include/curl/easy.h" 3 4
            CURLcode curl_easy_recv(CURL *curl, void *buffer, size_t buflen,
                                    size_t *n);
# 95 "/usr/include/curl/easy.h" 3 4
            CURLcode curl_easy_send(CURL *curl, const void *buffer,
                                    size_t buflen, size_t *n);
# 2435 "/usr/include/curl/curl.h" 2 3 4
# 1 "/usr/include/curl/multi.h" 1 3 4
# 49 "/usr/include/curl/multi.h" 3 4
# 1 "/usr/include/curl/curl.h" 1 3 4
# 50 "/usr/include/curl/multi.h" 2 3 4
# 60 "/usr/include/curl/multi.h" 3 4
typedef void CURLM;


typedef enum {
  CURLM_CALL_MULTI_PERFORM = -1,

  CURLM_OK,
  CURLM_BAD_HANDLE,
  CURLM_BAD_EASY_HANDLE,
  CURLM_OUT_OF_MEMORY,
  CURLM_INTERNAL_ERROR,
  CURLM_BAD_SOCKET,
  CURLM_UNKNOWN_OPTION,
  CURLM_ADDED_ALREADY,

  CURLM_LAST
} CURLMcode;
# 88 "/usr/include/curl/multi.h" 3 4
typedef enum {
  CURLMSG_NONE,
  CURLMSG_DONE,

  CURLMSG_LAST
} CURLMSG;

struct CURLMsg {
  CURLMSG msg;
  CURL *easy_handle;
  union {
    void *whatever;
    CURLcode result;
  } data;
};
typedef struct CURLMsg CURLMsg;
# 112 "/usr/include/curl/multi.h" 3 4
struct curl_waitfd {
  curl_socket_t fd;
  short events;
  short revents;
};
# 125 "/usr/include/curl/multi.h" 3 4
            CURLM *curl_multi_init(void);
# 134 "/usr/include/curl/multi.h" 3 4
            CURLMcode curl_multi_add_handle(CURLM *multi_handle,
                                            CURL *curl_handle);
# 144 "/usr/include/curl/multi.h" 3 4
            CURLMcode curl_multi_remove_handle(CURLM *multi_handle,
                                               CURL *curl_handle);
# 156 "/usr/include/curl/multi.h" 3 4
            CURLMcode curl_multi_fdset(CURLM *multi_handle,
                                       fd_set *read_fd_set,
                                       fd_set *write_fd_set,
                                       fd_set *exc_fd_set,
                                       int *max_fd);
# 170 "/usr/include/curl/multi.h" 3 4
__attribute__((availability(macosx,introduced=10.9)))
            CURLMcode curl_multi_wait(CURLM *multi_handle,
                                      struct curl_waitfd extra_fds[],
                                      unsigned int extra_nfds,
                                      int timeout_ms,
                                      int *ret);
# 193 "/usr/include/curl/multi.h" 3 4
            CURLMcode curl_multi_perform(CURLM *multi_handle,
                                         int *running_handles);
# 206 "/usr/include/curl/multi.h" 3 4
            CURLMcode curl_multi_cleanup(CURLM *multi_handle);
# 236 "/usr/include/curl/multi.h" 3 4
            CURLMsg *curl_multi_info_read(CURLM *multi_handle,
                                          int *msgs_in_queue);
# 248 "/usr/include/curl/multi.h" 3 4
            const char *curl_multi_strerror(CURLMcode);
# 271 "/usr/include/curl/multi.h" 3 4
typedef int (*curl_socket_callback)(CURL *easy,
                                    curl_socket_t s,
                                    int what,
                                    void *userp,

                                    void *socketp);
# 288 "/usr/include/curl/multi.h" 3 4
typedef int (*curl_multi_timer_callback)(CURLM *multi,
                                         long timeout_ms,
                                         void *userp);


            CURLMcode curl_multi_socket(CURLM *multi_handle, curl_socket_t s,
                                        int *running_handles);

            CURLMcode curl_multi_socket_action(CURLM *multi_handle,
                                               curl_socket_t s,
                                               int ev_bitmask,
                                               int *running_handles);

            CURLMcode curl_multi_socket_all(CURLM *multi_handle,
                                            int *running_handles);
# 320 "/usr/include/curl/multi.h" 3 4
            CURLMcode curl_multi_timeout(CURLM *multi_handle,
                                         long *milliseconds);
# 336 "/usr/include/curl/multi.h" 3 4
typedef enum {

  CURLMOPT_SOCKETFUNCTION = 20000 + 1,


  CURLMOPT_SOCKETDATA = 10000 + 2,


  CURLMOPT_PIPELINING = 0 + 3,


  CURLMOPT_TIMERFUNCTION = 20000 + 4,


  CURLMOPT_TIMERDATA = 10000 + 5,


  CURLMOPT_MAXCONNECTS = 0 + 6,


  CURLMOPT_MAX_HOST_CONNECTIONS = 0 + 7,


  CURLMOPT_MAX_PIPELINE_LENGTH = 0 + 8,



  CURLMOPT_CONTENT_LENGTH_PENALTY_SIZE = 30000 + 9,



  CURLMOPT_CHUNK_LENGTH_PENALTY_SIZE = 30000 + 10,



  CURLMOPT_PIPELINING_SITE_BL = 10000 + 11,



  CURLMOPT_PIPELINING_SERVER_BL = 10000 + 12,


  CURLMOPT_MAX_TOTAL_CONNECTIONS = 0 + 13,


  CURLMOPT_PUSHFUNCTION = 20000 + 14,


  CURLMOPT_PUSHDATA = 10000 + 15,

  CURLMOPT_LASTENTRY
} CURLMoption;
# 397 "/usr/include/curl/multi.h" 3 4
            CURLMcode curl_multi_setopt(CURLM *multi_handle,
                                        CURLMoption option, ...);
# 410 "/usr/include/curl/multi.h" 3 4
            CURLMcode curl_multi_assign(CURLM *multi_handle,
                                        curl_socket_t sockfd, void *sockp);
# 425 "/usr/include/curl/multi.h" 3 4
struct curl_pushheaders;

            char *curl_pushheader_bynum(struct curl_pushheaders *h,
                                        size_t num);
            char *curl_pushheader_byname(struct curl_pushheaders *h,
                                         const char *name);

typedef int (*curl_push_callback)(CURL *parent,
                                  CURL *easy,
                                  size_t num_headers,
                                  struct curl_pushheaders *headers,
                                  void *userp);
# 2436 "/usr/include/curl/curl.h" 2 3 4
# 3 "src/auth.c" 2
# 1 "/usr/include/strings.h" 1 3 4
# 70 "/usr/include/strings.h" 3 4
int bcmp(const void *, const void *, size_t) ;
void bcopy(const void *, void *, size_t) ;
void bzero(void *, size_t) ;
char *index(const char *, int) ;
char *rindex(const char *, int) ;


int ffs(int);
int strcasecmp(const char *, const char *);
int strncasecmp(const char *, const char *, size_t);





int ffsl(long) __attribute__((availability(macosx,introduced=10.5)));
int ffsll(long long) __attribute__((availability(macosx,introduced=10.9)));
int fls(int) __attribute__((availability(macosx,introduced=10.5)));
int flsl(long) __attribute__((availability(macosx,introduced=10.5)));
int flsll(long long) __attribute__((availability(macosx,introduced=10.9)));



# 1 "/usr/include/string.h" 1 3 4
# 70 "/usr/include/string.h" 3 4
void *memchr(const void *__s, int __c, size_t __n);
int memcmp(const void *__s1, const void *__s2, size_t __n);
void *memcpy(void *__dst, const void *__src, size_t __n);
void *memmove(void *__dst, const void *__src, size_t __len);
void *memset(void *__b, int __c, size_t __len);
char *strcat(char *__s1, const char *__s2);
char *strchr(const char *__s, int __c);
int strcmp(const char *__s1, const char *__s2);
int strcoll(const char *__s1, const char *__s2);
char *strcpy(char *__dst, const char *__src);
size_t strcspn(const char *__s, const char *__charset);
char *strerror(int __errnum) __asm("_" "strerror" );
size_t strlen(const char *__s);
char *strncat(char *__s1, const char *__s2, size_t __n);
int strncmp(const char *__s1, const char *__s2, size_t __n);
char *strncpy(char *__dst, const char *__src, size_t __n);
char *strpbrk(const char *__s, const char *__charset);
char *strrchr(const char *__s, int __c);
size_t strspn(const char *__s, const char *__charset);
char *strstr(const char *__big, const char *__little);
char *strtok(char *__str, const char *__sep);
size_t strxfrm(char *__s1, const char *__s2, size_t __n);
# 104 "/usr/include/string.h" 3 4
char *strtok_r(char *__str, const char *__sep, char **__lasts);
# 116 "/usr/include/string.h" 3 4
int strerror_r(int __errnum, char *__strerrbuf, size_t __buflen);
char *strdup(const char *__s1);
void *memccpy(void *__dst, const void *__src, int __c, size_t __n);
# 130 "/usr/include/string.h" 3 4
char *stpcpy(char *__dst, const char *__src);
char *stpncpy(char *__dst, const char *__src, size_t __n) __attribute__((availability(macosx,introduced=10.7)));
char *strndup(const char *__s1, size_t __n) __attribute__((availability(macosx,introduced=10.7)));
size_t strnlen(const char *__s1, size_t __n) __attribute__((availability(macosx,introduced=10.7)));
char *strsignal(int __sig);
# 145 "/usr/include/string.h" 3 4
errno_t memset_s(void *__s, rsize_t __smax, int __c, rsize_t __n) __attribute__((availability(macosx,introduced=10.9)));
# 155 "/usr/include/string.h" 3 4
void *memmem(const void *__big, size_t __big_len, const void *__little, size_t __little_len) __attribute__((availability(macosx,introduced=10.7)));
void memset_pattern4(void *__b, const void *__pattern4, size_t __len) __attribute__((availability(macosx,introduced=10.5)));
void memset_pattern8(void *__b, const void *__pattern8, size_t __len) __attribute__((availability(macosx,introduced=10.5)));
void memset_pattern16(void *__b, const void *__pattern16, size_t __len) __attribute__((availability(macosx,introduced=10.5)));

char *strcasestr(const char *__big, const char *__little);
char *strnstr(const char *__big, const char *__little, size_t __len);
size_t strlcat(char *__dst, const char *__source, size_t __size);
size_t strlcpy(char *__dst, const char *__source, size_t __size);
void strmode(int __mode, char *__bp);
char *strsep(char **__stringp, const char *__delim);


void swab(const void * restrict, void * restrict, ssize_t);


__attribute__((availability(macosx,introduced=10.12.1))) __attribute__((availability(ios,introduced=10.1)))
__attribute__((availability(tvos,introduced=10.0.1))) __attribute__((availability(watchos,introduced=3.1)))

int timingsafe_bcmp(const void *__b1, const void *__b2, size_t __len);








# 1 "/usr/include/strings.h" 1 3 4
# 183 "/usr/include/string.h" 2 3 4
# 192 "/usr/include/string.h" 3 4
# 1 "/usr/include/secure/_string.h" 1 3 4
# 193 "/usr/include/string.h" 2 3 4
# 93 "/usr/include/strings.h" 2 3 4
# 4 "src/auth.c" 2

# 1 "inc/auth.h" 1
# 17 "inc/auth.h"
int login(char *username, char *passwd);

void mod_init();
void mod_cleanup();
int http_post(char *url, char *data, size_t datalen, char *buffer, size_t buf_size);
# 6 "src/auth.c" 2
# 22 "src/auth.c"
typedef struct http_buffer_s
{
    size_t size;
    size_t len;
    unsigned int flags;
    char *data;

} http_buffer_t;


void hexdump (char *desc, void *addr, int len) {
    int i;
    unsigned char buff[17];
    unsigned char *pc = (unsigned char*)addr;


    if (desc != ((void *)0))
        printf ("%s:\n", desc);

    if (len == 0) {
        printf("  ZERO LENGTH\n");
        return;
    }
    if (len < 0) {
        printf("  NEGATIVE LENGTH: %i\n",len);
        return;
    }


    for (i = 0; i < len; i++) {


        if ((i % 16) == 0) {

            if (i != 0)
                printf ("  %s\n", buff);


            printf ("  %04x ", i);
        }


        printf (" %02x", pc[i]);


        if ((pc[i] < 0x20) || (pc[i] > 0x7e))
            buff[i % 16] = '.';
        else
            buff[i % 16] = pc[i];
        buff[(i % 16) + 1] = '\0';
    }


    while ((i % 16) != 0) {
        printf ("   ");
        i++;
    }


    printf ("  %s\n", buff);
}


static size_t curl_easy_write(char *bufptr, size_t size, size_t nitem, void *userp)
{
    int datalen = size * nitem;
    int copylen = 0;
    http_buffer_t *http_buffer = (http_buffer_t*)userp;

    if( http_buffer->len < http_buffer->size )
    {
        copylen = http_buffer->size - http_buffer->len;
        copylen = (copylen<datalen?copylen:datalen);
        __builtin___memcpy_chk (http_buffer->data, bufptr, copylen, __builtin_object_size (http_buffer->data, 0));
    }

    if( datalen - copylen)
    {
        fprintf(__stderrp, "Buffer size insufficent");
    }


    http_buffer->len += datalen;

    printf("Return :%d\n", datalen);

    return datalen;
}

int http_post(char *url, char *data, size_t datalen, char *buffer, size_t buf_size)
{
    CURL *curl;
    CURLcode res;
    struct curl_slist *headers = ((void *)0);
    http_buffer_t http_buffer;
    int err = 0;


    if (url && data && buffer && buf_size )
    {

        if((curl = curl_easy_init()))
        {
            curl_easy_setopt(curl,CURLOPT_URL,url);






            curl_easy_setopt(curl,CURLOPT_VERBOSE,1L);






            headers = curl_slist_append(headers, "Accept: application/json");
            headers = curl_slist_append(headers, "Content-Type: application/json");
            headers = curl_slist_append(headers, "charsets: utf-8");

            curl_easy_setopt(curl,CURLOPT_POST,1);
            curl_easy_setopt(curl,CURLOPT_HTTPHEADER,headers);
            curl_easy_setopt(curl,CURLOPT_POSTFIELDS,data);
            curl_easy_setopt(curl,CURLOPT_POSTFIELDSIZE,datalen);


            hexdump("Input", data, datalen);

            http_buffer.data = buffer;
            http_buffer.size = buf_size;
            http_buffer.len = 0;

            curl_easy_setopt(curl,CURLOPT_WRITEFUNCTION,curl_easy_write);
            curl_easy_setopt(curl,CURLOPT_WRITEDATA,&http_buffer);


            res = curl_easy_perform(curl);


            if(res != CURLE_OK)
            {
                fprintf(__stderrp, "curl_easy_perform() failed: %s\n",curl_easy_strerror(res));
                err = -1;
            }
            else
            {
                err = http_buffer.len;

                hexdump("Output",buffer, http_buffer.len);

            }

            curl_slist_free_all(headers);


            curl_easy_cleanup(curl);
        }
        else
        {
            fprintf(__stderrp, "Failed to init curl");
            err = -1;
        }
    }
    else
    {
        fprintf(__stderrp, "Input args error");
        err = -2;
    }
    return err;
}

void mod_init()
{

    curl_global_init( ((1<<0)|(1<<1)) );
}

void mod_cleanup()
{

    curl_global_cleanup();
}

int json_encode(char *name[], char *value[], char count, char *json, size_t json_size)
{
    int i = 0;
    int len = 0;
    int temp = 0;
    if( json && json_size )
    {
        json[len++] = '{';
        for(i = 0; i < count; i++)
        {
            temp = __builtin___snprintf_chk (&json[len], json_size - len - 2, 0, __builtin_object_size (&json[len], 2 > 1 ? 1 : 0), "\"%s\":\"%s\"", name[i], value[i]);
            if( temp <= 0 )
                break;

            len += temp;
            if(( i < count - 1 ) && ( json_size - len ) > 2)
            {
                json[len++] = ',';
            }
        }

        json[len++]='}';
        json[len]= '\0';
    }

    return len;
}


int login(char *username, char *passwd)
{
  char jsonObj[1024];
  int jsonObjSize = json_encode( (char* []){"email", "password"}, (char* []){username, passwd}, 2, jsonObj, sizeof(jsonObj));
  printf("Sending : %s\n", jsonObj);
  int len = http_post("http://10.0.0.127/standalone/login", jsonObj, jsonObjSize, jsonObj, sizeof(jsonObj));
  if( len > 0 )
  {
      printf("Login successfull : %s\n", jsonObj);
      hexdump("Login", jsonObj, len);
  }
  return 0;
}
