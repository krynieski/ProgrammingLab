#ifndef PRINT_H
#define PRINT_H

//niepoprawna definicja w pliku nagłówkowym
int tmp1 = 125;
//poprawna deklaracja w pliku nagłówkowym (definicja w print.c)
extern int tmp2;

void print(char*, int);

#endif /*PRINT_H*/
