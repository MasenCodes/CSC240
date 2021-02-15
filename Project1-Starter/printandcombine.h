#ifndef PRINTCOMBINE
#define PRINTCOMBINE

#include "common.h"

/* length of each monomial ie: len(4x^3) = 4 */
#define TERM_LEN  4
#define EXP '^'


char * term_to_string(term_t * term);
void print_linklist(node_t * curr);
node_t * combine_like_terms(const node_t * current_node_ptr);
node_t * sort_list(node_t ** head);

#endif