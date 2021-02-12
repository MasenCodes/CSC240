#ifndef EXC3
#define EXC3
/*
FIX FOR VALUES LESS THAN E
 */
#define LETTER(grade) (((grade) < (70)) ? (70) : ((64) + ((100) - ((grade) - (grade) % 10)) / (10)))
#define MAX_GRADES 10
#define MAX_CHAR 255

typedef struct record {
   int year;
   char name[MAX_CHAR];
   union {
       int number;
       char seq[MAX_CHAR];
   }id;
   int grades[MAX_GRADES];
   int let_grade;
}student;

int average(int * x);
void print_record(student);


#endif