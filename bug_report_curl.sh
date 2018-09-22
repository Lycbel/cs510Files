#report for curl:
#use Ubuntu 16.04.5
#kcc: version 1.0 GNU-compatibleBuild number: #c9eaccf-1537409156414
#git sha dee1700ce6ed2588f6db61fc9ca52ac8bccc71f8
#if automake not installed
if [ -n "$(automake --version 2>&1)" ]; then
 echo "automake is already installed"
else
 sudo apt install automake
fi
#check for java
A=$(java -version 2>&1)
if [ -z "$A" ]; then
	echo "java is not installed"
	sudo add-apt-repository ppa:webupd8team/java
	sudo apt-get update
	sudo apt-get install oracle-java8-installer
fi
if [ -d "curl" ]; then
	echo "curl already exists, do not need to clone"
else
	git clone https://github.com/curl/curl.git
fi
cd curl
if [ "$(git log -1 --pretty=format:%H)" != "dee1700ce6ed2588f6db61fc9ca52ac8bccc71f8" ]; then
   echo "warning curl version is not correct"
fi
sudo apt install libtool
autoreconf -i
./configure
make CC=kcc
