prince(charles).
prince(andrew).
prince(edward).

princess(ann).
queen(elizabeth).

child(charles, elizabeth).
child(andrew, elizabeth).
child(edward, elizabeth).
child(ann, elizabeth).

older(charles, ann).
older(charles, andrew).
older(charles, edward).
older(ann, andrew).
older(ann, edward).
older(andrew, edward).

son(X,Y) :- prince(X), child(X,Y).
daughter(X,Y) :- princess(X), child(X,Y).

successor(X,Y) :- child(X,Y).

findAllSuccessors(Queen, AllSuccessors) :- findall(X, (successor(X,Queen), child(X, Queen)), AllSuccessors).

%Change from part1 to part2.
%precedes(X,Y) :- prince(X), princess(Y); older(X,Y), prince(X), prince(Y); older(X,Y), princess(X), princess(Y).
precedes(X,Y) :- older(X,Y).


%Sort using insertSort.

insertionSort([], []).
insertionSort([H|T], SuccessionLine) :- 
  insertionSort(T, SortedTail), 
  insert(H, SortedTail, SuccessionLine).

insert(A, [H|T], [H|Result]) :- not(precedes(A, H)), !, insert(A, T, Result).
insert(H, T, [H|T]).

successionLine(Queen, SuccessionLine) :-
    findAllSuccessors(Queen, AllSuccessors),
    insertionSort(AllSuccessors, SuccessionLine).


%Sorting using quicksort(alternate).
/*
sussessionListSort([],[]).
sussessionListSort([H|T], SuccessionLine) :-
    partition(H, T, Less, Greater),
    sussessionListSort(Less, SortedLess),
    sussessionListSort(Greater, SortedGreater),
    append(SortedLess, [H|SortedGreater], SuccessionLine).

partition(_,[],[],[]).
partition(P, [H|T], [H|Less], Greater) :-
    precedes(H,P),
    partition(P,T,Less,Greater).
partition(P, [H|T], Less, [H|Greater]) :-
    not(precedes(H,P)),
    partition(P,T,Less,Greater).

successionLine(Queen, SuccessionLine) :-
    findAllSuccessors(Queen, AllSuccessors),
    sussessionListSort(AllSuccessors, SuccessionLine).
*/