% TOPIC QUIZ

% check_it/3
check_it(X, Y, A) :- Y > X, A is Y - X.
check_it(X, Y, A) :- X = Y, A is Y.
check_it(X, Y, A) :- X > Y, A is X - Y.

% cadr/2
cadr([_, H2 | _], X) :- X is H2.

% in/2
in(X, [H | T]) :- X is H ; in(X, T).

% remove_them/3
remove_them([], _, []).
remove_them([H | T1], T2, N) :- in(H, T2), remove_them(T1, T2, N).
remove_them([H1 | T1], T2, [H1 | T3]) :- remove_them(T1, T2, T3).

% fbscore/5
fbscore(Td, Fg, Sf, Ep, S) :-
    				member(Td, [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]),
    				member(Fg, [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]),
    				member(Sf, [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]),
    				member(Ep, [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]),
    				((EP is Ep, Td >= Ep) ; EP is Td),
    			  	S is ((Td * 6) + (Fg * 3) + (Sf * 2) + EP).

:- write('check_it '), nl.	
:- check_it(5, 15, A), write('  (5,15): '), write(A), nl.
:- check_it(15, 5, B), write('  (15,5): '), write(B), nl.
:- check_it(5, 5, C), write('   (5,5): '), write(C), nl.

:- nl, write('cadr'), nl.
:- cadr([1, 2, 3, 4, 5], C), write('  case 1: '), write(C), nl.
:- cadr([1, 2, 3], C), write('  case 3: '), write(C), nl.
:- cadr([1, 2], C), write('  case 2: '), write(C), nl.  

:- nl, write('remove_them'), nl.
:- write('  2: '), remove_them([1,2,3,4,5,6,5,4,3,2,1], [], Lst), write(Lst), nl.
:- write('  3: '), remove_them([1,2,3,4,5,6,5,4,3,2,1], [1, 6], Lst), write(Lst), nl.
:- write(' 10: '), remove_them([1,2,3,4,5,6,5,4,3,2,1], [2,4,5], Lst), write(Lst), nl.

:- nl, write('fbscore'), nl.
:- fbscore(3, 2, 1, 2, Score), write(['T', 3, 'F', 2, 'S', 1, 'X', 2, 'Score', Score]), nl.
:- fbscore(1, F, 0, X, 10), write(['T', 1, 'F', F, 'S', 0, 'X', X, 'Score', 10]), nl, nl.


















