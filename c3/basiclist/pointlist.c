#include <stdio.h>
#include <stdlib.h>
#include "basiclist.h"

/* point holding struct */
typedef struct pointlist {
    int x;
    int y;
}point_t;

void print_coord_list(node_t ** node) {
    node_t * head = node;
    point_t temp;

    while(head != NULL) {
        temp = *((point_t*)head->data);
        printf("[%d, %d]", temp.x, temp.y);
        head = head->next;
    }
    free(head);
}

int main(void) {
    /* point variables */
    point_t p1 = {3, 5};
    point_t p2 = {1, 8};
    point_t p3 = {7, 4};
    point_t p4 = {9, 2};

    /* creating and populating the LL */
    node_t * point_list;
    list_add(&point_list, &p1);
    list_add(&point_list, &p2);
    list_add(&point_list, &p3);
    list_add(&point_list, &p4);

    /* print the contents of the list */
    print_coord_list(point_list);

}