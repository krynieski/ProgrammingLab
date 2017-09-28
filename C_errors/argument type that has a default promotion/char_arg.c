#include <stdio.h>

void fun();

int main()
{
	char a = 'a';
	fun(a);
	return 0;
}

void fun(char c)
{
	printf("%c\n", c);
}