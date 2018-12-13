: '
this is the minimized input of one probem when using kcc to compile dzen : https://github.com/robm/dzen
kcc can compile dzen, however the executable file cant run properly
we found it is a problem when using string.h 
when get the splitted string by the function 
token1 = strtok_r("a=b;hello", ";", &saveptr1)
token1 is value is "a=b"
when use the function again on the returned value
token2 = strtok_r(token1,"=",&saveptr2)
error happens here
token2 is "a=b" but should be "a"
'
echo "compile by kcc-----------------------------------------------"
kcc main.c
./a.out

echo "compile by gcc-----------------------------------------------"
gcc main.c
./a.out
