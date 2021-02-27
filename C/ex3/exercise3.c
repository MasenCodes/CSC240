#include<stdio.h>
#include<string.h>
#include"student.h"



int main() {  
    int SAMPLE_GRADE1[MAX_GRADES] =  {90, 100, 85, 91, 95, 86, 89, 97};
    int SAMPLE_GRADE2[MAX_GRADES] =  {90, 60, 85, 91, 85, 86, 89, 75};
    student stu1 = {2009, "Example Student 1", 666, {90, 100, 85, 91, 95, 86, 89, 97}, LETTER(average(SAMPLE_GRADE1))};
    student stu2 = {2021, "Example Student 2", 0, {90, 60, 85, 91, 85, 86, 89, 75}, LETTER(average(SAMPLE_GRADE2))};
    strncpy(stu2.id.seq, "666FF", sizeof(stu2.id.seq));

    print_record(stu1);
    print_record(stu2);
}