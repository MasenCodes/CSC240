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
    for (vector<Term>::iterator ii = terms.begin(); ii != terms.end(); ii++) {
        cout << ii->toString();
    }
    cout << endl;
}

Polynomial Polynomial::combineLikeTerms() {
    map<int, Term> combined;

    for (vector<Term>::iterator ii = terms.begin(); ii != terms.end(); ii++) {
        if(ii->getCoefficient() == 0) { // dont add if coef is 0
            continue;
        }
        else if(ii->getExponent() == 0) { // if exp is 0
            if(combined.find(0) == combined.end()) { // if 0 is not in key list
                ii->setNull();
                combined.insert(pair<int, Term>(0, *ii));
            }
            else { // add to existing if 0 exp is there already
                combined.at(0).addToCoefficient(ii->getCoefficient());
            }
        }
        else if(combined.find(ii->getExponent()) == combined.end()) { // if exponent degree is not currently in map
            combined.insert(pair<int, Term>(ii->getExponent(), *ii));
        }
        else { // if the exponent is already in map
            combined.at(ii->getCoefficient()).addToCoefficient(ii->getCoefficient());
        }
    }

    Polynomial ret;

    for(map<int, Term>::iterator itr = combined.begin(); itr != combined.end(); itr++) {
        ret.add(itr->second);
    }

    return ret;
}

