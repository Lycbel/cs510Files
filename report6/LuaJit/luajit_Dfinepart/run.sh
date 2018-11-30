#1)this is part of lua-jit's problem, in lj_def.h file it need to check the macro __GNUC__, but kcc doesn't have it
#2)if define the __GNUC__ by -D__GNUC__=5, in the code it keeps undefined, however if we use this to define HELLO or APPLE etc. They can be defined.
#3)if define it in the file by #define -D__GNUC__ 5 ,  it can be defined 
#4)to compile the project I replace all the __GNUC__ to __HELLO__=5,then define problem will be solved, (maybe it is not a valid approach)
#then by adding the cflags= "-D__HELLO__=5 -std=gnu11" it can finish compilation with printing lots of errors
#5)but when test, it will show the error "Execution failed (configuration dumped)"
#use Ubuntu 16.04.5
#kcc: version 1.0 GNU-compatible Build number: 77a4079-1542856183611
#check make installed
if [ -z "$(make --version 2>&1 >/dev/null)" ]; then
 echo "make is already installed"
else
 sudo apt install make
fi
#check for java
if java -version; then
        echo "java installed"
else
	echo "java not installed"
        sudo add-apt-repository ppa:webupd8team/java
        sudo apt-get update
        sudo apt-get install oracle-java8-installer
fi
#check for kcc

if [ -z "$(kcc --version 2>&1 >/dev/null)" ]; then
 echo "kcc is already installed"
else
 curl https://runtimeverification.com/match/1.0/rv-match-linux-64-1.0-SNAPSHOT.jar >> temp.jar
 sudo java -jar temp.jar
fi
kcc main.c -D__GNUC__=5



