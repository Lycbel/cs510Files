#report for curl:
#use Ubuntu 16.04.5
#kcc: version 1.0 GNU-compatibleBuild number: aa40afb-1536898951972
#git sha dee1700ce6ed2588f6db61fc9ca52ac8bccc71f8
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

if [ -d "curl" ]; then
        echo "curl already exists, do not need to clone"
else
        git clone https://github.com/curl/curl.git
fi
cd curl
git checkout dee1700ce6ed2588f6db61fc9ca52ac8bccc71f8
if [ ! -f "Makefile" ];then
echo "don't have Makefile need to configure"
sudo apt install libtool
autoreconf -i
./configure
fi
#append CFLAGS "-std=gnu11"
find ./ -type f -name Makefile -exec sed -i  's/^CFLAGS =.*/& -std=gnu11/' {} \;
find ./ -type f -name Makefile -exec sed -i  's/-fvisibility=hidden//' {} \;
make CC=kcc


