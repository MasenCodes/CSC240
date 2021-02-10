all: multifile.c mystuff.o
	gcc --std=c11 -Wall -pedantic multifile.c mystuff.o 
	#.o means to only compile if there was a change to file 

mystuff.o: mystuff.c
	gcc --std=c11 -Wall -pedantic -c mystuff.c 
	# if there was a change, then execute the change here

clean:
	rm -rf *.o *.exe *.out
	# if there was a change, clear and replace the existing files

	###### RUN WITH COMMAND: make all #######