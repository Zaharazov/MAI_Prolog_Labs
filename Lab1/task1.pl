% Предикаты с лекции
length_arr([],0). 
length_arr([_|Y],N) :- length_arr(Y,N1), N is N1+1.
 
member(A,[A|_]).
member(A,[_|Z]) :- member(A,Z).
 
append([],X,X).
append([A|X],Y,[A|Z]) :- append(X,Y,Z).
 
remove(X,[X|T],T).
remove(X,[Y|T],[Y|T1]) :- remove(X,T,T1).
 
permute([],[]).
permute(L,[X|T]) :- remove(X,L,R), permute(R,T).
 
sublist(S,L) :- append(_,L1,L), append(S,_,L1).
 
% 8 вариант - Добавление элемента в конец списка
% Собственная реализация
append_to_end(X,[],[X]).
append_to_end(X,[Y|T],[Y|T1]) :- append_to_end(X,T,T1). % append_to_end(c,[a,b,c,d],P). => P = [a, b, c, d, c] ;
 
% Реализация через базовые предикаты
append_to_end2([Y|T1],X,[Y|T]) :- append(T1,[X],T).       % append_to_end2([a,b,c,d],c,P). => P = [a, b, c, d, c].
 
% 13 вариант - Проверка списка на арифметическую прогрессию
% Собственная реализация
prov([_]) :- ar_prg(_,_,[]).
prov([X|[Y|L]]) :- D is Y-X, ar_prg(D,Y,L).             % prov([1,2,3,4,5]). => true; 
 
ar_prg(D,Y,[T|L]) :- D =:= T-Y, ar_prg(D,T,L).
ar_prg(_,_,[]).
 
% Реализация через базовые предикаты
prov2([_]).                                             % prov2([1,2,3,4,5]). => true.
prov2([X|[Y|L]]) :- D is Y-X, dop_prov2([Y|L],D,X).
 
dop_prov2([],_,_).
dop_prov2(L,D,Z) :- H is Z+D, remove(H,L,P), dop_prov2(P,D,H).
