#include<iostream>
#include<vector>

using namespace std;

class Grades {
    private:
        vector<int> grades;
        int size = 0;

    public:
        void add(int grade) {
            grades.push_back(grade);
            size += 1;
        }

        void print() {
            int total = 0;
            cout << "Grades: " << endl;
            for (vector<int>::iterator ii = grades.begin(); ii != grades.end(); ii++) {
                cout << " " << (*ii) << endl;
                total += *ii;
            }
            double avg = (double)total / (double)size;
            cout << "Avg: " << avg << endl;
        }
};

int main() {
    int stupid[10] = {20, 50, 67, 70, 45, 65, 54, 66, 76, 45};
    int smart[10] = {90, 80, 97, 88, 89, 95, 96, 85, 82, 99};

    Grades dead_student;
    Grades good_student;

    for(int ii = 0; ii < 10; ii++) {
        dead_student.add(stupid[ii]);
        good_student.add(smart[ii]);
    }

    dead_student.print();
    good_student.print();
}