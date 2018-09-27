#include <time.h>
// add this line to solve the main2.c's problem
// #define CLOCK_MONOTONIC 1
int main(){
 struct timespec tsnow;
  if(0 == clock_gettime(CLOCK_MONOTONIC, &tsnow)) {
  }
 return 1;
}
