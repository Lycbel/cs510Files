: '
this is a probem found in toybox https://github.com/landley/toybox
when use kcc to compile md5sum.c there will be syntax error
the probem is introduced by initialize array by {}
this is not a very big problem.
but if we set the flag of -frecover-all-errors maybe it is better to let it pass
the minimized one can be

int main(){
	int []a = {};
	return 0;
}

'


