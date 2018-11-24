#include <stdio.h>
#include <stdlib.h>


struct Statu{
    int i;
};                                                   
void my_callback(u_char *user)
{
    struct Statu * sta;
    sta = (struct Statu *) user;
    printf("value%d\n",sta->i);
    sta->i = 10;
}
void callIt(void(callback)(u_char *) ,u_char *user){
	//callback(user);
	callback(user);
}
int main(int argc,char **argv)
{ 
    	struct Statu * sta = malloc(sizeof(struct Statu));
    	callIt(my_callback,(u_char *)sta);
	callIt(my_callback,(u_char *)sta);
	callIt(my_callback,(u_char *)sta);
    	return 0;
}
