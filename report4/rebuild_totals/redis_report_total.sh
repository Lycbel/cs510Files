#report for redis:
#use Ubuntu 16.04.5
#kcc: version 1.0 GNU-compatible Build number: aa40afb-1536898951972
#check make installed
if [ -z "$(make --version 2>&1 >/dev/null)" ]; then
 echo "make is already installed"
else
 sudo apt install make
fi
#if automake not installed
if [ -z "$(automake --version 2>&1 >/dev/null)" ]; then
 echo "automake is already installed"
else
 sudo apt install automake
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

if [ ! -d "redis" ];then
git clone https://github.com/antirez/redis.git
fi
cd redis
git checkout 54e8dd11ff4296b6633775c29e62222ed0244960
make CC=kcc
