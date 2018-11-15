TEMP=/home/andy/Desktop/test/libtooltest/temp
CC=gcc
if [ ! -d ".libs" ];then
mkdir .libs 
fi
$CC -c fun.c -fPIC -DPIC -o .libs/fun.o 
$CC -shared .libs/fun.o -Wl,-soname -Wl,libfun.so.0 -o .libs/libfun.so.0.0.0 
