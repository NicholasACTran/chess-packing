{bishop(X, Y)} :- X=1..x, Y=1..y.
{king(X, Y) : X=1..x, Y=1..y}=1.

:- bishop(R1, C1), king(R2, C2), |R1-R2|=|C1-C2|.

#maximize{1, X, Y : bishop(X, Y)}.
