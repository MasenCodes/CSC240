knows_scheme(bob).
knows_scheme(alice).
knows_prolog(alice).

passes_240(Student) :- knows_scheme(Student), knows_prolog(Student).

% math
double(X, Y) :- Y is 2 * X.
less_than_square_root(X, Y) :- Y < sqrt(X).
tangent(X, Y) :- Y is tan(X).
divides(X, Y) :- 0 is X mod Y.

% nutrition/5
% nutrition(Food, Calories, Fat, Carbs, Protein)
nutrition(egg, 85, 6, 1, 6).
nutrition(bacon, 38, 3, 0, 3).
nutrition(cereal, 130, 1, 28, 2).
nutrition(oatmeal, 150, 2, 25, 6).
nutrition(toast, 75, 0.96, 13, 2).
nutrition(fruit, 65, 0, 15, 1).
nutrition(milk, 1033, 2, 12, 8).
nutrition(juice, 80, 0, 18, 1).

% execute on consulting
:- nutrition(egg, Calories, Fat, _Carbs, Protein),
	write('Egg: Calories '), write(Calories),
	write(' Fat '), write(Fat),
	write(' Protein '), write(Protein), nl.

lower_fat(X,Y) :-
	nutrition(X, _, FatX, _, _),
	nutrition(Y, _, FatY, _, _),
	FatX < FatY.

%?- nutrition(fruit,_,_,_,X).
protein_content(Food, Protein) :- nutrition(Food, _, _, _, Protein).

more_protein(X, Y) :-
	protein_content(X, ProteinX),
	protein_content(Y, ProteinY),
	ProteinX > ProteinY.


% recursion
% base case: 1! = 1
factorial(1, 1).          
%         N!=F  if   N1 = N-1 and      N1! = F1 and  F = N * F1
factorial(N, F) :- N1 is N - 1, factorial(N1, F1), F is N * F1.

%?- debug.
%true.
%[debug]  ?- trace.
%true.
%[trace]  ?- factorial(2,X).
%   Call: (8) factorial(2, _2176) ? creep
%   Call: (9) _2416 is 2+ -1 ? creep
%   Exit: (9) 1 is 2+ -1 ? creep
%   Call: (9) factorial(1, _2418) ? creep
%   Exit: (9) factorial(1, 1) ? creep
%   Call: (9) _2176 is 2*1 ? creep
%   Exit: (9) 2 is 2*1 ? creep
%   Exit: (8) factorial(2, 2) ? creep
%X = 2.
%[trace]  ?- notrace.
%true.
%[debug]  ?- nodebug.
%true.

% graphs
% list of edges in a directed grap
edge(a,b).
edge(a,c).
edge(b,d).
edge(c,d).
edge(c,f).
edge(d,e).
edge(f,g).
edge(g, h).
edge(i,j).

connected(Node1, Node2) :- edge(Node1, Node2).
connected(Node1, Node2) :- edge(Node1, NodeX), connected(NodeX, Node2).

%?- debug.
%true.
%[debug]  ?- trace.
%true.
%[trace]  ?- connected(f,h).
%   Call: (8) connected(f, h) ? creep
%   Call: (9) edge(f, h) ? creep
%   Fail: (9) edge(f, h) ? creep
%   Redo: (8) connected(f, h) ? creep
%   Call: (9) edge(f, _2376) ? creep
%   Exit: (9) edge(f, g) ? creep
%   Call: (9) connected(g, h) ? creep
%   Call: (10) edge(g, h) ? creep
%   Exit: (10) edge(g, h) ? creep
%   Exit: (9) connected(g, h) ? creep
%   Exit: (8) connected(f, h) ? creep
%true .
%[trace]  ?- notrace.
%true.
%[debug]  ?- nodebug.
%true.

% family
father(bob, alice).
mother(sue, james).
mother(sue, alice).
mother(ann, sue).

dad(X,Y) :- father(X,Y).
parent(X,Y) :- father(X,Y).
parent(X,Y) :- mother(X,Y).
child(X,Y) :- parent(Y,X).

ancestor(A,D) :- parent(A,D).
ancestor(A,D) :- parent(A,C), ancestor(C, D).

% lists & pairs
% PAIR: [ Head | Tail ]
% LIST: []  or [ Head | TailIsAList ]

pairparts([H|T], H, T).

% first/2 - find the first thing in a list or pair
first([H|_T], H).

% is_pair/1 - pair predicate
is_pair([_|_]).
%?- is_pair([4|5]).

% is_list/1 - list predicate
%is_list([]).
%is_list([_H|T]) :- is_list(T).

% at_least_two_in_list/1 - at least two elements in the list
at_least_two_in_list([_, _ | _]).
%?- at_least_two_in_list([3,5]).
%?- at_least_two_in_list([5]).

% how does at_least_two_in_list/1 work?
%at_least_two_in_list([A, B | C], A, B, C).

% third_element/2 - find the 3rd element in a list
third_element([_,_,X|_],X).
%?- third_element([3,4,56,7,8,9],X)

% first_two - get the first two elements of a list
% first_two/3
first_two([H1, H2 | _T], H1, H2).
% first_two/2
first_two([H1, H2 | _T], [H1, H2]).
%?- first_two([4,5,6,7],[X,Y]).

