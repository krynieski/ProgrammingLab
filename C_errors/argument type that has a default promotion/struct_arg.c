#include <stdio.h>

typedef float float_type;

typedef struct{
	float_type i;
} float_struct;

typedef struct {
	float_struct arg;
} arg_struct;

int main()
{
	int i = 5;
	// implicit declaration! (no previous declaration)
	//compiler defines (assumes) a function that returns an int
	fun((arg_struct*)&i);
	return 0;
}

int fun(arg_struct *sArg)
{
	printf("%f\n", sArg->arg.i);
	return 0;
}