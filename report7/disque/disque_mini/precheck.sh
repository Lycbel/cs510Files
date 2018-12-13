#java kcc can't use this
#$1 is command $2 will be the package name if empty will use $1 as package name
function checkNativeCommandAv() {
 if [ -z "$($1 --version 2>&1 >/dev/null)" ]; then
 echo "$1 is already installed"
else
 if [ -z $2 ];then
  sudo apt install "$1"
 else
  sudo apt install "$2"
 fi
fi
}
#check make
checkNativeCommandAv make
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

