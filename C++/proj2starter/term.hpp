#ifdef TERM_HPP
#define TERM_HPP
#include<string>

using namespace std;

class Term {

private:

    int coefficient;
    String variable;
    int exponent;

public:

    Term(int coef = 0, string var = "x", int exp = 0);
    ~Term();
    string toString();
    int getCoefficient();
    String getVariable();
    int getExponent();

};

#endif
