#include<iostream>
#include<vector>
#include"numberlist.hpp"

using namespace std;

NumberList::NumberList(int size=0) {
    max = size;
}

void NumberList::add(int value) {
    if(num_list.size() == max) {
        cout << "Allowed Elements Exceeded" << endl;
        return;
    }
    num_list.push_back(value);
}

void NumberList::print_list() {
    for(itr = num_list.begin(); itr < num_list.end(); itr++) {
        cout << *itr << " ";
    }
    cout << endl;
}

