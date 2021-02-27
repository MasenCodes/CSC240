#ifndef MYSTUFF_H
#define MYSTUFF_H

/* Macros */
/* This does not require an official call, so the 
line of execution is not broken i.e. no return address 
or stack change or jump because the function was 
converted to machine code during compilation */
#define NUM 10
#define MAX(a,b) ( (a) > (b) ) ? (a) : (b)

/* Forward declaration */
int max_of_three(int a, int b, int c);

#endif
