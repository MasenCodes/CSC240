#ifndef PRINTCOMBINE
#define PRINTCOMBINE

#include "common.h"

char * term_to_string(term_t * term);
void print_linklist(node_t * curr);
node_t * combine_like_terms(const node_t * current_node_ptr);
node_t * sort_list(node_t ** head);
void merge_sort(node_t ** head);
node_t * merge(node_t * a, node_t * b);
void split(node_t * head, node_t * front, node_t * back);

#endif