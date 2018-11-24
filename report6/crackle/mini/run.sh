:'
#problem:
kcc can compile the crackle project: https://github.com/mikeryan/crackle.git
but the tests will all fail when gcc can work well
/*
 * this is a minimized input for crackle https://github.com/mikeryan/crackle.git
 * kcc can compile the project, but it will fail all the tests, when gcc works correctly
 * the problem will be introduced when passing the struct object`s address to callback function
 * if change the value of the object in callback function, the value will be "reset" to original value after exit this function.
 */

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
'
bash precheck.sh
compile() {
CC=$1
echo "-----------compile by $1---------------"
$CC -std=gnu11 pcapMain.c -o hello -lpcap
./hello
rm hello
}
compile kcc
compile gcc
