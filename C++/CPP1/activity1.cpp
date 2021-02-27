#include<iostream>

using namespace std;

class MyClass {
  private:  
    int num;
  public:
    MyClass(int x=0) {
      num = x;
    }
    int doubleNum();	// Returns num times 2
    void print();		// Prints num
};

int MyClass::doubleNum() {
    return num * 2;
}

void MyClass::print() {
    cout << num << endl;
}

int main() {
    MyClass example(5);
    cout << example.doubleNum() << endl;
    example.print();
    return 0;
}