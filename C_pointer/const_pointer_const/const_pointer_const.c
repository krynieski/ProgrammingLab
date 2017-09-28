#include <stdio.h>

void function(int const *pInt);
int fun();
void func(char);

int main()
{
	int *i;
	*i = 10;
	function(i);
	printf("%d\n", fun(*i));

	char a = 'a';
	func(a);

	return 0;
}

void function(int const *pInt)
{
	printf("%d\n", *pInt);
}

int fun(int i)
{
	return i + 5;
}

void func(char c)
{
	printf("%c\n", c);
}