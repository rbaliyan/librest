#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <ctype.h>
#include <unistd.h>
#include <fcntl.h>
#include "alloc.h"
#include "utils.h"
#include "json.h"
#include "json_parse.h"


extern int json_dict_add(json_t *json, const char *key, const json_val_t* val);
extern int json_list_add(json_list_t* list, json_val_t* val);
static unsigned int get_hex(const char *start, const char *end, const char ** raw, json_err_t *err);
static unsigned int get_octal(const char *start, const char *end, const char ** raw, json_err_t *err);
static bool get_boolean(const char *start, const char *end, const char ** raw, json_err_t *err);
static double get_fraction(const char *start, const char *end, const char ** raw, json_err_t *err);
static json_type_t get_number(const char *start, const char *end, const char ** raw, json_err_t *err, void* buffer);
static const char* get_string(const char *start, const char *end, const char ** raw, json_err_t *err);
static json_list_t* json_parse_list(const char *start, const char *end, const char **raw, json_err_t *err);
static json_val_t* json_parse_val(const char *start, const char *end, const char **raw, json_err_t *err);
static json_t* json_parse_obj(const char *start, const  char *end, const  char **raw, json_err_t *err);



/* Read hex in string and return integer
* for any error set raw ptr to start to indicate
* nothing was parsed 
*/
static unsigned int get_hex(const char *start, const char *end, const char ** raw, json_err_t *err)
{
    const char *begin = start;
    unsigned int number = 0;
    unsigned int count = 0;
    int hex_max = sizeof(int) * 2;
    int val = 0;

    /* Traverse string */
    for(*raw = start; *start && start < end; *raw = ++start){
        count++;
        /* size of byte is 2 nibble */
        if(count > hex_max){
            /* Overflow */
            fprintf(stderr, "Maximum length of int on this platform is %d"
                            ", resulting in max hex length %d\n", (int)sizeof(int), hex_max);

            if(err)
                *err = JSON_ERR_OVERFLOW;
        }

        /* Convert to Hex a-f, A-F, 0-9*/
        val = tohex(*start);

        if(val == -1){
            if(count == 1){
            /* No Hex Digit Found */
                fprintf(stderr, "Invalid Hex digit %c\n", *start);
                /* Nothing Parsed */
                *raw = begin;
                if(err)
                    *err = JSON_ERR_PARSE;
                return 0;
            }
            break;
        }

        number =  (number<<4) | val;
    }

    return number;
}

/* Read octal in string and return integer
* for any error set raw ptr to start to indicate
* nothing was parsed 
*/
static unsigned int get_octal(const char *start, const char *end,const  char ** raw, json_err_t *err)
{
    const char *begin = start;
    unsigned int number = 0;
    int octal_max = sizeof(int) * 8 / 3;
    unsigned int count = 0;
    int val = 0;

    /* Traverse all string */
    for(*raw = start; *start && start < end; *raw = ++start){
        count++;
        /* size of byte is 2 nibble */
        if(count > octal_max){
            /* Overflow */
            fprintf(stderr, "Maximum length of int on this platform is %d"
                            ", resulting in max hex length %d\n", (int)sizeof(int), octal_max);
            if(err)
                *err = JSON_ERR_OVERFLOW;
        }
        /* Convert to octal 0-7*/
        val = todigit(*start);
        if((val == -1) || (val > 7)){
            if(count == 1){
            /* No Hex Digit Found */
                fprintf(stderr, "Invalid octal digit %c\n", *start);
                /* Nothing Parsed */
                *raw = begin;
                if(err)
                    *err = JSON_ERR_PARSE;
                return 0;
            }
            break;
        }
        
        number =  (number<<3) | val;
    }

    return number;
}

/* Read fraction in string and return double
* for any error set raw ptr to start to indicate
* nothing was parsed 
*/
static double get_fraction(const char *start, const char *end,const  char** raw, json_err_t *err)
{
    const char *begin = start;
    double number = 0;
    double multiple = 1.0f;
    int val = 0;
    int count = 0;

    /* Traverse all string */
    for(*raw = start; *start && start < end; *raw = ++start){
        count++;

        /* Convert to digit */
        val = todigit(*start);
        if(val == -1 ){
            if(count == 1){
                fprintf(stderr,"Failed to parse, nothing after decimal\n");
                /* Nothing Parsed */
                *raw = begin;
                if(err)
                    *err = JSON_ERR_PARSE;
                return 0;
            }
            break;
        }

        multiple *= 0.1f;
        number = number + val * multiple;     
    }
    if((*raw < end)&& (**raw == 'f' || **raw == 'F')){
        *raw = (*raw) + 1;
    }

    return number;
}

