#include <string.h>
#include <stdlib.h>
#include <stdio.h>

void fill_ev_table(char *input) {
    char *str1, *subtoken;
    char *saveptr1=NULL,*saveptr2=NULL;
    int j;
    long eid=0;
    j = 1;
    str1 = input;
    char *token = strtok_r(str1, ";", &saveptr1);
    printf("mytoken %s\n",token) ;
    //char token[] = "mytoken is onstart=uncollapse,scrollhome";
    subtoken = strtok_r(token, "=", &saveptr2);
    printf("subtoken %s\n",subtoken) ;      
}
int main(int argc, char *argv[]){
    char str2[] = "onstart=uncollapse,scrollhome;button5=d";
    fill_ev_table(str2);
    return 0;
}
