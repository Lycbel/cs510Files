
#include <stdlib.h>
#include <pthread.h>

#if defined(__ATOMIC_RELAXED)
//Implementation using __atomic macros.
#define atomicIncr(var,count,mutex) __atomic_add_fetch(&var,(count),__ATOMIC_RELAXED)
#elif defined(HAVE_ATOMIC)
//Implementation using __sync macros.

#define atomicIncr(var,count,mutex) __sync_add_and_fetch(&var,(count))

#else
//Implementation using pthread mutex.

#define atomicIncr(var,count,mutex) do { \
    pthread_mutex_lock(&mutex); \
    var += (count); \
    pthread_mutex_unlock(&mutex); \
} while(0)

#endif

#define update_zmalloc_stat_alloc(__n) do { \
    size_t _n = (size+(sizeof(size_t))); \
    if (_n&(sizeof(long)-1)) _n += sizeof(long)-(_n&(sizeof(long)-1)); \
    if (zmalloc_thread_safe) { \
        atomicIncr(used_memory,__n,&used_memory_mutex); \
    } else { \
        used_memory += _n; \
    } \
} while(0)

static int zmalloc_thread_safe = 0;
static size_t used_memory = 0;
pthread_mutex_t used_memory_mutex;


void *zmalloc(size_t size) {
    void *ptr = malloc(size+1);
    *((size_t*)ptr) = size;
    update_zmalloc_stat_alloc(size+1);
    return (char*)ptr+1;
}

int main(){
return 0;
}
