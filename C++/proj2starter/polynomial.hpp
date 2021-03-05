#include<string>
#include<vector>
#include"term.hpp"
#include<map>

using namespace std;

class Polynomial {
    private:
        vector<Term> terms;
    
    public:
        Polynomial();
        ~Polynomial();

        void add(Term term);
        void print();
        Polynomial combineLikeTerms();
};



