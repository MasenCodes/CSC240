#include<stdio.h>
#include"student.h"

int average(int * grades) {
    int size = sizeof grades / sizeof *grades;
    int sum = 0;
    for(int i = 0; i < size; i++) {
        sum += grades[i];
    }
    return (sum / size);
}

void print_record(student record) {
    printf("Name: %s | Year: %d | ID: %s | Grade: %c\n", record.name, record.year, record.stud_id.seq, record.let_grade);
}