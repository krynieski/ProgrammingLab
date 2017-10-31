#include <stdio.h>

int main()
{
	int i = 5;

	if (i++ == 0)
	{
		printf("i == 0\n");
	}
	
	printf("i = %d\n", i);

	return 0;
}