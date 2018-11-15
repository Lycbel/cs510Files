#this is using libtool to create a very simple C library file
#core command is 
#libtool --tag CC --mode=compile $CC -c fun.c 
#libtool --tag CC --mode=link $CC -o libfun.la fun.lo -rpath /$TEMP 
bash precheck.sh
TEMP=$(pwd)/temp
clean() {
rm *.o >/dev/null 2>&1
rm *.lo >/dev/null 2>&1
rm *.la >/dev/null 2>&1
}
compile() {
CC=$1
echo "-----------compile by $1---------------"
libtool --tag CC --mode=compile $CC -c fun.c 
libtool --tag CC --mode=link $CC -o libfun.la fun.lo -rpath /$TEMP  
echo "cleaning all produced files"
clean
}
compile kcc
compile gcc

