#include<iostream>
#include<string>

using namespace std;

class Movie {
    private:
        string title;
        string director;
        string rating;
        int year;

    public:
        Movie(string movie_title, string movie_director, int release_year, string movie_rating) {
            title = movie_title;
            director = movie_director;
            year = release_year;
            rating = movie_rating;
        }
        
        void print_movie() {
            cout << "Title: " << title << " directed by " << director << ", rated "
                << rating << " released in " << year << endl;
        }

        void set_year(int new_year) {
            year = new_year;
        }      
};

int main() {
    cout << "Making a movie..." << endl;
    Movie original("Star Wars", "Steven Spielburg", 1977, "PG");
    original.print_movie();
    cout << "Making a copy of this movie..." << endl;
    Movie copy = original;
    copy.print_movie();
    cout << "Changing the year of the original" << endl;
    original.set_year(2020);
    cout << "Original Movie: " << endl;
    original.print_movie();
    cout << "Copy Movie: " << endl;
    copy.print_movie();

}