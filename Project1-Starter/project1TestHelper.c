/*This file has everyting in one place to test your code. Please do not submit this file. This will not count against your project submission. */

#include<stdio.h>
#include<stdlib.h>
#include<string.h>

#define BUFFERLEN 40

typedef struct{           /* struct to hold elements like: 3x4 */
    int coefficient;
    char var;
    int exponent;
} term_t;

typedef struct node {
  term_t * term;            /* pointer to term */
  struct node * next_node;  /* pointer to next node */
} node_t;

/* Assign value to term_t object elements */
term_t * term_from_string(char * buff) {
    term_t * ret = malloc(sizeof(term_t));
    ret->coefficient=atoi(strtok(buff, " "));
    ret->var=*strtok(NULL, " ");
    ret->exponent=atoi(strtok(NULL, " "));
    return ret;
}

/* Add a node to the link list */
int add_node(node_t ** pointer_to_node_ptr, void * term) {
  int ret = 0;
  node_t * newnode_ptr = (node_t *) malloc(sizeof(node_t));
  if (newnode_ptr == NULL) {
    ret = -1;
  }
  else {
    newnode_ptr->term = term;
    newnode_ptr->next_node = *pointer_to_node_ptr;
    *pointer_to_node_ptr = newnode_ptr;
  }
  return ret;
}

/* Read from a text file and put in to a term_t structure. Then create a linklist of node (each node has an element of term struct.)*/
void read_objects(node_t ** pointer_to_node_ptr) {

    FILE *fp;
    char buffer[BUFFERLEN];
    fp = fopen("terms.txt", "r");

    while (fgets(buffer, BUFFERLEN,fp)) {
        term_t * this_term;
        this_term =  term_from_string(buffer);
        add_node(pointer_to_node_ptr, this_term);
    }
    fclose(fp);
}

char * term_to_string(term_t * term) {
/* Your code implementation goes here */
}

void print_linklist(node_t * curr) {
/* Your code implementation goes here */
}

node_t * combine_like_terms(const node_t * current_node_ptr) {
/* Your code implementation goes here */
}


int main() {
    node_t * node_ptr = NULL;
    node_t * new_node_ptr=NULL;

    printf("NAME: SAMPLE OUTPUT\n");
    

    /* Read from a text file and put in to a term_t structure. Then create a linklist of node (each node has an element of term struct.)*/
    read_objects(&node_ptr);

   /* Test term_to_string function */
    term_t testterm1 = {1, 'x', 0};
    term_t testterm2 = {2, 'x', 1};
    term_t testterm3 = {3, 'x', 2};    
    printf("Testing term.c/h:\n");
    printf("testterm1: %s\n", term_to_string(&testterm1));
    printf("testterm2: %s\n", term_to_string(&testterm2));
    printf("testterm3: %s\n", term_to_string(&testterm3));
    printf("Done testing term.c/h:\n");
    /* Done with testing the term_to_string function */

    printf("Original: : ");
    /* Print the link list */
    print_linklist(node_ptr);
    
    /* Combine like terms in the link list and craeate a new link list */
    new_node_ptr=combine_like_terms(node_ptr);
    printf("\nCombined: : ");
    /* Print new combine linklist */
    print_linklist(new_node_ptr);

    printf("\nNAME: SAMPLE OUTPUT\n");
    free(node_ptr);
    free(new_node_ptr);

    return 0;
}


