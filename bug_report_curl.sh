#report for curl:
#use Ubuntu 16.04.5
#kcc: version 1.0 GNU-compatibleBuild number: #c9eaccf-1537409156414
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
A=$(java -version 2>&1 >/dev/null)
if [ -n "$A" ]; then
        echo "java is not installed"
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
sudo apt install libtool
autoreconf -i
./configure
make CC=kcc

