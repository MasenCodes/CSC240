all: activity3.c mymath.o
	gcc --std=c11 -Wall -pedantic activity3.c mymath.o -o activity3.exe

mystuff.o: mymath.c
	gcc --std=c11 -Wall -pedantic -c mymath.c 

clean:
	rm -rf *.o *.exe *.out