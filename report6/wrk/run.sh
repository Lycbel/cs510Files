: '
this is a minimized input for condition:
using kcc to compile wrk and choosing to use system`s luajit as kcc can`t compile it. the compilation will fail the error is:

src/units.c:17:1: error: Encountered an unknown error. This may be due to encountering undefined behavior, an unsupported language feature, or a bug in this tool.

    Unknown error (UNK-1)

src/units.c:23:1: error: Encountered an unknown error. This may be due to encountering undefined behavior, an unsupported language feature, or a bug in this tool.

    Unknown error (UNK-1)

src/units.c:29:1: error: Encountered an unknown error. This may be due to encountering undefined behavior, an unsupported language feature, or a bug in this tool.

    Unknown error (UNK-1)

src/units.c:35:1: error: Encountered an unknown error. This may be due to encountering undefined behavior, an unsupported language feature, or a bug in this tool.

    Unknown error (UNK-1)

Fatal error: exception Stack overflow
Translation failed. To repeat, run this command in directory wrk:
kcc -d -std=c99 -Wall -O2 -D_REENTRANT -D_POSIX_C_SOURCE=200112L -D_BSD_SOURCE -D_DEFAULT_SOURCE -Iobj/include -I/home/andy/Desktop/test598/wrk/include -I/usr/include -c -o obj/units.o src/units.c
Makefile:70: recipe for target `obj/units.o` failed
make: *** [obj/units.o] Error 2

platform info:
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
#to run the minimised input 
bash precheck.sh
echo "kcc units.c -std=c99 -o hello"
kcc units.c -std=c99 -o hello

