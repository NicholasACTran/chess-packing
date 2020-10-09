%Defining possible states of each of the queen space
occupied(t; f).

%Fill three sides of the board with queens
%Reduces number of models to search
%TODO: Prove this is optimal
%queen(X, Y, t) :- X=1..x, Y=1.
%queen(X, Y, t) :- X=1, Y=1..y.
%queen(X, Y, t) :- X=x, Y=1..y.

%Generate all possible grids
{queen(X, Y, D) : occupied(D)} = 1 :- X=2..x-1, Y=2..y.

%Bound the grid with empty space
queen(X, Y, f) :- X=0, Y=1..y.
queen(X, Y, f) :- X=x+1, Y=1..y.
queen(X, Y, f) :- X=1..x, Y=0.
queen(X, Y, f) :- X=1..x, Y=y+1.

%Surrounding space is considered free path
freePath(X, Y) :- X=0, Y=1..y.
freePath(X, Y) :- X=x+1, Y=1..y.
freePath(X, Y) :- X=1..x, Y=0.
freePath(X, Y) :- X=1..x, Y=y+1.

%Generate empty path from the outside space
freePath(X, Y) :- queen(X, Y, f), freePath(X+1, Y).
freePath(X, Y) :- queen(X, Y, f), freePath(X-1, Y).
freePath(X, Y) :- queen(X, Y, f), freePath(X, Y-1).
freePath(X, Y) :- queen(X, Y, f), freePath(X, Y+1).
freePath(X, Y) :- queen(X, Y, f), freePath(X+1, Y+1).
freePath(X, Y) :- queen(X, Y, f), freePath(X-1, Y-1).
freePath(X, Y) :- queen(X, Y, f), freePath(X+1, Y-1).
freePath(X, Y) :- queen(X, Y, f), freePath(X-1, Y+1).

%Remove any grid where a queen is not adjacent to a free path
:- queen(X, Y, t), not freePath(X, Y+1),
                  not freePath(X, Y-1),
                  not freePath(X-1, Y),
                  not freePath(X+1, Y),
                  not freePath(X+1, Y+1),
                  not freePath(X-1, Y-1),
                  not freePath(X-1, Y+1),
                  not freePath(X+1, Y-1).

%Maximize the number of queens by minimizing empty space
#maximize{1, X, Y : queen(X, Y, t)}.
#show queen/3.
