#ifndef EXC3
#define EXC3
/*
FIX FOR VALUES LESS THAN E
 */
#define LETTER(grade) (((grade) == (100)) ? (65) : ((65) + ((100) - ((grade) - (grade) % 10)) / (10)))
#define MAX_GRADES 10

typedef union {
    int number;
    char seq[255];
}id;

typedef struct {
   int year;
   char name[255];
   id stud_id;
   int grades[MAX_GRADES];
   char let_grade;
}student;

int average(int * x);
void print_record(student);


#endif