all: pointlist.c basiclist.o
	gcc --std=c11 -Wall -pedantic pointlist.c basiclist.o

basiclist.o: basiclist.c
	gcc --std=c11 -Wall -pedantic -c basiclist.c

clean:
	rm -rf *.o *.exe *.out
