%Defining possible states of each of the rook space
occupied(t; f).

%Fill two sides of the board with rooks
%Reduces number of models to search
%TODO: Prove this
%rook(X, Y, t) :- X=1..x, Y=1.
%rook(X, Y, t) :- X=1, Y=1..y.

%Generate all possible grids
{rook(X, Y, D) : occupied(D)} = 1 :- X=2..x, Y=2..y.

%Bound the grid with empty space
rook(X, Y, f) :- X=0, Y=1..y.
rook(X, Y, f) :- X=x+1, Y=1..y.
rook(X, Y, f) :- X=1..x, Y=0.
rook(X, Y, f) :- X=1..x, Y=y+1.

%Surrounding space is considered free path
freePath(X, Y) :- X=0, Y=1..y.
freePath(X, Y) :- X=x+1, Y=1..y.
freePath(X, Y) :- X=1..x, Y=0.
freePath(X, Y) :- X=1..x, Y=y+1.

%Generate empty path from the outside space
freePath(X, Y) :- rook(X, Y, f), freePath(X+1, Y).
freePath(X, Y) :- rook(X, Y, f), freePath(X-1, Y).
freePath(X, Y) :- rook(X, Y, f), freePath(X, Y-1).
freePath(X, Y) :- rook(X, Y, f), freePath(X, Y+1).

%Remove any grid where a rook is not adjacent to a free path
:- rook(X, Y, t), not freePath(X, Y+1),
                  not freePath(X, Y-1),
                  not freePath(X-1, Y),
                  not freePath(X+1, Y).

%Maximize the number of rooks by minimizing empty space
#maximize{1, X, Y : rook(X, Y, t)}.
#show rook/3.
