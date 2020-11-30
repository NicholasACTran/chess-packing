{rook(X, Y)} :- X=1..x, Y=1..y.
{king(X, Y) : X=1..x, Y=1..y}=1.

:- rook(R, C1), king(R, C2).
:- rook(R1, C), king(R2, C).

#maximize{1, X, Y : rook(X, Y)}.
