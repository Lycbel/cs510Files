#report for git:
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

if [ ! -d "git" ];then
git clone https://github.com/git/git.git
fi
cd git
git checkout c4df23f7927d8d00e666a3c8d1b3375f1dc8a3c1
make CC=kcc


