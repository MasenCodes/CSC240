CC=gcc 
CFLAGS=-Wall -pedantic  -ansi

all: project1.c buildlinklist.o printandcombine.o
	$(CC) $(CFLAGS) project1.c buildlinklist.o printandcombine.o -o project1.exe

buildlinklist.o: buildlinklist.c
	$(CC) $(CFLAGS) -c buildlinklist.c

printandcombine.o: printandcombine.c
	$(CC) $(CFLAGS) -c printandcombine.c
clean:
	rm -f *.o *~ project1.exe
