#include<string>
#include<vector>
#include"term.hpp"
#include"polynomial.hpp"
#include<map>
#include<iostream>

void Polynomial::add(Term term) {
    terms.push_back(term);
}

void Polynomial::print() {
    bool went = false;
    for (vector<Term>::iterator ii = terms.begin(); ii != terms.end(); ii++) {
        if(went == false) {
            cout << ii->toString();
            went = true;
        }
        else {
            cout << " + " << ii->toString();
        }
    }
    cout << endl;
}

Polynomial Polynomial::combineLikeTerms() {
    map<int, int> combined;

    for (vector<Term>::iterator ii = terms.begin(); ii != terms.end(); ii++) {
        if(ii->getCoefficient() == 0) { // dont add if coef is 0
            continue;
        }
        else if(ii->getExponent() == 0) { // if exp is 0
            if(combined.find(0) == combined.end()) { // if 0 is not in key list
                ii->setNull();
                combined.insert(pair<int, int>(0, ii->getCoefficient()));
            }
            else { // add to existing if 0 exp is there already
                combined[0] += ii->getCoefficient();
            }
        }
        else if(combined.find(ii->getExponent()) == combined.end()) { // if exponent degree is not currently in map
            combined.insert(pair<int, int>(ii->getExponent(), ii->getCoefficient()));
        }
        else { // if the exponent is already in map
            combined[ii->getExponent()] += ii->getCoefficient();
        }
    }

    Polynomial ret;

    for(map<int, int>::iterator itr = combined.begin(); itr != combined.end(); itr++) {
        Term temp(itr->second, "x", itr->first);
        ret.add(temp);
    }

    return ret;
}

