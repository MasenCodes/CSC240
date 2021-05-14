% states/5
% colors = black, blue, green
states(TN, MS, AL, LA, AR) :- 
				member(TN, ['black', 'blue', 'green']),
				member(MS, ['black', 'blue', 'green']),
				member(AL, ['black', 'blue', 'green']),
				member(LA, ['black', 'blue', 'green']),
				member(AR, ['black', 'blue', 'green']),
				TN \= AR, TN \= MS, TN \= AL,
				MS \= TN, MS \= AL, MS \= LA, MS \= AR,
				AL \= TN, AL \= MS,
				LA \= MS, LA \= AR,
				AR \= TN, AR \= LA, AR \= MS.

% invert/2
invert([], []).
invert([H1 | T1], R) :- is_list(H1), invert(H1, T2), append([T2], T1, R).
invert([H1 | T1], R) :- invert(T1, T2), append(T2, [H1], R).

% slope/3
slope([H1 | T1], [H2 | T2], S) :- X is H2 - H1, Y is T2 - T1, S is Y / X. 

% flattenit/2
flattenit([], []).
flattenit([H1 | T1], T2) :- is_list(H1), append(H1, T1, New), flattenit(New, T2).
flattenit([H | T1], [H | T2]) :- flattenit(T1, T2).

% in/2
in(X, [H | T]) :- X = H ; in(X, T).

% no_dup/2
no_dup([], []) :- !.
no_dup([H1 | T1], L2) :- in(H1, T1), no_dup(T1, L2), !.
no_dup([H1 | T1], [H1 | T2]) :- no_dup(T1, T2), !.

% squash/2
squash(L1, L2) :- flattenit(L1, Flat), no_dup(Flat, L2), !.


% eval_term/3
eval_term([C | E], N, R) :- R is C * (N ** E).

% eval_poly/3
eval_poly([], _, X) :- X is 0.
eval_poly([H | T], N, R) :- eval_term(H, N, Sum), eval_poly(T, N, X), R is X + Sum.

% gen_poly/1
gen_poly(P) :- assert((f(N, R) :- eval_poly(P, N, R))).


:- nl, write('States: ').
:- states(TN,MS,AL,LA,AR),  
     write(['TN', TN, ' MS', MS, ' AL', AL, ' LA', LA, ' AR', AR]), nl.
:- nl, write('invert/2:'), nl.
:- write('  1: '), invert([1,2,3],X), write(X), nl.
:- write('  1: '), invert([1,2,[3,4,[5,[6,7,[8]]]]],X), write(X), nl.
:- nl, write('slope/3:'), nl.
:- write('  1: '), slope([-4 | -4], [2 | 2], X), write(X), nl.
:- write('  2: '), slope([1 | 7], [4 | 11], X), write(X), nl.
:- write('  3: '), slope([-2 | 8], [3 | -4], X), write(X), nl.
:- nl, write('squash/2:'), nl.
:- write('  1: '), squash([a,b,c,d,e,f],X), write(X), nl.
:- write('  2: '), squash([1,1,2,2,3,4,[5,6,[7,8]]],X), write(X), nl.
:- write('  3: '), squash([[2,4,6,8],1,2,[3,4,[5,6],7],8],X), write(X), nl.
:- write('  4: '), squash([[c],[s,c,h,e,m,e],[p,r,o,l,o,g]], X), write(X), nl.
:- nl.
:- nl, write('Polynomials:'), nl.
:- write('  eval_term1: '), eval_term([1 | 1],2,X), write(X), nl.
:- write('  eval_term2: '), eval_term([3 | 2],5,X), write(X), nl.
:- write('  eval_poly1: '), eval_poly([[3 | 2]],5, X), write(X), nl.
:- write('  eval_poly2: '), eval_poly([[1 | 2], [2 | 1], [3 | 0]],1, X), write(X), nl.
:- write('  eval_poly3: '), eval_poly([[1 | 2], [2 | 1], [3 | 0]],2, X), write(X), nl.
:- write('  eval_poly4: '), eval_poly([[2 | 3], [3 | 2], [7 | 1], [9 | 0]],5,X), write(X), nl.
:- retractall(f(_X,_Y)).   % make sure f/2 is not already defined
:- write('  gen_poly1a: '), gen_poly([[1 | 2], [2 | 1], [3 | 0]]), f(2,X), write(X), nl.
:- write('  gen_poly1b: '), f(5,X), write(X), nl.
:- retractall(f(_X,_Y)).   % retract f/2 defined above
:- write('  gen_poly2a: '), gen_poly([[2 | 3], [3 | 2], [7 | 1], [9 | 0]]), f(1,X), write(X), nl.
:- write('  gen_poly2b: '), f(5,X), write(X), nl, nl.