% double_list/2 double each element in a list
double_list([],[]).
double_list([H | T], [H2 | T1]) :- H2 is H * 2, double_list(T, T1).
%?- double_list([],[]).
%?- double_list([3,5,6,10],R).

% add_one_to_all/2 - increment each member of the list
add_one_to_all([],[]).
add_one_to_all([H|T], [H1|T1]) :- H1 is H + 1, add_one_to_all(T, T1).

%?- add_one_to_all([],[]).
%true.
%?- add_one_to_all([],_X).
%_X = [].
%?- add_one_to_all([2,3,4,5],_X).
%_X = [3, 4, 5, 6]
%?- debug.
%true.
%[debug]  ?- trace.
%true.
%[trace]  ?- add_one_to_all([2,3,4,5],_X).
%   Call: (8) add_one_to_all([2, 3, 4, 5], _1080) ? creep
%   Call: (9) _1310 is 2+1 ? creep
%   Exit: (9) 3 is 2+1 ? creep
%   Call: (9) add_one_to_all([3, 4, 5], _1312) ? creep
%   Call: (10) _1322 is 3+1 ? creep
%   Exit: (10) 4 is 3+1 ? creep
%   Call: (10) add_one_to_all([4, 5], _1324) ? creep
%   Call: (11) _1334 is 4+1 ? creep
%   Exit: (11) 5 is 4+1 ? creep
%   Call: (11) add_one_to_all([5], _1336) ? creep
%   Call: (12) _1346 is 5+1 ? creep
%   Exit: (12) 6 is 5+1 ? creep
%   Call: (12) add_one_to_all([], _1348) ? creep
%   Exit: (12) add_one_to_all([], []) ? creep
%   Exit: (11) add_one_to_all([5], [6]) ? creep
%   Exit: (10) add_one_to_all([4, 5], [5, 6]) ? creep
%   Exit: (9) add_one_to_all([3, 4, 5], [4, 5, 6]) ? creep
%   Exit: (8) add_one_to_all([2, 3, 4, 5], [3, 4, 5, 6]) ? creep
%_X = [3, 4, 5, 6].
%[trace]  ?- notrace.
%true.
%[debug]  ?- nodebug.
%true.

% only_mults_of_3/2 - keep only multiples of 3
only_mults_of_3([],[]).
only_mults_of_3([H | T], [H | T1]) :- 0 is H mod 3, only_mults_of_3(T, T1).
only_mults_of_3([H | T], T1) :- X is H mod 3, X > 0, only_mults_of_3(T, T1).
%?- only_mults_of_3([4,5,6],X).

% remove_eo/2 - remove every other element
remove_eo([], []).     %true
remove_eo([H, _|T], [H|T1]) :- remove_eo(T, T1).
%?- remove_eo([3,4,5,6,7,8],X).

% is_sorted/1 - predicate to determine if a list is sorted
is_sorted([]).
is_sorted([_]).
is_sorted([H1,H2|T]) :- H1 =< H2, is_sorted([H2|T]).
%?- is_sorted([3,4,5,67,2,3]).
%?- is_sorted([3,4,5]).

all_even([]).
all_even([H | T]) :- 0 is H mod 2, all_even(T).

% swap_negative/2
swap_negative([], []) :- !.
swap_negative([H|T], [negative|T1]) :- 0 > H, swap_negative(T, T1).
swap_negative([H|T], [H1|T1]) :- 0 < H, H1 is H, swap_negative(T, T1).  

% bigger_than/3
bigger_than([], _, []) :- !.
bigger_than([H|T], X, [H1|T1]) :- H > X, H1 is H, bigger_than(T, X, T1).
bigger_than([_|T], X, T1) :- bigger_than(T, X, T1).


%                       FACTS FOR RULE TESTING

% parent/2 (parent, child)
parent(bob, alice).
parent(bob, steve).
parent(martha, alice).
parent(martha, steve).
parent(fred, bob).
parent(fred, dylan).
parent(mike, martha).
parent(mike, karen).

% sister/2 (sister, sibling)
sister(alice, steve).
sister(martha, karen).
sister(karen, martha).

% brother/2 (brother, sibling)
brother(steve, alice).
brother(bob, dylan).
brother(dylan, bob).

% grandparent/2 (grandparent, grandchild)
grandparent(fred, alice).
grandparent(fred, steve).
grandparent(mike, alice).
grandparent(mike, steve).

% uncle/2
uncle(Uncle, Person) :- parent(Parent, Person), brother(Uncle, Parent).

% aunt/2
aunt(Aunt, Person) :- parent(Parent, Person), sister(Aunt, Parent).

% cousin/2 *brother and sister can be cousins*
cousin(P1, P2) :- grandparent(G1, P1), grandparent(G1, P2).

% fib/2
fib(0, 0).
fib(1, 1).
fib(2, 1).
fib(N, Val) :- N1 is N - 1, Val is fib(1, Val) + fib(N1, Val).

% car/2
car([H|_], H1) :- H1 is H.

% cdr/2
cdr([_|T], T1) :- T is T1. 

% double/2
double([], []).
double([H|T], [H1|T1]) :- H1 is H * 2, double(T, T1).


double(X, Y) :- Y is X * 2.












