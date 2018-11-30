#this is part of lua-jit's problem, when to build mimilua and run it memeory will run out
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
#use gcc will not have any problem
echo "-------kcc   -c -o minilua.o minilua.c--------"
kcc  -c -o minilua.o minilua.c
echo "-------kcc   -o minilua minilua.o -lm-------"
kcc  -o minilua minilua.o -lm 
echo "-------run ./minilua dynasm.lua-------"
./minilua dynasm.lua
