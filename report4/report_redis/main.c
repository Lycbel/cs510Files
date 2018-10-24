/*
use kcc will have error:
main.c[16:12-22] : syntax error
Translation failed (kcc_config dumped). To repeat, run this command in directory redis_mini:
kcc -d main.c
*/
#include <stdlib.h>
void *rax_malloc(size_t size) {
    void *ptr = malloc(size);
    return (char*)ptr+10;
}

typedef struct raxNode {
} rax;
int main(){
rax *rax = rax_malloc(sizeof(*rax));
return 1;
}
