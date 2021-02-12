/* This is your main file */
#include<stdio.h>
#include<stdlib.h>
#include<string.h>
#include"common.h"
#include"buildlinklist.h"
#include"printandcombine.h"

int main() {
    node_t * node_ptr = NULL;
    node_t * new_node_ptr=NULL;

    printf("NAME: SAMPLE OUTPUT\n");
    
    /* Build linklist */
    read_objects(&node_ptr);

    
    /* Print the link list */
    printf("Original: ");
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


