show(seinfeld, 1989, 8.9).
show(twin_peaks, 1990, 8.9).
show(the_xfiles, 1993, 8.7).
show(friends, 1994, 8.9).
show(the_shield, 2002, 8.7).
show(the_wire, 2002, 9.4).
show(firefly, 2002, 9.1).
show(friday_night_lights, 2006, 8.6).
show(the_walking_dead, 2010, 8.4).
show(game_of_thrones, 2011, 9.4).
show(silicon_valley, 2014, 8.5).
show(mr_robot, 2015, 8.6).
show(atlanta, 2016, 8.5).

% good_show/1
good_show(Name) :- show(Name, _, Rating), Rating >= 8.9.

% same_year/2
same_year(Show1, Show2) :- show(Show1, Year1, _),
			   show(Show2, Year2, _),
			   Year1 = Year2.

% quad/2
quad(Num1, Num2) :- Num2 is (4 * Num1).

% bloop/2
bloop(Num1, Num2) :- 
			((Num1 < 0), Num1 is (Num2 * 2));
			((Num1 > 0), Num2 is (Num1 * 2)).

% mult/3
mult(Num1, Num2, Product) :- Product is (Num1 * Num2).

% bigger/3
bigger(Num1, Num2, Biggest) :- 
				(Biggest > Num1),
				(Biggest > Num2).

% absol/2
absol(Number, Absolute) :- 
				((Number > 0), Number is Absolute);
				((Number < 0), Absolute is (Number * -1)).

