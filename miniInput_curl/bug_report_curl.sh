#report for curl:
#use Ubuntu 16.04.5
#kcc: version 1.0 GNU-compatibleBuild number: #c9eaccf-1537409156414
# tried using -k flag when making the curl project, and I minimized the first three for the report
echo "-------------------------------------------------------------------------------- error case 1"
kcc -c main.c -o hello1
echo "-------------------------------------------------------------------------------- error case 2"
kcc -c main2.c -o hello2
echo "-------------------------------------------------------------------------------- error case 3"
kcc -c main3.c -o hello3

echo "use gcc for comparision"
echo "-------------------------------------------------------------------------------- gcc case 1"
if gcc -c main.c -o hello1; then
echo "success"
fi
echo "-------------------------------------------------------------------------------- gcc case 2"
if gcc -c main2.c -o hello2; then
echo "success"
fi
echo "-------------------------------------------------------------------------------- gcc case 3"
if gcc -c main3.c -o hello3; then
echo "success"
fi
