#include "print.h"
#include <stdio.h>

//definicja zmiennej zadeklarowanej jako extern w print.h
int tmp2 = 300;

void print(char* str, int i)
{
        printf("%s %d\n",str, i);
	printf("%d\n", tmp2);
}
