{queen(X, Y)} :- X=1..x, Y=1..y.
{king(X, Y) : X=1..x, Y=1..y}=1.

:- queen(R, C1), king(R, C2).

:- queen(R1, C), king(R2, C).

:- queen(R1, C1), king(R2, C2), |R1-R2|=|C1-C2|.

#maximize{1, X, Y : queen(X, Y)}.
