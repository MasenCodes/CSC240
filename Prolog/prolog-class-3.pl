/*
debug.
trace.
notrace.
nodebug.
a:           abort
b:           break
c:           continue
e:           exit
g:           goals
s:           C-backtrace
t:           trace
p:             Show PID
h (?):       help
*/
%
%Review
%------------
% flip_three/2 ->  [A, B, C, D] => [C, B, A, D]
flip_three([H1, H2, H3 | T], [H3, H2, H1 | T]).
%?- flip_three([3,4,56,2,37,8], X).
%
do_strange_thing([A, B, C, D | T], [A, A, D, D, C, B, A, B, C, D | T]).
%?- do_strange_thing([3,4,56,2,37,8],X).

%length of a list
list_length([],0).
list_length([_|TAIL],N) :- list_length(TAIL,N1), N is N1+1.
%?- list_length([a,b,c,d,e,f],L).
%?- length([a,b,c,d,e,f],L).

%list concanate lists
concatenation([],X,X).
concatenation([H|T],X,[H|T1]) :- concatenation(T,X,T1).
%?- concatenation([1,2,4,5],[7,8,9],X).
%X = [1, 2, 4, 5, 7, 8, 9].


%union of two lists
list_member(H,[H|_]).
list_member(H,[_|TAIL]) :- list_member(H,TAIL).
union([],X,X).
union([H|T],X,T1) :- list_member(H,X), union(T,X,T1).
union([H|T],X,[H|T1]) :- \+ list_member(H,X), union(T,X,T1).
%union([1,2,3,4,5],[1,a,b,4],X).

%intersection of two lists
intersection([],_X,[]).
intersection([H|T],X,[H|T1]) :- list_member(H,X), intersection(T,X,T1).
%intersection([H|T],X,T1) :- intersection(T,X,T1).
intersection([H|T],X,T1) :- \+ list_member(H,X), intersection(T,X,T1).
% ?- intersection([1,2,3,4,5],[1,a,b,4,c],X).

/*
Write a Prolog rule called swap_negative/2 that replaces all negative numbers in a list with the atom negative.
3 ?- swap_negative([1,-2,3,-4,5],X).
X = [1, negative, 3, negative, 5].
5 ?- swap_negative([1,2,3,4], X).
X = [1, 2, 3, 4].
*/

swap_negative([], []).   %base condtion: if lists are empty, then ture.
swap_negative([H | T], [negative | T1]) :- H < 0, swap_negative(T, T1). % if head is negative, put 'negative' in the new list.
%swap_negative([H | T], [H | T1]) :- H >= 0, swap_negative(T, T1).
swap_negative([H | T], [H | T1]) :- swap_negative(T, T1).
%?-  swap_negative([1,-2,3,-4,5],X).

/*
Write a Prolog rule called bigger_than/3 that that returns a list of all items bigger than the 2nd parameter from the list.
1 ?- bigger_than([1,2,3,4,5], 2, X).
X = [3, 4, 5].
2 ?- bigger_than([1,2,3,4,5], 9, X).
X = [].
*/

bigger_than([], _, []).
bigger_than([H | T], X, [H | T1]) :- H > X, bigger_than(T, X, T1).
%bigger_than([H | T], X, T1) :-  H  =< X, bigger_than(T, X, T1).
bigger_than([_H | T], X, T1) :- bigger_than(T, X, T1).

/*
[trace]  ?-  bigger_than([1,2,3,4,5], 2, X).
X = [3, 4, 5].
*/

% Cut example
%----------------

warm_blooded(shark).
warm_blooded(cat).
warm_blooded(dog).
four_legs(dog).
four_legs(cat).
four_legs(bears).

mammal000([]).

% mammal000([]) :- !.

mammal00(M) :- !, warm_blooded(M).
mammal01(M) :- warm_blooded(M),!.

mammal0(M) :- warm_blooded(M); four_legs(M).
mammal0(dolphins).

