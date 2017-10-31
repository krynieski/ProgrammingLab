/*
	TESTOWANIE ZMIAN WARTOSCI STRUKTURY
	ZA POMOCA FUNKCJI
	(PRZEKAZYWANIE STRUKTURY PRZEZ WSKAZNIK VOID)
*/
#include <stdio.h>

void change(void *);
void changeStruct(void*);

/* struktura Inner dla strukturay Outer */
struct Inner {
	int ret;
};

/* struktura Outer zawierajaca int, string i strukture Inner */
struct Outer {
	int a;
	char *str;
	struct Inner instruct;
};

/* main:
	- definiuje strukture Outer
	- printuje adres struktury (potrzebny pozniej przy sledzeniu wskaznikow)
	- printuje wartosci przed zmiana
	- wywoluje funkcje change()
	- printuje wartosci po zmianie
*/
int main()
{
	struct Outer struktura;
	struktura.a = 5;
	struktura.str = "test1";
	struktura.instruct.ret = -1;

	printf("[DBG: (IN main) struct addr = %p]\n", (void *)&struktura);
	printf("main: (before) struktura.a = %d struktura.str = %s ret = %d\n", struktura.a ,struktura.str, struktura.instruct.ret);
	change((void *)&struktura);
	printf("main: (after) struktura.a = %d struktura.str = %s ret = %d\n", struktura.a ,struktura.str, struktura.instruct.ret);

	return 0;
}

/* change:
	- printuje adres wskaznika i wskazywanej struktury
	- wywoluje funkcje changeStruct
*/
void change(void *arg)
{
	printf("[DBG: (IN change) arg addr = %p, obj addr = %p]\n", &arg, (void *)*&arg);
	changeStruct(arg);
}

/* changeStruct:
	- printuje adresy
	- printuje wartosci struktury przed zmiana
	- zmienia wartosci struktury
	- printuje wartosci po zmianie
*/
void changeStruct(void *strct)
{
	printf("[DBG: (IN changeStruct) arg addr = %p, obj addr = %p]\n", &strct, (void *)*&strct);
	printf("changeStruct: (before) struktura.a = %d struktura.str = %s structura.instruct.ret = %d\n", 
		   ((struct Outer*)strct)->a ,((struct Outer*)strct)->str, ((struct Outer*)strct)->instruct.ret);
	((struct Outer*)strct)->a = 10;
	((struct Outer*)strct)->str = "test2";
	((struct Outer*)strct)->instruct.ret = 0;
	printf("changeStruct: (after) struktura.a = %d struktura.str = %s structura.instruct.ret = %d\n", 
		   ((struct Outer*)strct)->a ,((struct Outer*)strct)->str, ((struct Outer*)strct)->instruct.ret);
}