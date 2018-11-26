: '
#problem:
kcc can compile the crackle project: https://github.com/mikeryan/crackle.git
but the tests will all fail when gcc can work well

#testing platform information:

java: 
	java version "1.8.0_181"
	Java(TM) SE Runtime Environment (build 1.8.0_181-b13)
	Java HotSpot(TM) 64-Bit Server VM (build 25.181-b13, mixed mode)

ubuntu 16.04

kcc: 	kcc: version 1.0 GNU-compatible

	Build number: 07dcaa9-1541738973679
	Current profile: x86_64-linux-gcc-glibc
	Installed profiles: x86_64-linux-gcc-glibc-gnuc-reverse-eval-order
	                    x86_64-linux-gcc-glibc-gnuc
	                    x86_64-linux-gcc-glibc
	                    x86-gcc-limited-libc
	                    x86_64-linux-gcc-glibc-reverse-eval-order
	Default profile: x86_64-linux-gcc-glibc

make:
	GNU Make 4.1
	Built for x86_64-pc-linux-gnu
	Copyright (C) 1988-2014 Free Software Foundation, Inc.
'

bash precheck.sh
if [ -d "crackle" ]; then
        echo "crackle already exists, do not need to clone"
else
        git clone https://github.com/mikeryan/crackle.git
fi
cd crackle
git checkout 0fc1938be21191248ef6b130c3c681c19ef7da88
#append CFLAGS "-std=gnu11"
find ./ -type f -name Makefile -exec sed -i  's/^CFLAGS  ?=.*/& -std=gnu11/' {} \;
#no werror
find ./ -type f -name Makefile -exec sed -i  's/-Werror//' {} \;
make CC=kcc 
make test
