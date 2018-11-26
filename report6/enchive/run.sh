: '
Problem escription:

kcc can compile enchive : https://github.com/skeeto/enchive commit 3f1910cb0c7ed30ee09a293ca0a91e2b57486722
but when set the -fissue-report flag to generate the report it will have the error:

... <some UBs> ...
Fatal error: out of memory.

the whole output file is in this folder
output_with_report.txt: the console`s output when set the -fissue-report flag

Maybe the problem is the UBs are too many
Without generating report, it can finish running the test, and the other output file is "output_without_report.txt". You can see it contians lots of UBs which are kind of duplicated
one reason why it is duplicated:
there are many extremely samilar codes and "<<" operation is super common in it like:
  output[8] += output[18] << 4;
  output[8] += output[18] << 1;
  output[8] += output[18];
  output[7] += output[17] << 4;
  output[7] += output[17] << 1;
each line of code might be called multiple times ( like 40 more time of different call back stacks ) 
for the UB:"The left operand in a bitwise right-shift is negative" each line of code will have 40 more Ubs
and there are some similar conditions for it.

Such thing is not very "clever" and maybe it is the cause of out of memory.

platform info:
ubuntu 16.04 on VMware 5GB memory 
java: 
	java version "1.8.0_181"
	Java(TM) SE Runtime Environment (build 1.8.0_181-b13)
	Java HotSpot(TM) 64-Bit Server VM (build 25.181-b13, mixed mode)

kcc: 	kcc: version 1.0 GNU-compatible

	Build number: 07dcaa9-1541738973679
	Current profile: x86_64-linux-gcc-glibc
	Installed profiles: x86_64-linux-gcc-glibc-gnuc-reverse-eval-order
	                    x86_64-linux-gcc-glibc-gnuc
	                    x86_64-linux-gcc-glibc
	                    x86-gcc-limited-libc
	                    x86_64-linux-gcc-glibc-reverse-eval-order
	Default profile: x86_64-linux-gcc-glibc

make:
	GNU Make 4.1
	Built for x86_64-pc-linux-gnu
	Copyright (C) 1988-2014 Free Software Foundation, Inc.
'
#to run and generate the error with -fissue-report 
bash precheck.sh
json_out=`pwd`/errors.json
report_out=`pwd`/report
echo "---------------------------------------start make-------------------------------------------------"
make CC=kcc CFLAGS=" -fissue-report=$json_out"
echo "---------------------------------------make done-------------------------------------------------"
echo "---------------------------------------test keygen option-------------------------------------------------"
sudo rm -R $HOME/.config/enchive
./enchive keygen > tempOut.txt
echo "the generated output is in tempOut.txt"
echo "---------------------------------------make test done-------------------------------------------------"
touch $json_out && rv-html-report $json_out -o $report_out

