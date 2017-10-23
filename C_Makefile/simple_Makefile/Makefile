#Na podstawie instrukcji ze strony http://www.cs.colby.edu/maxwell/courses/tutorials/maketutor/
#Struktura katalogów:
#    main.c
#    include
#    |- print.c
#    |- print.h

CC=gcc
CFLAGS=-Iinclude
IDIR=include
OBJ = main.o print.o
ODIR=obj

#Tworznie pliku obiektowego: print.o
# $@ - lewa strona dwukropka
# $< - pierwszy element z prawej strony dwukropka
%.o: $(IDIR)/%.c
	$(CC) -c -o $@ $< $(CFLAGS)

#Tworznie pliku obiektowego: main.o
# $@ - lewa strona dwukropka
# $^ - pierwszy element z prawej strony dwukropka
%.o: %.c $(IDIR)/%.c
	$(CC) -c -o $@ $< $(CFLAGS)

#Tworznie programu wynikowego main na podstawie plików obiektowych main.o i print.o
# $@ - lewa strona dwukropka
# $^ - prawa strona dwukropka
main: $(OBJ)
	$(CC) -o $@ $^ $(CFLAGS)

clean:
	rm *.o main
