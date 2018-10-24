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
