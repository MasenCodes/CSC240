#include<stdio.h>
#include"student.h"

int main() {  
    student stu1;
    student stu2;

    printf("%c\n", LETTER(100));
    printf("%c\n", LETTER(98));
    printf("%c\n", LETTER(85));
    printf("%c\n", LETTER(74));

    int agrades[] = {90, 100, 85, 91, 95, 86, 89, 97};
    int bgrades[] = {90, 60, 85, 91, 85, 86, 89, 75};

    stu1.year = 2015;
    strcpy(stu1.name, "Example Student 1");
    stu1.stud_id.number = 666;
    memcpy(stu1.grades, agrades, sizeof(agrades));
    stu1.let_grade =  LETTER(average(stu1.grades));

    stu2.year = 2021;
    strcpy(stu2.name, "Example Student 2");
    strcpy(stu2.stud_id.seq, "666FF");
    memcpy(stu2.grades, bgrades, sizeof(bgrades));
    stu2.let_grade =  LETTER(average(stu1.grades));

    print_record(stu1);
    print_record(stu2);
}