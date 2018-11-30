function checkPackage(){
if dpkg -s $1 >/dev/null 2>&1 ;then
  echo "$1 already installed"
else
  sudo apt install $1;
fi
}
#this will checkout the luajit project from github
if ! [ -d "LuaJIT" ];then
git clone https://github.com/LuaJIT/LuaJIT.git
fi
cd LuaJIT
git checkout b025b01c5b9d23f6218c7d72b7aafa3f1ab1e08a
#do the modification:
#on src/makefile:
#use local lua
find ./ -type f -name Makefile -exec sed -i  's/^HOST_LUA=$/HOST_LUA=lua/' {} \;
#use gcc to compile HOST
find ./ -type f -name Makefile -exec sed -i  's/^HOST_CC=.*/HOST_CC=gcc/' {} \;
# on codes:
#replace all __GNUC__ to __HELLO__
find ./ -type f -name "*" -exec sed -i  's/__GNUC__/__HELLO__/' {} \;
#install lua5.1
#install lua-bitop
checkPackage lua5.1
checkPackage lua-bitop
echo "make CC=kcc CFLAGS="-std=gnu11 -D__HELLO__=5" > output.txt 2>&1"
make CC=kcc CFLAGS="-std=gnu11 -D__HELLO__=5" > output.txt 2>&1
echo "./src/luajit"
./src/luajit







