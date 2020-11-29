%Defining possible states of each of the knight space
occupied(t; f).

%Generate all possible grids
{knight(X, Y, D) : occupied(D)} = 1 :- X=1..x, Y=1..y.

%Bound the grid with empty space
knight(X, Y, f) :- X=0, Y=1..y.
knight(X, Y, f) :- X=x+1, Y=1..y.
knight(X, Y, f) :- X=1..x, Y=0.
knight(X, Y, f) :- X=1..x, Y=y+1.

%Surrounding empty space is considered free path
freePath(X, Y) :- X=0, Y=1..y+1.
freePath(X, Y) :- X=x+1, Y=1..y+1.
freePath(X, Y) :- X=x+2, Y=1..y+1.
freePath(X, Y) :- X=1..x+1, Y=0.
freePath(X, Y) :- X=1..x+1, Y=y+1.
freePath(X, Y) :- X=1..x+1, Y=y+2.

%Generate empty path from the outside empty spaces
freePath(X, Y) :- knight(X, Y, f), freePath(X+1, Y+2).
freePath(X, Y) :- knight(X, Y, f), freePath(X+1, Y-2).
freePath(X, Y) :- knight(X, Y, f), freePath(X-1, Y+2).
freePath(X, Y) :- knight(X, Y, f), freePath(X-1, Y-2).
freePath(X, Y) :- knight(X, Y, f), freePath(X-2, Y+1).
freePath(X, Y) :- knight(X, Y, f), freePath(X-2, Y-1).
freePath(X, Y) :- knight(X, Y, f), freePath(X+2, Y+1).
freePath(X, Y) :- knight(X, Y, f), freePath(X+2, Y-1).

%Remove any grid where a knight cannot jump to a free path
:- knight(X, Y, t), not freePath(X+1, Y+2),
                  not freePath(X+1, Y-2),
                  not freePath(X-1, Y+2),
                  not freePath(X-1, Y-2),
                  not freePath(X-2, Y+1),
                  not freePath(X-2, Y-1),
                  not freePath(X+2, Y+1),
                  not freePath(X+2, Y-1).

%Maximize the number of knights by minimizing empty space
#maximize{1, X, Y : knight(X, Y, t)}.
#show knight/3.
