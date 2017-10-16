#include "print.h"
#include "count.h"

int main()
{
	//main korzysta z funkcji count (count.h) i print (print.h)
	int a = count();
        print("Hello krynieski", a);
        return 0;
}
