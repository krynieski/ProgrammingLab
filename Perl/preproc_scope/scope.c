#if defined(SCOPE1)
int fun1_scope1(
	int arg1,
	char arg2
)
{
	printf("fun1_scope1\n");
	return 0;
}

#ifdef(SCOPE2)
void fun2_scope2()
{
	printf("fun2_scope2\n");
}

/*
	fun3_scope2
*/
int fun3_scope2()
{
	return 0;
}
#endif

/*
   Fun4
*/
void fun4_scope1(
	char c1,
	char c2
)
{
	c1 = 'a';
	c2 = 'b';
}

#endif /* defined(SCOPE1) */

void fun5(
	int a,
	int b,
	int c
)
{
	int d = a + b + c;
}

#ifdef SCOPE1

int fun6_scope1(
	int a
)
{
	return a;
}

/*
   fun7
*/
void fun7_scope1()
{
	return;
}

#endif /* SCOPE1 */