mammal1(M) :- !, warm_blooded(M); four_legs(M).
mammal1(dolphins).

mammal2(M) :- warm_blooded(M); !, four_legs(M).
mammal2(dolphins).

mammal3(M) :- warm_blooded(M); four_legs(M), !.
mammal3(dolphins).


mammal5(M) :- !, warm_blooded(M), four_legs(M).
mammal5(dolphins).

mammal6(M) :- warm_blooded(M), !, four_legs(M).
mammal6(dolphins).

mammal7(M) :- warm_blooded(M), four_legs(M), !.
mammal7(dolphins).

/*
?- trace.

[trace]  ?- mammal0(dolphins).
   Call: (8) mammal0(dolphins) ? creep
   Call: (9) warm_blooded(dolphins) ? creep
   Fail: (9) warm_blooded(dolphins) ? creep
   Redo: (8) mammal0(dolphins) ? creep
   Call: (9) four_legs(dolphins) ? creep
   Fail: (9) four_legs(dolphins) ? creep
   Redo: (8) mammal0(dolphins) ? creep
   Exit: (8) mammal0(dolphins) ? creep
true.

[trace]  ?- mammal1(dolphins).
   Call: (8) mammal1(dolphins) ? creep
   Call: (9) warm_blooded(dolphins) ? creep
   Fail: (9) warm_blooded(dolphins) ? creep
   Fail: (8) mammal1(dolphins) ? creep
false.

[trace]  ?- mammal2(dolphins).
   Call: (8) mammal2(dolphins) ? creep
   Call: (9) warm_blooded(dolphins) ? creep
   Fail: (9) warm_blooded(dolphins) ? creep
   Redo: (8) mammal2(dolphins) ? creep
   Call: (9) four_legs(dolphins) ? creep
   Fail: (9) four_legs(dolphins) ? creep
   Fail: (8) mammal2(dolphins) ? creep
false.

[trace]  ?- mammal3(dolphins).
   Call: (8) mammal3(dolphins) ? creep
   Call: (9) warm_blooded(dolphins) ? creep
   Fail: (9) warm_blooded(dolphins) ? creep
   Redo: (8) mammal3(dolphins) ? creep
   Call: (9) four_legs(dolphins) ? creep
   Fail: (9) four_legs(dolphins) ? creep
   Redo: (8) mammal3(dolphins) ? creep
   Exit: (8) mammal3(dolphins) ? creep
true.

*/

/*
Write a Prolog rule double/2 where the 2nd argument is the 1st argument doubled. Your rule should work for integers and lists. For example:
double(3,6).
double([1,2,3],[2,4,6]).
*/
double([],[]) :- !.
double([H | T], [H2 | T2]) :- !, double(H, H2), double(T,T2).
double(X, Y) :- number(X), !, Y is X * 2.
double(X, [X,X]).

/*
Write a Prolog rule get_odds/2 where the first parameter is a list and the 2nd parameter is a list of the odd numbers in the list.
is_odd(H) :- 1 is mod(H,2).
*/
get_odds([],[]).
get_odds([H | T], [H | T1]) :- is_odd(H), !, get_odds(T,T1).
get_odds([_H | T], T1) :- get_odds(T,T1).


/*
%Write a prolog rule square_positives/2 that removes all negatives from a list then squares each of the remaining members. For example:
:- square_positives([1,2,3,4,5], [1,4,9,16,25]).
:- square_positives([1,-2,3,-4,5], [1,9,25]).
:- square_positives([-1,-2,-3,-4,-5], []).
*/
square_list([], []) :- !.
square_list([H | T], [H2 | T2]) :- !, H2 is H * H, square_list(T, T2).
remove_negatives([], []) :- !.
remove_negatives([H | T], T2) :- H < 0, !, remove_negatives(T, T2).
remove_negatives([H | T], [H | T2]) :- !, remove_negatives(T, T2).
square_positives(Lst, Lst1) :- remove_negatives(Lst, ListPos), square_list(ListPos, Lst1).



