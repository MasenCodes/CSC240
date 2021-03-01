#include<iostream>

using namespace std;

class DynamicArray {
  private:
    int array_size;
    int * array_pointer;
    static int class_count;

  public:
    DynamicArray(int size) {
        array_size = size;
        array_pointer = new int[array_size]; // allocate the memory in heap
    }

    ~DynamicArray() {
        cout << "Deleted array with size: " << array_size << endl;
        delete array_pointer; // kill the pointer
        array_pointer = nullptr;
    }

    void print_array() {
        cout << "Array of size " << array_size << ": [";
        for(int i = 0; i < array_size; i++) {
            if(i == 0) {
                cout << *array_pointer;
                array_pointer ++;
            }
            else {
                cout << ", " << *array_pointer;
                array_pointer ++;
            }
        }
        array_pointer -= array_size;
        cout << "]" << endl;
    }

    void fill_array(int num) {
        for(int i = 0; i < array_size; i++) {
            *array_pointer = num;
            array_pointer ++;
        }
        array_pointer -= array_size;
    }
};

int main() {
    // variables for arrays
    int first_fill = 5;
    int second_fill = 10;
    int size = 8;

    // create the arrays
    DynamicArray a(size);
    DynamicArray b(size);

    // fill arrays
    a.fill_array(first_fill);
    b.fill_array(second_fill);

    // print the contents
    a.print_array();
    b.print_array();

    // desctructor(s) is called here
    return 0;
}