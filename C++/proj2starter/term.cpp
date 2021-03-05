#include<string>
#include"term.hpp"
#include<iostream>

using namespace std;

Term::Term(int coef = 0, string var = "x", int exp = 0){
    coefficient = coef;
    variable = var;
    exponent = exp;
}

string Term::toString() {
    return to_string(coefficient) + variable + "^" + to_string(exponent);
}

int Term::getCoefficient() {
    return coefficient;
}

string Term::getVariable() {
    return variable;
}

int Term::getExponent() {
    return exponent;
}

void Term::addToCoefficient(int n) {
    coefficient += n;
}

void Term::setNull() {
    exponent = NULL;
    variable = "";
}

