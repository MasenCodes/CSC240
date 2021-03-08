#ifndef NUMLIST_HPP
#define NUMLIST_HPP
#include<iostream>
#include<vector>

using namespace std;

class NumberList {
    private:
        int max;
        vector<int> num_list;
        vector<int>::iterator itr;
    
    public:
        NumberList(int);
        void add(int);
        void print_list();
};

#endif