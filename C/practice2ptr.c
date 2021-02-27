#include<stdio.h>
#include<stdlib.h>
#include<string.h>

/* Rewrite using a pointer to char str[] */
void array_to_ptr () {
  int n=0, len; 
  char str[ ] = "Hello World!";
  len = strlen(str);
  for( n=0; n<len; n++) {
    putc(str[n], stdout);
  }
  printf("\nlength = %d\n", n);
}

void array_to_ptr2() {
  char str[ ] = "Hello World!";
  char *ii = str;
  while(*ii != '\0') {
    ii++;
  }
  printf("\nlength = %d\n", ii - str);
}

int contains(char * str, char c) {
  char *ii = str;
  while(*ii != '\0') {
    if(*ii == c) {
        return 1;
    }
    ii++;
  }
  return 0;
}

int * makearray(int n) {
    int * ptr = (int *)calloc(n, sizeof(int));
    if(ptr == NULL) {
        printf("Unable to allocate memory");
        exit(0);
    }
    for(int i=0; i<n; i++) {
        *(ptr + i) = i + 1;
    }
    return ptr;
}

int main (void) {
  printf("Question #2 - array_to_ptr:\n");
  array_to_ptr2();   
  printf("\n------------------------------------\n\n");

  printf("Question #3 - contains:\n");
  printf("Test #1: ");
  if ( contains("Hello", 'e') == 1) {
    printf("The string \"Hello\" contains the character 'e'\n");
  }
  else {
    printf("The string \"Hello\" does not contain the character 'e'\n");
  }
  printf("Test #2: ");
  if ( contains("Hello", 'x') == 1) {
    printf("The string \"Hello\" contains the character 'x'\n");
  }
  else {
    printf("The string \"Hello\" does not contain the character 'x'\n");
  }
  printf("\n------------------------------------\n\n");

  printf("Question #4: - makearray:\n");
  int * arr = makearray(10);
  for (int ii=0;ii<10;ii++) {
    printf("%d ", *(arr+ii));
  }
  printf("\n");
  printf("\n------------------------------------\n\n");
  return 0;
}