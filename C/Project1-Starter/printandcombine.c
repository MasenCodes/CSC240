#include<stdio.h>
#include<stdlib.h>
#include<string.h>
#include"common.h"
#include"printandcombine.h"
#include"buildlinklist.h"


char * term_to_string(term_t * term) { 
/* assumes var is a single variable, sizeof(term->var) == 2 */
    char *term_str;
    term_str = malloc(sizeof(term->coefficient) + 4 + sizeof(term->exponent)); /* allocate for term variables, term->var = 2, and 2 for '^' */
    sprintf(term_str, "%d%c^%d", term->coefficient, term->var, term->exponent);
    return term_str;
}

void print_linklist(node_t * curr) {
    node_t * head = curr;
    if(curr == NULL || curr->next_node == NULL) {
        printf("this is a null list");
        return;
    }
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
    const node_t * head = current_node_ptr; /* traversing node */
    node_t * new_list = NULL; /* local variable to point to new LL getting stored in the heap */
    int highest = 0;
    while(head != NULL) {
        if(head->term->exponent > highest) {
            highest = head->term->exponent;
        }
        head = head->next_node;
    }
    head = current_node_ptr;
    for(int i = 0; i <= highest; i++) {
        term_t * temp = (term_t *)malloc(sizeof(term_t));
        temp->coefficient = 0;
        temp->var = 'x';
        temp->exponent = i;
        while(head != NULL) {
            if(head->term->exponent == i) {
                temp->coefficient += head->term->coefficient;
            }
            head = head->next_node;
        }
        head = current_node_ptr;

        /* check for any 0 values */
        if(temp->coefficient == 0) {
            temp->exponent = '\0';
            temp->var = '\0';
            temp->coefficient = '\0';
            continue;
        }
        else if(temp->exponent == 0) {
            temp->exponent = '\0';
            temp->var = '\0';
        }
        add_node(&new_list, temp); /* local pointer now points to node allocated in the heap */
    }
    return new_list; 
}
