#include<stdio.h>

int func1(int n);
int func2(int n);
int func3(int n);
int trib(int n);
int add(int x, int y);
void printDownFrom(int n);
void printUpTo(int n);
int gcd(int x, int y);
char isPalindrome(char[] s);

int main() {
    printf("func func1 with input of 5: %d\n", func1(5));

    printf("func func2 with input of 5: %d\n", func2(5));

    printf("func func3 with input of 5: %d\n", func3(5));

    printf("func trib with input of 10: %d\n", trib(10));

    printf("func add with input of 5, 7: %d\n", add(5, 7));

    printf("func printDownFrom with input of 7: ");
    printDownFrom(7);

    printf("func printUpTo with input of 7: ");
    printUpTo(7);
    printf("\n");

    printf("func gcd with input 7, 80: %d", gcd(7, 80));


}

int func1(int n) {
    /* calculates the function f(n-1) + 3 */
    if (n == 1) {
        return 10;
    }
    else {
        return (func1(n-1) + 3);
    }
}

int func2(int n) {
    /* calculates the function (n^2)f(n-1) */
    if (n == 1) {
        return 1;
    }
    else {
        return (n * n * func2(n-1));
    }
}

int func3(int n) {
    /* sum of series with + evens and - odds */
    if (n < 1) {
        return 0;
    }
    else if (n % 2 == 0) {
        return (n + func3(n - 1));
    }
    else {
        return (func3(n - 1) - n);
    }
}

int trib(int n) {
    /* function to return tribbonacci value at given nth index */
    if (n == 0) {
        return 0;
    }
    else if (n < 3) {
        return 1;
    }
    else {
        return (trib(n-3) + trib(n-2) + trib(n-1));
    }
}

int add(int x, int y) {
    /* recursive function to add two numbers */
    if (x == 0) {
        return y;
    }
    else {
        return add(x - 1, y + 1);
    }
}

void printDownFrom(int n) {
    /* recursive function that prints from an index, n, to 1 */
    if (n == 0) {
        printf("\n");
        return;
    }
    else {
        printf("%d ", n);
        printDownFrom(n-1);
    }
}

void printUpTo(int n) {
    /* recursive function that prints from 1 to an index, n */
    if (n == 0) {
        return;
    }
    else {
        printUpTo(n - 1);
    }
    printf("%d ", n);
}

int gcd(int x, int y) {
    /* finds greatest common denom. recursively */
    if (y <= x) {
        if (y % x == 0) {
            return x;
        }
        else {
            return gcd(y, x % y);
        }
    }
    else {
        return gcd(y, x);
    }
}

char isPalindrome(char * s) {
    /* determines if str is palindrome recursively */
    int length = strlen(s);
    if (length <= 1) {
       return 1;
    }
    else if (length == 2) {
        return (s[0] == s[1]);
    }
    else if (s[0] == s[length-1]) {
        s[length-1] = '\0';
        return isPalindrome(s+1);
    }
    else {
        return 0;
    }
}
    
void collatz(int n) {
    /* determines if str is palindrome recursively */
    if (n <= 1) {
        printf("1 ");
    }
    else {
        printf("%d ", n);
        if ((n % 2) == 0) {
            collatz(n / 2);
        }
        else {
        collatz ((3 * n) + 1);
        }
    }
}