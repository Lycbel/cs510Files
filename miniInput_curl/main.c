#include <setjmp.h>
// add this line to 'solve' the main.c's problem
//typedef struct __jmp_buf_tag sigjmp_buf[1];
sigjmp_buf curl_jmpenv;
int main(){
 return 1;
}
