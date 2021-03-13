#include<string>
#include"term.hpp"
#include<iostream>

using namespace std;

Term::Term(int coef = 0, string var = "x", int exp = 0) {
    coefficient = coef;
    variable = var;
    exponent = exp;
}

Term::Term(const Term &original) {
    coefficient = original.coefficient;
    variable = original.variable;
    exponent = original.exponent;
}

string Term::toString() {
    if(exponent) {
        return to_string(coefficient) + variable + "^" + to_string(exponent);
    }
    else {
        return to_string(coefficient);
    }
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
    exponent = 0;
    variable = "";
}