/* Read number in string and return double
* for any error set raw ptr to start to indicate
* nothing was parsed 
*/
static json_type_t get_number(const char *start, const char *end,const char** raw, json_err_t *err, void *buffer)
{
    json_type_t json_type = JSON_TYPE_INT;
    const char *begin = start;
    const char *temp = NULL;
    int sign = 1;
    double number_float = 0;
    int number_int = 0;
    long long number_long = 0;
    int val ;
    int count = 0;
    bool overflow = false;

    /* Check valid args */
    if(start && end && raw && (end >= start)){
        /* Nothing Parsed */
        *raw = start;

        /* Nubmer prefix */
        if(*start == '-'){
            /* Negative number */
            start++;
            sign = -1;
        } else if(*start == '+'){
            sign = 1;
            start++;
        }
         /* Is this end of string */
        if(start >= end){
            fprintf(stderr, "Failed to parse invalid number\n");
            *raw = begin;
            if(err)
                *err = JSON_ERR_PARSE;
            return JSON_TYPE_INVALID;
        }

        /* Fractional Number */
        if (*start == '.'){
            /* Float Number can start with dot or 0 and dot */
            number_float = get_fraction(start + 1, end, &temp, err);
            if(temp == (start + 1)){
                fprintf(stderr, "Failed to parse fraction\n");
                
                /* Nothing Parsed */
                *raw = begin;
                return 0;
            }
            *raw = temp;
            memcpy(buffer, &number_float, sizeof(number_float));
            return JSON_TYPE_DOUBLE;
        }

        /* Hex and octal both start with 0 */
        if((*start == '0') && ((end - start ) > 1)){
            /* 0x or 0X is used for hex values */
            if((*(start + 1) == 'x') || (*(start + 1) == 'X')){
                /* We are not allowing negative hex */
                if(sign == -1){
                    /* Hex can not be negative */
                    fprintf(stderr, "Hex can not be negative\n");
                    *raw = begin;
                    if(err)
                        *err = JSON_ERR_PARSE;
                    return JSON_TYPE_INVALID;
                }

                /* Parse Hex Value */
                number_int = get_hex(start + 2, end, &temp, err);

                /* Check if parsing failed */
                if(temp == (start + 2)){
                    fprintf(stderr,"Failed to parse hex value\n");
                    *raw = begin;
                    return JSON_TYPE_INVALID;
                }
                
                *raw = temp;
                memcpy(buffer, &number_int, sizeof(number_int));
                return JSON_TYPE_HEX; 
            } else if(*(start + 1)== '.'){

                /* Float Number can start with dot or 0 and dot */
                number_float = get_fraction(start + 2, end, &temp, err);

                if(temp == (start + 2)){
                    fprintf(stderr, "Failed to parsed fraction\n");
                    
                    /* Nothing Parsed */
                    *raw = begin;
                    return JSON_TYPE_INVALID;
                }

                *raw = temp;
                /* Return with sign */
                number_float *= sign;
                memcpy(buffer, &number_float, sizeof(number_float));
                return JSON_TYPE_DOUBLE;

            } else {
                /* Rest all are octal numbers */
                if(sign == -1){
                    fprintf(stderr, "Octal can not be negative\n");
                    return 0;
                }
                /* Parse Hex Value */
                number_int = get_octal(start + 1, end, &temp, err);

                /* Check if parsing failed */
                if(temp == (start + 1)){
                    fprintf(stderr,"Failed to parse octal value\n");
                    *raw = begin;
                    return 0;
                }
                
                 *raw = temp;
                 memcpy(buffer, &number_int, sizeof(number_int));
                return JSON_TYPE_OCTAL;  
            }
        }

        /* Parse real number */
        number_float = 0.0f;
        number_int = 0;

        /* Traverse all string */
        for(; *start && start < end; *raw = ++start){
            
            /* Decimal indicate fractional part */
            if(*start == '.'){
                /* Parse fractional part */
                number_float = get_fraction(start + 1, end, &temp, err);

                /* Check for failure */
                if(start + 1 == temp){
                    fprintf(stderr, "Failed to parse fractional part\n");
                    *raw = begin;
                    return 0;
                }

                *raw = temp;
                number_float = (number_float + number_int) *sign;
                memcpy(buffer, &number_float, sizeof(number_float));
                return JSON_TYPE_DOUBLE;
                
            } else if((*start == 'f' )|| (*start == 'F')){
                /* f, F are used to indicate float numbers */
                if(count == 0){
                    fprintf(stderr,"Number missing");
                        *raw = begin;
                        if(err)
                        *err = JSON_ERR_PARSE;
                    return JSON_TYPE_INVALID;
                }
                *raw = start + 1;
                number_float = number_int * sign;
                memcpy(buffer, &number_float, sizeof(number_float));
                return JSON_TYPE_DOUBLE;
            } else if((*start == 'l') || (*start == 'L')){
                /* l, L are used to indicate long numbers*/
                if(count == 0){
                    /* Nothing Parsed */
                    fprintf(stderr,"Number missing");
                    *raw = begin;
                    if(err)
                        *err = JSON_ERR_PARSE;
                    return JSON_TYPE_INVALID;
                }
                *raw = start + 1;
                number_long = number_int * sign;
                memcpy(buffer, &number_long, sizeof(number_long));
                return JSON_TYPE_LONG;

            } else if((*start == 'u') || (*start == 'U')){
                /*u,U are used to specify unsigned numbers*/
                if(count == 0){
                    /* Nothing Parsed */
                    fprintf(stderr,"Number missing");
                    *raw = begin;
                    if(err)
                        *err = JSON_ERR_PARSE;
                    return JSON_TYPE_INVALID;
                } else if (sign == -1 ){
                     /* Nothing Parsed */
                    fprintf(stderr,"Unsigned flag on negative number");
                    *raw = begin;
                    if(err)
                        *err = JSON_ERR_PARSE;
                    return JSON_TYPE_INVALID;
                }
                *raw = start + 1;
                number_int = number_int * sign;
                memcpy(buffer, &number_int, sizeof(number_int));
                return JSON_TYPE_UINT;

            } else {
                count++;

                /* convert to digit 0-9 */
                val = todigit(*start);

                /* Check for failure */
                if(val == -1){
                    if(count == 1){
                    /* No Digit Found */
                        fprintf(stderr, "Invalid digit %c\n", *start);
                        *raw = begin;
                        if(err)
                            *err = JSON_ERR_PARSE;
                        return 0;
                    }
                    *raw = start;
                    break;
                }

                /* Get Integer Part of Number */
                number_int = (number_int * 10) + val;
                if(!overflow && (number_int < 0)){
                    fprintf(stderr, "Overflow\n");
                    overflow = true;
                }
            }
        }

        /* return with sign */
        number_int = number_int * sign;
        memcpy(buffer, &number_int, sizeof(number_int));
        return JSON_TYPE_INT;
    }

    return 0;
}

