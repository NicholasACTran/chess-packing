# Chess Packing in Clingo/ASP
## Problem Statement
Inspiration Problem that was posed [here](https://veniamin-ilmer.github.io/ship-city).
It can be restated as "Within a n x n chessboard, what is the maximum number of rooks that can be placed on the board, where each rook has a path off the board?" Similar statements can be constructed for the knight, bishop, and queen.
## Implementation
This solution was developed in Answer Set Programming, using the generate, define, and test methodology.
### Generate
Here, we use the choice rule:

`{rook(X, Y, D) : occupied(D)} = 1 :- X=1..x, Y=1..y.`

To generate all possible grids. Similar choice rules exist for the other pieces.
### Define
We define the atom freePath/2 in a recursive manner in order to generate which spaces are part of an unbroken sequence of empty spaces to the boundary based on the type of piece being packed.
### Test
We prune branches by removing any grids where a piece cannot reach a free path.
## Run
Assume clingo is the alias to the local clingo instance.
Run in your command line:

`clingo rooks-game.lp -c x=3 -c y=3`

Where x and y are the dimensions of the grid and the name of the file refers to which piece is being packed.
## Results
Given a n x n grid, the maximum has been found for the first few integers:
| Integer | Rooks | Knights | Bishops | Queens |
|---------|------:|--------:|--------:|-------:|
| 1       |     1 |       1 |       1 |      1 |
| 2       |     4 |       4 |       4 |      4 |
| 3       |     8 |       9 |       8 |      8 |
| 4       |    13 |      16 |      12 |     14 |
| 5       |    21 |      24 |      19 |     22 |
| 6       |    28 |      34 |      28 |     31 |
| 7       |    37 |      44 |      37 |     42 |
| 8       |    50 |      58 |      48 |     54 |
| 9       |       |      73 |      57 |        |
| 10      |       |      91 |      72 |        |
| 11      |       |         |      87 |        |
