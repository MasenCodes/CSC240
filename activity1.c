#include<stdio.h>

int main() {
  int i;
  int len = 0;
  /*grab the array size*/
  printf("Enter a number less than 10: ");
  scanf("%d", &len); 
  /*create array*/
  int numbers[len];
  /*fill array with input*/
  for (i=0;i<len;i++){
      printf("Enter another number: ");
      scanf("%d", &numbers[i]); 
  }
  /*print even elements*/
  for (i=0;i<len;i++){
      if (numbers[i] % 2 == 0){
        printf("%d\n", numbers[i]);
      }
  }

}