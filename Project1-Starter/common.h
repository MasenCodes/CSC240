#ifndef COMMON_H
#define COMMON_H

#define BUFFERLEN 40

typedef struct{           /* struct to hold elements like: 3x4 */
    int coefficient;
    char var;
    int exponent;
} term_t;

/* node = type, think like int, char, its the type associated 
with struct, node_t is the name that you can 'call' by, also 
user def does not allocate memory.*/
typedef struct node {
  term_t * term;            /* pointer to term */
  struct node * next_node;  /* pointer to next node */
} node_t;

#endif

