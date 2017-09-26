#include <stdio.h>

int main()
{
	const unsigned int mask = 0;
	
	/* set all mask bits to '1' */
	printf("sizeof(mask) = %d\n", sizeof(mask));
	printf("mask = %u, mask inverted (all bits set to '1') = %u\n", mask, ~(mask));

	return 0;
}