/*
* Parse boolean values
*/
static bool get_boolean(const char *start, const char *end,const  char** raw, json_err_t *err)
{
    const char *begin = start;
    int len = end - start;
    int tlen = 4;
    int flen = 5;
    if(start && end && raw && (len > 0)){
        /* Nothing Parsed */
        *raw = start;

        if((len >= tlen) || (len >= flen)){
            if(strncmp(start, "true", 4) == 0){
                *raw = trim(start + 4, end);
                return true;
            } else if(strncmp(start, "false", 5) == 0){
                *raw = trim(start + 5, end);
                return false;
            }
        }
    }
    if(err)
        *err = JSON_ERR_PARSE;
    return false;
}

/*
* Parse string in double quotes, 
* string may also contain double quotes after escaping with backslash
* double quotes are changed to Null characters
*/
static const char *get_string(const char *start, const char *end,const  char** raw, json_err_t *err)
{
    const char *begin = start;
    bool escape_on = false;
    const char *str_start = NULL;
    char *buffer = NULL;

    if(start && end && raw ){

        /* First characters should be quotes */
        if(*start != '"')
            return NULL;

        /* Set it to NULL */
        start++;
        str_start = start;

        /* For now we allow line break */
        for(*raw = begin;  *start && (start < end); *raw = ++start){
            /* Escaped */
            if(*start == '/'){
                /* Esacpe Sign, can be used to embed double quotes */
                escape_on = !escape_on;
            } else if((*start == '"' ) &&( !escape_on )){
                *raw = start + 1;
                buffer = buffer_alloc(start - str_start + 1);
                if(buffer){
                    memcpy(buffer, str_start, start - str_start );
                    buffer[start - str_start] = '\0';
                    return (const char*)buffer;
                }
                if(err)
                    *err = JSON_ERR_NO_MEM; 
                break;
            } else {
                /* Escape is only applied to next one character */
                escape_on = false;
            }
        }
    } else {
        if(err)
        *err = JSON_ERR_ARGS;
        fprintf(stderr,"Invalid args");
    }

    /* Nothing Parsed */
    *raw = start;
    return NULL;
}

