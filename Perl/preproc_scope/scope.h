#if defined(SCOPE1)
int fun1_scope1(
	int arg1,
	char arg2
);

#ifdef(SCOPE2)
void fun2_scope2();

/*
	fun3_scope2
*/
int fun3_scope2();
#endif

/*
   Fun4
*/
void fun4_scope1(
	char c1,
	char c2
)

#endif /* defined(SCOPE1) */

void fun5(
	int a,
	int b,
	int c
);

#ifdef SCOPE1

int fun6_scope1(
	int a
)

/*
   fun7
*/
void fun7_scope1();

#endif