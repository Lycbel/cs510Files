#include <stdlib.h>
#include <stdio.h>
typedef struct {
    int scale;
    char *base;
    char *arr[];
} units;
units time_units_us = {
    .scale = 1000,
    .base  = "us",
    .arr = { "ms", "s", NULL }
};

int main()
{
     printf("can work with gcc%d",time_units_us.scale);
     return 0;
}
