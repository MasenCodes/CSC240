#ifndef BUILDLINKLIST_H
#define BUILDLINKLIST_H

#include"common.h"


/* Read from a text file and put in to a term_t structure. Then create a linklist of node (each node has an element of term struct.)*/
void read_objects(node_t ** pointer_to_node_ptr);

/* Assign value to term_t object elements */
term_t * term_from_string(char * buff);

/* Add a node to the link list */
int add_node(node_t ** pointer_to_node_ptr, void * term);

#endif


