#include<stdio.h>
#include"student.h"

int average(int * grades) {
    int size = 0;
    int sum = 0;
    for(int i = 0; i < MAX_GRADES; i++) {
        sum += grades[i];
        size++;
    }
    return (sum / size);
}

void print_record(student record) {
    if (record.id.number < 2010) {
        printf("Name: %s | Year: %d | ID: %d | Grade: %d\n", record.name, record.year, record.id.number, record.let_grade);
    }
    else {
        printf("Name: %s | Year: %d | ID: %s | Grade: %d\n", record.name, record.year, record.id.number, record.let_grade);
    }
}