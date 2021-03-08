CC=g++ 
CPPFLAGS=--std=c++11

all: main.cpp numberlist.o
	$(CC) $(CPPFLAGS) main.cpp numberlist.o -o main.exe

numberlist.o: numberlist.cpp
	$(CC) $(CPPFLAGS) -c numberlist.cpp

clean:
	rm -f *.o *.exe *~
