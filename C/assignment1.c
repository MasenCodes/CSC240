#include<stdio.h>

int triple_it (int x);
int array_max (int a[], int len);
int letter_count (char a[], int len);
void fizz_buzz (int limit);

int main() {
    printf("Number tripled is: %d\n", triple_it(2));

    int num;
    int farray[10] = {10, 2, 2, 43, -1, 0, 65, 38, 2, 5};

    printf("Largest number in array: %d\n", array_max(farray, sizeof(farray)/sizeof(farray[0])));

    char *word = "hello 4 this has 17 chars";

    printf("length of string literal: %d\n", letter_count(word, 2));

    fizz_buzz(50);

}

int triple_it (int x) {
    return (x * 3);
}

int array_max (int a[], int len) {
    int largest_val = a[0];
    for (int i=0; i<len; i++) {
        if (a[i] > largest_val) {
            largest_val = a[i];
        }
    }
    return largest_val;
}

int letter_count (char a[], int len) {
    /* len arg was required but not needed*/
    int i = 0;
    int let_cnt = 0;
    while (a[i] != '\0') {
        /* if a capitol letter */
        if (a[i] >= 'A' && a[i] <= 'Z') {
            let_cnt++;
        }
        /* if a lowercase letter*/
        else if (a[i] >= 'a' && a[i] <= 'z') {
            let_cnt++;
        }
        i++;
    }
    return let_cnt;
}

void fizz_buzz (int limit) {
    if (limit < 25) {
        printf("Number needs to be 25 or greater\n");
        return;
    }
    for (int i=0; i<limit; i++) {
        if (i % 7 == 0 && i != 0) {
            continue;
        }
        else if (i % 3 == 0 && i % 5 == 0 && i != 0){
            printf("fifteen\n");
        }
        else if (i % 3 == 0 && i != 0) {
            printf("three\n");
        }
        else if (i % 5 == 0 && i != 0) {
            printf("five\n");
        }
        else {
            printf("%d\n", i);
        }
    }
}