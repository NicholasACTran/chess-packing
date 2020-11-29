{knight(X, Y)} :- X=1..x, Y=1..y.
{king(X, Y) : X=1..x, Y=1..y}=1.

:- knight(R1, C1), king(R2, C2), |R1-R2|+|C1-C2|=3, C1!=C2, R1!=R2.
:- knight(R, C), king(R, C).

#maximize{1, X, Y : knight(X, Y)}.
