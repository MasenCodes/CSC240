#include <stdio.h>
#include <stdlib.h>

int seq(int n);
void double_it(int * n);
int triple_it(int n);

int main()
{
   int n = 1;
   printf("ii    seq(ii)  double_it(ii)  triple_it(n)\n");
   for (int ii=0;ii<=10;ii++) {
       printf("%2d   ",ii);
       printf("%8d",seq(ii));
       double_it(&n);
       printf("%15d",n);
       printf("%14d",triple_it(ii));
       printf("\n");
   }

   return 0;
}

int seq(int n) {
    if (n < 2) {
        return 1;
    }
    else {
        return (n * n + n * seq(n-1) + seq(n-2));
    }
}

void double_it(int * n) {
    *n = *n + *n;
}

int triple_it(int n) {
    return n + n + n;
}