: ' 
this is another project having problem because of aotmic
there is flags about atomic for gcc but kcc doesnt have
the project is disque commit 0192ba7e1cda157024229962b7bee1c6e86d771b
the code main.c shows if there is flag __ATOMIC_RELAXED the preprocessed code will be (gcc case)
```
do { size_t _n = (size+(sizeof(size_t))); if (_n&(sizeof(long)-1)) _n += sizeof(long)-(_n&(sizeof(long)-1)); if (zmalloc_thread_safe) { __atomic_add_fetch(&used_memory,(size+(sizeof(size_t))),0); } else { used_memory += _n; } } while(0);
```
if not it will be(kcc case)
    
```
do { size_t _n = (size+(sizeof(size_t))); if (_n&(sizeof(long)-1)) _n += sizeof(long)-(_n&(sizeof(long)-1)); if (zmalloc_thread_safe) { do { pthread_mutex_lock(& &used_memory_mutex); used_memory += (size+(sizeof(size_t))); pthread_mutex_unlock(& &used_memory_mutex); } while(0); } else { used_memory += _n; } } while(0);
```

then for the kcc version it will give the error (if we use gcc to run this version, it will also have same error)
```
lock1.c:9:24: error: lvalue required as unary ‘&’ operand
     pthread_mutex_lock(&mutex); \
```

    
'
bash ./precheck.sh
echo "kcc main.c -pthread -std=c99"
kcc main.c -pthread -std=c99
echo "--------------------------------------------"
echo "gcc main.c -pthread -std=c99"
gcc main.c -pthread -std=c99
