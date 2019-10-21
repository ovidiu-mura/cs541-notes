## Adversary Search

* So far, we have only fought the instance

* Consider a two-player game with:

    * Perfect knowledge (for now)

    * No "luck" (for now)

    * Turn-based

    * Always ends

    * Well-defined final score + "zero sum"
  
* Examples: Checkers, Chess, Connect-4, Tic-Tac-Toe

* We can use state-space search to find "good" or maybe even
  "best" plays in that game at a given state

## Game State Space

* State:

    * "Board" position (where are the checkers)

    * Side on move (red or black)

    * Maybe history of game (ugh, not checkers)

* State space is directed, neighbors are states
  after legal moves

* State space may be cyclic (which is where history rules
  sometimes come from)
  

## Zero-Sum and Negamax

* Minimax Theorem (Von Neumann, Nash): Any state in the game
  has a well-defined *value* assuming "best play" by both
  sides

* Basic Negamax idea: 

    * Choose a next state with minimum value for
      opponent (moves are boring)

    * Determine this by valuing each opponent state from
      opponent's point of view (recursively)

    * Zero-sum, so your value = negation of opponent's value

    * Thus, pick state that maximizes negation of opponent's value

## Win Pruning

* If on some search you find a move (successor state) that
  is a win for the side on move — no point in searching further

* This is true whether the win is immediate or by forced play

* Can remove an "exponential" number of states from the
  search

## Game Value

* Value of a game is value of starting state to side on move

    * Game's value is value of starting state

    * Game is "solved" if the value of every state is known
      (recorded or trivially calculated)
  
    * Game is "weakly solved" if the value of every state
      *that could occur in perfect play* is known

* Value is known: Hex

* Weakly solved: Checkers

* Solved: Tic-Tac-Toe, Connect-4, Awari, many others

## The Game of "15"

* Game I found in some old Martin Gardner book

* Rules:

    * Start with tiles labeled 1-9 in the center
    
    * Players take turns choosing a tile from the pile
    
    * Any time a player holds 3 tiles whose total is 15,
      they win

* Perfect information, alternating, terminating, zero-sum: check

* (There's a fantastic trick to playing this game)

## Solving "15"

* Build a negamax search <http://github.com/pdx-cs-ai/nkt>

* Can cheaply calculate value of any position in practice

* Or can calculate the value of all possible positions and
  record them
  
    * (How many possible positions are there?)

## "NKT": Generalizing "15"

* We will generalize to "NKT": N tiles, exactly K tiles in a
  win, winning total is T

* Next natural size is N=15, K=4, T=28, so we'll call this
  game "28"

* Calculating the value of the starting position is going to
  take a *long* time

## Depth-limited Negamax Search

* We want an *approximate* value for a position, and will
  tolerate an *approximately* best move

* For chess, we use "piece value" as a heuristic
  approximation. For "28", maybe number of "almost wins"?

* Heuristic should look at both sides, so subtract on-move
  value from opponent

* But just doing this right away might not be the best
  plan. Let's look ahead some fixed depth and use negamax to
  combine heuristic values

* 28 or fewer possible almost-wins, so we'll set the value
  of an actual win to 29

## Alpha-Beta Pruning

* Generalization of Win Pruning. Hard to explain:

    * Imagine you find a forced score of 3 for some state *s* in the
      middle of the search

    * Imagine further that in some earlier state *t* at the same
      level you had found a score of 2

    * Then your opponent (parent) would never let you get to
      *s*: they would avoid it

    * So there's no point in searching *s* any further

## Alpha-Beta Implementation

* "Alpha-Beta window" keeps track of best score for
  side not on move (alpha) and side on move (beta)

* Prune when computed score exceeds beta

* Game is zero-sum. On recursion, flip and negate the
  window: (alpha, beta) → (-beta, -alpha)

* Window starts with (-max, max). When searching, keep
  bumping alpha up as better moves are found

## Effectiveness of Alpha-Beta

* Depends on move ordering: a good move for the side on move
  will "close the window" a lot, so want to try good moves first

* With optimal move ordering, will effectively *double the
  depth* of the search by pruning; runtime of depth-4
  without = runtime of depth-8 with

* Note that alpha-beta *never changes the answer*: it only
  prunes states that provably don't matter
