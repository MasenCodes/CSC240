#ifndef TERM_HPP
#define TERM_HPP
#include<string>

using namespace std;

class Term {

private:

    int coefficient;
    string variable;
    int exponent;

public:

    Term(int, string, int);
    Term(const Term&);
    string toString();
    int getCoefficient();
    string getVariable();
    int getExponent();
    void addToCoefficient(int);
    void setNull();
};

#endif
