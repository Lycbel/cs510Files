#include <pcap.h>
#include <stdio.h>
#include <stdlib.h>

/*
 * this is a minimized input for crackle https://github.com/mikeryan/crackle.git
 * kcc can compile the project, but it will fail all the tests, when gcc works correctly
 * the problem will be introduced when passing the struct object's address to callback function
 * if change the value of the object in callback function, the value will be 'reset' to original value after exit this function.
 */
struct Status{
    int i;
};
void my_callback(u_char *useless,const struct pcap_pkthdr* pkthdr,const u_char* packet)
{
    struct Status * status;
    status = (struct Status *) useless;
    printf("sta->i=%d\n",status->i);
    //error will happend here
    // this is changing the value stored in original address. &(status->i) is same to &(statusInMain->i). but kcc won't change the value.
    status->i = 10;
}

int main(int argc,char **argv)
{
    //read the offline packets
    char errbuf[PCAP_ERRBUF_SIZE];
    pcap_t* descr;
    char* file = "./data.pcap";
    descr = pcap_open_offline(file,errbuf);
    if(descr == NULL) {
        printf("pcap_open_offline(): %s\n", errbuf);
        exit(1);
    }
    //handle each packet
    //sta is the struct passed into the callback function
    struct Status * statusInMain = malloc(sizeof(struct Status));
    pcap_dispatch(descr,0,my_callback,( u_char *)statusInMain);
    return 0;
}

