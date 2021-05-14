% at_position/3
at_position(N, [H | _], Ele) :- N is 0, Ele is H, !.
at_position(N, [_ | T], Ele) :- N1 is N - 1, at_position(N1, T, Ele).

% square_positives/2
square_positives([], []).
square_positives([H | T], [H1 | T1]) :- H > 0, H1 is H * H, square_positives(T, T1).
square_positives([_ | T], T1) :- square_positives(T, T1).

% pair_reverse/2
pair_reverse([H1, H2], [H3, H4]) :- H3 is H2, H4 is H1, !.
pair_reverse([H1, H2, H3], [H4, H5, H6]) :- H5 is H1, H4 is H2, H6 is H3, !.
pair_reverse([H1, H2 | T1], [H3, H4 | T2]) :- H3 is H2, H4 is H1, pair_reverse(T1, T2).

% distance/3
distance([P1, P2], [P3, P4], L) :- L is sqrt(((P3 - P1) * (P3 - P1)) + ((P4 - P2) * (P4 - P2))).

% clean_list/2
clean_list([], []).
clean_list([H1 | T1], [H2 | T2]) :- number(H1), H2 is H1, clean_list(T1, T2).
clean_list([_ | T1], T2) :- clean_list(T1, T2).

% squares/2
squares([], []).
squares([H1 | T1], [H2 | T2]) :- number(H1), H2 is H1 * H1, squares(T1, T2).
squares(Bad, Cur) :- clean_list(Bad, Good), squares(Good, Cur). 

% sum_all/2
sum_all([], 0).
sum_all([H|T], S) :- sum_all(T, N), S is H + N.

% sum_squares/2 
sum_squares(List, Ret) :- squares(List, Sqrd), sum_all(Sqrd, Ans), Ret is Ans.

% get_values/2
get_values([], []).
get_values([H1 | T1], [H2 | T2]) :- is_list(H1), sum_all(H1, H2), get_values(T1, T2).
get_values([H1 | T1], [H2 | T2]) :- H2 is H1, get_values(T1, T2).

% nomatch/3
nomatch([], [], []).
nomatch([H1 | T1], [H2 | T2], [H3 | T3]) :- H2 \= H1, H3 is H1, nomatch(T1, T2, T3).
nomatch([_ | T1], [_ | T2], T3) :- nomatch(T1, T2, T3).

% flattenit/2
flattenit([], []).
flattenit([H1 | T1], T2) :- is_list(H1), append(H1, T1, New), flattenit(New, T2).
flattenit([H1 | T1], [H2 | T2]) :- H2 is H1, flattenit(T1, T2).


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




















