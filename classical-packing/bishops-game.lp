%Defining possible states of each of the bishop space
occupied(t; f).

%Generate all possible grids
{bishop(X, Y, D) : occupied(D)} = 1 :- X=1..x, Y=1..y.

%Bound the grid with empty space
bishop(X, Y, f) :- X=0, Y=1..y.
bishop(X, Y, f) :- X=x+1, Y=1..y.
bishop(X, Y, f) :- X=1..x, Y=0.
bishop(X, Y, f) :- X=1..x, Y=y+1.

%Surrounding space is considered free path
freePath(X, Y) :- X=0, Y=1..y+1.
freePath(X, Y) :- X=x+1, Y=1..y+1.
freePath(X, Y) :- X=1..x+1, Y=0.
freePath(X, Y) :- X=1..x+1, Y=y+1.

%Generate empty path from the outside space
freePath(X, Y) :- bishop(X, Y, f), freePath(X+1, Y+1).
freePath(X, Y) :- bishop(X, Y, f), freePath(X-1, Y-1).
freePath(X, Y) :- bishop(X, Y, f), freePath(X+1, Y-1).
freePath(X, Y) :- bishop(X, Y, f), freePath(X-1, Y+1).

%Remove any grid where a bishop is not adjacent to a free path
:- bishop(X, Y, t), not freePath(X+1, Y+1),
                  not freePath(X-1, Y-1),
                  not freePath(X-1, Y+1),
                  not freePath(X+1, Y-1).

%Maximize the number of bishops by minimizing empty space
#maximize{1, X, Y : bishop(X, Y, t)}.
#show bishop/3.