/*
* Parse List of values
*/
static json_list_t* json_parse_list(const char *start, const char *end,const  char **raw, json_err_t *err)
{
    json_list_t* list = NULL;
    json_val_t *val = NULL;
    const char *begin = start;
    const char *temp = NULL;

    /* Check data */
    if(start && end && raw && (start < end)){

        /* Check beginning */
        if(*start != '['){
            fprintf(stderr, "List must begin with [\n");
            *raw = begin;
            return NULL;
        }

        /* Trim Data */
        start = trim(start + 1, end);
        if(start == end){
            fprintf(stderr, "Missing ]\n");
            *raw = begin;
            return NULL;
        }

        /* Allocate List */
        list = json_alloc_list();
        if(!list){
            fprintf(stderr, "Failed to init List\n");
            if(err)
                *err = JSON_ERR_NO_MEM;
            *raw = begin;
            return NULL;
        }

        /* Check for empty  list */
        if(*start == ']'){
            /* Empty List */
            *raw = start + 1;
            return list;
        } 

        /* Parse all data */
        for(*raw = begin; *start && (start < end); *raw = start ){

            /* Parse Value */
            val = json_parse_val(start, end, &temp, err);

            /* Check for failure */
            if(!val || (temp == start)){
                fprintf(stderr, "Failed to parse value\n");
                json_free_list(list);
                *raw = begin;
                if(err)
                    *err = JSON_ERR_PARSE;
                return NULL;
            }

            /* Add Value in List */
            if(!json_list_add(list, val)){
                fprintf(stderr, "Failed to add value in List\n");
                *raw = begin;
                if(err)
                    *err = JSON_ERR_NO_MEM;
                json_free_list(list);
                return NULL;
            }

            /* Trim data */
            start = trim(temp, end);
            if(start < end ){
                /* Check if end of list reached */
                if(*start == ']'){
                    *raw = start + 1;
                    return list;
                } else if(*start != ',') {
                    /* List Must have comma */
                    fprintf(stderr, "Missing ,");
                    *raw = begin;
                    json_free_list(list);
                    if(err)
                        *err = JSON_ERR_PARSE;
                    return NULL;
                }
                /* Trim after comma */
                start = trim(start+1, end);
            }
        }
        
    }
    /* Failed to find the end of list */
    if(list){
        json_free_list(list);
    }
    if(err)
        *err = JSON_ERR_PARSE;

    return NULL;
}

/*
* Json Parse Value
*
*/
static json_val_t* json_parse_val(const char *start, const char *end,const  char **raw, json_err_t *err)
{
    json_val_t *j_val = NULL;
    const char *begin = start;
    const char *str_val = NULL;
    json_list_t *l_val = NULL;
    const char *temp = NULL;
    double d_val = 0.0f;
    bool b_val = false;
    json_t *json_obj = NULL;
    json_type_t json_type;
    char num_buffer[sizeof(json_val_t)];

    /* Check for valid dat */
    if(start && end && raw && ( start < end )){
        /* Parse Value */
        switch(*start){
            case '{':
                /* Parse Json Object */
                json_obj = json_parse_obj(start, end, &temp, err);

                /* Check for failure */
                if((start == temp) ||(json_obj == NULL)){
                    fprintf(stderr, "Failed to parse object\n");
                    start = begin;
                    return NULL;
                }
                *raw = temp;
                j_val = json_alloc_val(JSON_TYPE_OBJ, (void*)json_obj);
                break;

            case '[':
                /* Parse List */
                l_val = json_parse_list(start, end, &temp, err);

                /* Check for failure */
                if((start == temp) ||(l_val == NULL)){
                    fprintf(stderr, "Failed to parse object\n");
                    return NULL;
                }
                *raw = temp;
                j_val = json_alloc_val(JSON_TYPE_LIST, (void*)l_val);
                break;

            case 't' :case 'f':
                /* Parse boolean */
                b_val = get_boolean(start, end, &temp, err);

                /* Check for failure */
                if((start == temp)|| !b_val){
                    fprintf(stderr, "Failed to parse object\n");
                    return NULL;
                }
                *raw = temp;
                j_val = json_alloc_val(JSON_TYPE_BOOL, (void*)&b_val);
                break;

            case '"':
                /* Parse quoted string */
                str_val = get_string(start, end, &temp, err);

                /* Check for failure */
                if((start == temp) || !str_val){
                    fprintf(stderr, "Failed to parse object\n");
                    return NULL;
                }

                *raw = temp;
                j_val = json_alloc_val(JSON_TYPE_STR, (void*)str_val);
                break;

            case '0': case '1': case '2': case '3': case '4':
            case '5': case '6': case '7': case '8': case '9':
            case '.': case '+':case '-':


                /* Parse Number */
                json_type = get_number(start, end, &temp, err, num_buffer);

                /* Check for failre */
                if(start == temp){
                    fprintf(stderr, "Failed to parse object\n");
                    return NULL;
                }
                *raw = temp;
                j_val = json_alloc_val(json_type, num_buffer);
                break;

            default:
                fprintf(stderr, "Missing Value\n");
                if(err)
                    *err = JSON_ERR_PARSE;
                return NULL;
        }
    }

    if(!j_val && err)
        *err = JSON_ERR_NO_MEM;
    
    return j_val;
}


