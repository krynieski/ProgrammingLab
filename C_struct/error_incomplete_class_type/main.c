/* Przyklad dla errorów:
   (Linux) "incompete type"
   (Linux) "pointer to incomplete type"
   (Win: VS) "incomplete type is not allowed" 
   (Win: VS) "incomplete class type is not allowed"
 
   OPIS PROBLEMU: problem wystepuje, gdy
   w pliku widoczna jest deklaracja, ale
   nie jest widoczna definicja.
   Definicja struktury nie jest widoczna,
   poniewaz zostala otoczona #ifdef INTERN.
 
   ROZWIAZANIE: INTERN musi byc zdefiniowany w pliku
   uzywajacym struktury jeszcze przed zaincludowaniem
   headera z deklaracja i definicja struktury.
   BEZ TEGO MOZNA ZDEFINIOWAC I UZYWAC STRUKTURY
   (NP PRZEKAZYWAC DO FUNKCJI ITP) ALE NIE MOZNA
   ODWOLYWAC SIE BEZPOSREDNIO DO JEJ ELEMENTOW.
 
   W celu zobaczenia bledu zakomentowac
   ponizsza linijke #define INTERN
*/ 


//#define INTERN

#include <stdio.h>
#include <stdlib.h>
#include "struktura.h"

int main()
{
	Struktura_t *str = (Struktura_t*)malloc(sizeof(Struktura_t));
	str->x = 5;
	str->y = 10;
	printf("x = %d, y = %d\n", str->x, str->y);

	return 0;
}