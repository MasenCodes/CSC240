#include<stdio.h>
#include<stdlib.h>
#include<string.h>
#include"common.h"
#include"printandcombine.h"

char * term_to_string(term_t * term) {
    static char str_monomial[TERM_LEN];
    
    str_monomial[0] = term->coefficient + '0';
    str_monomial[1] = term->var;
    str_monomial[2] = EXP;
    str_monomial[3] = term->exponent + '0';

    return str_monomial;
}

void print_linklist(node_t * curr) {
    node_t * head = curr;
    while(head != NULL) {
        printf("%s", term_to_string(head->term));
        if(head->next_node != NULL) {
            printf(" + ");
        }
        head = head->next_node;
    }
    printf("\n");
}

node_t * combine_like_terms(const node_t * current_node_ptr) {
    node_t * head = current_node_ptr;
    node_t * new_list;
    while(head != NULL) {
        
        head = head->next_node;
    }
}
