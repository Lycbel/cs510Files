#include <signal.h>
#include <string.h>
#define system_strdup strdup // here will be  error4
typedef char *(*curl_strdup_callback)(const char *str);
struct sigpipe_ignore {
  struct sigaction old_pipe_act;// here will be one error1
};

int main(){
 return 1;
}
int test1(){
struct sigaction action; // here will be one error2
}
int test(struct sigpipe_ignore *ig){
 memset(&ig->old_pipe_act, 0, sizeof(struct sigaction)); // here will be one error3
}
int test2(){
 curl_strdup_callback Curl_cstrdup = (curl_strdup_callback)system_strdup;// here to help generate error4
}
