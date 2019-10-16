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

* Build a negamax search

* Can cheaply calculate value of any position in practice

* Or can calculate the value of all possible positions and
  record them
  
    * (How many possible positions are there?)
