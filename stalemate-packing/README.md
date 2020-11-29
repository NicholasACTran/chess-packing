# Chess Packing in Clingo/ASP
## Problem Statement
Inspiration Problem that was posed [here](https://veniamin-ilmer.github.io/ship-city).
It can be restated as "Within a n x n chessboard, what is the maximum number of rooks that can be placed on the board, where each rook has a path off the board?" Similar statements can be constructed for the knight, bishop, and queen.
## Implementation
This solution was developed in Answer Set Programming, using the generate, define, and test methodology.
### Generate
Here, we use the choice rules:

```
{queen(X, Y)} :- X=1..x, Y=1..y.
{king(X, Y) : X=1..x, Y=1..y}=1.
```

The former will generate the positions of all of the pieces. The latter will place a single king somewhere on the board.
### Define
There from the previous generation, there does not need to be defined extensions.
### Test
We prune branches by removing any grids where the king is attacked.
## Run
Assume clingo is the alias to the local clingo instance.
Run in your command line:

`clingo queens-stalemate.lp -c x=3 -c y=3`

Where x and y are the dimensions of the grid and the name of the file refers to which piece is being packed.
## Results
Given a n x n grid, the maximum has been found for the first few integers:
| Integer | Rooks | Knights | Bishops | Queens |
|---------|------:|--------:|--------:|-------:|
| 1       |       |       0 |         |      0 |
| 2       |       |       3 |         |      0 |
| 3       |       |       8 |         |      2 |
| 4       |       |      13 |         |      6 |
| 5       |       |      22 |         |     12 |
| 6       |       |      33 |         |     20 |
| 7       |       |      46 |         |     30 |
| 8       |       |      61 |         |     42 |
| 9       |       |      78 |         |     56 |
| 10      |       |      97 |         |     72 |
| 11      |       |     118 |         |     90 |
## OEIS Entries
Queens: [A002378](https://oeis.org/A002378)
Knights: [A339305](https://oeis.org/A339305)