/*
* Parse single Json object as dcitionary
*/
static json_t* json_parse_obj(const char *start, const  char *end, const  char **raw, json_err_t *err)
{
    const char *begin = start;
    const char *key = NULL;
    const char *temp = NULL;
    json_t* json = NULL;
    json_val_t *val = NULL;

    /* Check for args */
    if(start && end && raw){
        /* Nothing Parsed */
        *raw = start;

        /* Trim Extra Space */
        start = trim(start, end);

        /* Object should start with { */
        if(*start != '{'){
            fprintf(stderr, "Missing {");
            if(err)
                *err = JSON_ERR_PARSE;
            *raw = begin;
            return NULL;
        }

        /* Trim after { */
        start = trim(start + 1, end);

        /* Check if we are at the end */
        if(start >= end){
            fprintf(stderr, "Missing }\n");
            if(err)
                *err = JSON_ERR_PARSE;
            *raw = begin;
            return NULL;
        }

        /* Alocate JSON object */
        if(!(json=json_alloc_obj())){
            fprintf(stderr, "Failed to allocate json object\n");
            if(err)
                *err = JSON_ERR_NO_MEM;
            *raw = begin;
            return NULL;
        }

        if(*start == '}'){
            temp = trim(start + 1, end);
            
            if(err)
                *err = JSON_ERR_SUCCESS;
            *raw = temp;
            return json;
        }
        
        /* Traverse all string */
        for(*raw = begin; *start && (start < end); *raw = start){

            /* Rest Should bey Key:Val pair */
            key = get_string(start, end, &temp, err);
            if(!key || (temp == start)){
                fprintf(stderr, "Missing Key, should start with \"\n");
                return NULL;
            }
            
            /* Trim whitespace */
            start = trim(temp, end);
            if(( start == end ) || *start != ':'){
                fprintf(stderr, "Missing :\n");
                if(err)
                    *err = JSON_ERR_PARSE;
                return NULL;
            }

            /* Trim white space after collon */
            start = trim(start + 1, end);
            if( start >= end ){
                fprintf(stderr, "Missing Value after :\n");
                if(err)
                    *err = JSON_ERR_PARSE;
                return NULL;
            }

            /* Parse current Value */
            val = json_parse_val(start, end, &temp, err);

            /* Check for success */
            if(!val || (start == temp)){
                fprintf(stderr, "Failed to parse value for %s\n", key);
                return NULL;
            }

            /* Add Key value pair in json object */
            if(!json_dict_add(json, key, val)){
                fprintf(stderr, "Failed to add value for %s in json object\n", key);
                if(err)
                    *err = JSON_ERR_NO_MEM;
                return NULL;
            }

            /* Trim */
            start = trim(temp, end);
            if(start == end ){
                fprintf(stderr, "Missing }\n");
                return NULL;
            }
            
            /* Only valid characters are comma and } */
            switch(*start){
                case ',':
                    /* Process next field */
                    start = trim(start + 1, end);
                    continue;
                    break;

                case '}':
                    /* Object closure */
                    start = trim(start + 1, end);
                    /* Whats remaining */
                    *raw = start;
                    return json;

                default:
                    fprintf(stderr, "Missing ,\n");
                    *raw = begin;
                    if(err)
                        *err = JSON_ERR_PARSE;
                return NULL;
            }
        }
        
    }

    if(err)
        *err = JSON_ERR_SUCCESS;

    return json;
}

json_t* json_parse(const char *start, const char *end, json_err_t *err)
{
    const char *temp = NULL;
    json_t *json = NULL;
    if(start && end){
        start = trim(start, end);
        json = json_parse_obj(start, end, &temp, err);
        if(json && temp){
            start = trim(temp, end);
            if(start < end){
                fprintf(stderr, "Invalid characters after json object");
            }
        }
    } else {
        fprintf(stderr, "%sInvalid params", __func__);
        if(err)
            *err = JSON_ERR_ARGS;
    }

    return json;
}