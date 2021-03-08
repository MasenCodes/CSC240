#include"numberlist.hpp"
#include<iostream>

int main() {
    int FIRST[8] = {2, 5, 3, 1, 2, 5, 6, 7};
    int SECOND[8] = {4, 1, 9, 3, 8, 5, 1, 4};

    NumberList a(8);
    NumberList b(8);

    for(int ii = 0; ii < 8; ii++) {
        b.add(FIRST[ii]);
        a.add(SECOND[ii]);
    }

    cout << "Lists: " << endl;
    a.print_list();
    b.print_list();

    cout << "Attempting to add to list a" << endl;
    a.add(6);

}