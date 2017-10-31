#include <stdio.h>

void changeString(char**);

int main()
{
	char *str = "test1";

	printf("main: str = %s\n", str);
	changeString(&str);
	printf("main: str = %s\n", str);

	return 0;
}

void changeString(char **str)
{
	printf("changeString: (before) str = %s\n", (char *)*str);
	*str = "test2";
	printf("changeString: (after) str = %s\n", (char *)*str);
}