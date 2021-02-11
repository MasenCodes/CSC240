all: exercise3.c student.o
	gcc --std=c11 -Wall -pedantic exercise3.c student.o -o exercise3.exe

student.o: student.c
	gcc --std=c11 -Wall -pedantic -c student.c 

clean:
	rm -rf *.o *.exe *.out