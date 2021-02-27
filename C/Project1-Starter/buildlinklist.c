
#include<stdio.h>
#include<stdlib.h>
#include<string.h>
#include"common.h"



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


