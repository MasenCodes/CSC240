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
fib(N, Val) :- N1 is N - 1, N2 is N - 2, fib(N1, X), fib(N2, Y), Val is X + Y.


% car/2
car([H|_], H).

% cdr/2
cdr([_|T], T).

% double/2
double([], []).
double([H|T], [H1|T1]) :- H1 is H * 2, double(T, T1).
double(X, Y) :- Y is X * 2.

% member_of/2
member_of([H|T], E) :- E is H ; member_of(T, E).

% get_odds/2
get_odds([], []) :- !.
get_odds([H|T], T1) :- 0 is H mod 2, get_odds(T, T1).
get_odds([H|T], [H|T1]) :- get_odds(T, T1).

% sum_all/2
sum_all([], 0).
sum_all([H|T], S) :- sum_all(T, N), S is H + N.

% mult_all/2
mult_all([N], N).
mult_all([H|T], S) :- mult_all(T, N), S is H * N.

% square_list/2
square_list([], []).
square_list([H|T], [H1|T1]) :- H1 is H * H, square_list(T, T1).










