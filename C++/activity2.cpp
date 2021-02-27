#include<iostream>

using namespace std;

static int static_alloc; // stored in static memory

int * heap_alloc = (int*)malloc(sizeof(int)); // dynamically allocated heap memory

int main() {
    static_alloc = 5; // static memory
    *heap_alloc = 10; // heap memor
    int stack_var = 15; // new variable pushed onto stack in the scope of main
}