% Member of list
%-----------------
/*
?- member(1, [1,2,3]).  %ture
?- member(2, [1,2,3]).  %ture
?- member(3, [1,2,3]).  %ture
?- member(2, [1|[2|3]]).  %ture
?- member(3, [1|[2|3]]).  %false
?- member(2, [1|[2|[3|[]]]]).  %true
?- member(3, [1|[2|[3|[]]]]).  %true
?- member([], [1|[2|[3|[]]]]). %false
?- member([3|[]], [1|[2|[3|[]]]]). %false
?- member([1|2], [[1|2],2]).	   %true
?- member([b,c], [a,[b,c]]).       %true
?- member([3,Y], [[1,a],[2,m],[3,z],[3,p]]).
Y = z ;
Y = p
*/

change(HalfDollars, Quarters, Dimes, Nickels, Pennies) :-
	member(Nickels, [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20]),
	member(Dimes, [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10]),
	member(Quarters, [0, 1, 2, 3, 4]),
	member(HalfDollars, [0, 1, 2]),
	SubTotal is ( (HalfDollars * 50) + (Quarters * 25) + (Dimes * 10) + (Nickels * 5) ),
	SubTotal =< 100,
	Pennies is 100 - SubTotal.

%?- change(3,1,Z,A,B).


%Append two lists:
%-----------------

%?- append([a, b, c, d], [x, y, z], Newlist).
%Newlist = [a, b, c, d, x, y, z]

%Append two lists:
%append([], X, X) :- !.        % base case
%append([X | Y], Z, [X | W]) :-	append(Y, Z, W).
%?- append(H, [d, f, g], [x, a, b, c, d, f, g])
%H = [x, a, b, c]

myreverse([], []) :- !.
%myreverse([H | T], [T1 | H]) :- myreverse(T, T1).   % attempt 1
%% ?- myreverse([3,4,56,2,37,8],X).

%myreverse([H | T], [T1 | [H]]) :- myreverse(T, T1). % attempt 2
% ?- myreverse([3,4,56,2,37,8],X).
%
%myreverse([H | T], Result) :- myreverse(T, T1), append(T1, H, Result). % attempt 3
%
myreverse([H | T], Result) :- myreverse(T, T1), append(T1, [H], Result).




% Usage of findall, setof
%-------------------------

% findall(Variable, query(Variable), ListOfValuesofVariableThatSucceed).
all_the_mammals(Mammals) :- findall(Mammal, mammal0(Mammal), Mammals).
find_all_change(Ways) :- findall([H, Q, D, N, P], change(H, Q, D, N, P), Ways).
find_big_coins(Ways) :- setof([H, Q, D], change(H, Q, D, _, _), Ways).


% Usage of flatten
%-------------------------
% You can 'flatten' a list by removing all the square brackets around any lists it contains as elements, 
% and around any lists that its elements contain as elements, and so on for all nested lists.



% usages of asset
%------------------

mammal4(_) :- !, fail.  % Nothing is a mammal4

% Can I use assert as fact as below? (try uncomment it and compile)
%assert(mammal4(horse)).
/*
?- mammal4(X).
 false.

 ?- asserta(mammal4(horse)).
 true.

 ?- mammal4(X).
 X = horse ;
 false.
 ?- assertz(mammal4(fox)).
 true.

 ?- mammal4(X).
 X = mouse ;
 false.

 You can also assert rules:
 ?- assert((big(X) :- X > 10)).
 true.

 ?- big(14).
 true.

 ?- big(4).
 false.
*/

% asserta inside a rule
% Guessing game
newgame(X) :- retractall(guess(_)), asserta((guess(X))).
/*
?- newgame(4).
 true.

 ?- guess(2).
 false.

 ?- guess(6).
 false.

 ?- guess(4).
 true.
*/























