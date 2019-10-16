# More About Search

## Sliding Tile Puzzles: Complete Search

* Rather than running around randomly, want a solver that is
  guaranteed to

    * Return a shortest solution if one exists

    * Say "no" otherwise

* Given sufficient time and memory, of course

## Sliding Tile Puzzles: Breadth-First Search

* Examine states in increasing order of distance from start

* Guaranteed to eventually hit the goal state if exists

* Will not terminate if no solution because "looping"

    * Use a stop list as before

    * The alternative is to organize the states in some DAG
  
    * Note that the stop list could be used as a priority queue
      for Dijkstra's Algorithm: This is arguably the way to
      proceed here

## Sliding Tile Puzzles: Depth-First Search

* We could use depth-first search in an attempt to save
  memory. From start state

    * Try each possible first move

    * Recursively solve the resulting state

    * Never revisit a state *along the current path*

* Will construct long paths for no reason

* Still need a stop list (even more)

##  Sliding Tile Puzzles: Depth-First Iterative Deepening

* Could use *depth-first iterative deepening* (DFID): artficially
  cut off search at depth 1, 2, 3, …

* DFID advantage: uses memory proportional to depth, finds
  shortest path

* Complete but not *systematic*: "redoing" search is not
  that expensive because branching factor

## Sliding Tile Puzzles: Heuristic Search

* Prefer moves that make progress toward the goal

* Wat? Well, humans try to solve one tile at a time from
  first to last as much as possible. *Heuristic:* Number of
  in-place tiles at the front, larger is better

* Maybe computers can do better? *Heuristic:* add up Manhattan
  distance from each tile to its goal position, smaller is better

* Heuristic search doesn't really help the unsat problem

## Sliding Tile Puzzles: Dijkstra's Algorithm

* Blind (no heuristic) *best-first* search

* For this problem, exactly the same as BFS!

* If the *costs* of moves are different (in some other
  problem), this can do better

## A✶ Search

* Maybe adding a heuristic to Dijkstra would help

* But want to preserve shortest-path

* A✶ ("*a-star*") idea: use an "admissible"
  heuristic — one that is always "optimistic"

* The heuristic guides us toward the goal: for example,
  Euclidean distance from the goal on a map

* Basic idea is Dijkstra, but instead of expanding nodes in
  order of least distance from the origin, expand in order
  of least distance from origin *plus* heuristic distance to goal

* *g(s)* is the distance of state *s* from the origin

* *h(s)* is the heuristic distance of state *s* from the goal

* "0" is an admissible heuristic, but boring

* A perfect heuristic eliminates all missteps

## Correctness Of A✶ Search

* Does A✶ preserve the shortest-path property? It does!

* The proof is tricky and relies on the heuristic being
  admissible 

  * Assume A✶ found a longer "bad" path first

  * That means at some state on the bad path a "correct"
    next state was not chosen, but instead some worse next
    state

  * At some state *sc* (maybe the goal), the paths converged again

  * But at *sc* the bad path and the good path now have the
    same heuristic value, but the bad path is longer
    
  * We must thus proceed by expanding the good path until it
    reaches *sc*

* [Original Paper](https://web.archive.org/web/20160322055823/http://ai.stanford.edu/~nilsson/OnlinePubs-Nils/PublishedPapers/astar.pdf)

* Textbook also discusses. Also CLRS

## Sliding Tile Puzzles: A✶

* Fairly simple modification to Dijkstra

* Use a priority queue (min-heap), but keyed on
  *g(s) + h(s)* instead of just *g(s)*

* No separate stop list is needed

* Expands minimum number of states to goal (theorem)

* Complete search algorithm: will stop when all states
  have been examined

* Will actually stop when out of memory
