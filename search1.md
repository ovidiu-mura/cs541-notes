# State Space Search

## Intelligence and the Future

* Intelligence is partly about "thinking ahead"

* A complicated problem is solved a piece at a time, or an
  action at a time. Steps interact

* Looking ahead gets complicated fast

* AI has spent a long time thinking about this problem,
  and has found some fairly fancy techniques

* Ultimately P ≠ NP (probably), so must abstract or approximate

## Computers Search Good

* A computer can construct future states from current states
  quickly and perfectly

* Humans are bad at this; "easy" AI might want to
  leverage this

* Problems like route-finding, scheduling, planning,
  puzzle-solving, games, robotics have gone there

* Pattern-matching, machine learning, etc can be *augmented*
  with search

## State Spaces

* A *state* is a situation. It is static in time

* A *state space* is a graph of situations.

* The *neighbors* of a state *s* in a state space are the graph
  edges — states that can be reached from *s* by some atomic
  action

## Road Maps and State Spaces
  
* In a fancy road map, the states are junctions on the
  map. The state space is literally the graph of roads
  and junctions

* An AI could proceed heuristically toward the goal by
  always choosing the route that gets closer to it

* Dead-ends and side-trips are a big problem, though

## Search The Map

* To find a short route, it's probably better to look at
  least a little ahead: traverse the graph a bit and see
  where you end up

* Watch out for backtracking and loops: use a *stop list*

* Ultimately, this is BFS / DFS / Dijkstra search

* Problem is usually boring for modern computers

## Combinatorial State Spaces

* Consider a sliding tile puzzle: what is the state space?

    * State is particular puzzle configuration

    * Neighbors are states reachable by moving one tile:
      each state has 2-4 neighbors (corner, edge, central)

* For an *n × n* puzzle, how many states? *n^2!* (Only half
  are reachable because parity.)

* How big is this graph?

        2 2.40e1
        3 3.63e5
        4 2.09e13
        5 1.55e25
        6 3.72e41
        7 6.08e62

* Won't be examining them all (or half of them)

## Search Strategies

* Keyed off some questions

    * How big is the space?

    * Need a best solution or just a good one?

    * Willing to use heuristics?

    * Need guarantees on solution (quality, existence)?

## Stupid Search

* Let's build a sliding-tile puzzle solver the dumb way

* We will walk the state space randomly until we run into
  the answer

* http://github.com/pdx-cs-ai/slider

## Stop Lists

* Let avoid revisiting old states

* We will use a *stop list* / *closed list* / *tabu list*
  of states we've already visited

    * Actually sets, not lists, but hey

    * There will be a lot: memory is a problem

