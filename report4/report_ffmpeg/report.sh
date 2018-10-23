#report for ffmpeg: this is the minimized input; kcc can't handle #include <stdatomic.h>
#use Ubuntu 16.04.5
#kcc: version 1.0 GNU-compatible Build number: aa40afb-1536898951972
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


#use kcc to compile
echo "#include <stdatomic.h>

int main(){
return 1;
}" > main.c

kcc main.c
