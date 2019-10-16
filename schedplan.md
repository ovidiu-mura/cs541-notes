## Scheduling and Planning

* Super-common application of AI search

* Already seen examples of *route planning* using A✶

* Drives much of business and industry today

## Scheduling

* Assign *start times* to *tasks*, for example calendaring

* A task is atomic, has a name and duration

* We will consider discrete time and finite number of tasks
  to be scheduled

* Usually looking for optimal schedule; usually means
  shortest to complete all tasks

## Scheduling Constraints

* Usually the task start times are constrained in some way:

    * Limit on number of tasks at a given time

    * End of task A must precede start of task B

    * Deadline by which task / tasks must be completed

    * Resources the task needs to complete

        * *Capacity* resource: staff, power, etc that is
          either enough there or isn't

        * *Consumable* resource: fuel, lumber, etc

## Simple Case: Bin Packing

* Can run at most *k* tasks at a time, no other constraints

* Tasks are of varying duration: some long, some short

* This becomes a question of distributing the tasks as evenly
  as possible into *k* groups

* Special cases:

    * *k* = 1: Super-boring. Just run the tasks in any order
      end-to-start

    * *k* = 2:
      [Number Partitioning](https://en.wikipedia.org/wiki/Partition_problem).
      NP-hard, but most practical instances are super-fast

## Simple Case: Precedence Constraints

* End-to-start precedence constraints require the end of one task to come
  before or at the end of another task

* Think of building a house (floor, then walls, then roof)
  or making a meal (boil water, make spaghetti)

* Topological sort works here:

    * Schedule tasks that can go first

    * When a task completes, schedule tasks that can now proceed

    * Continue until done

* (Can also sort end-to-start, producing a "right-justified"
  schedule.)

## Combined Case: Resource-Constrained Project Scheduling

* If we have both parallelism constraints (think capacity
  resources) and precedence constraints, it is RCPS

* Tasks are marked with predecessors (come before), resource
  usage

* We can try topo sort, but if we don't have enough resource
  we can't start all the open tasks: which one?

* This can be framed as a search problem: start some subset
  and see how it works out

* Heuristics:

    * Short tasks first (enables more parallelism)

    * Long tasks first (since they bottleneck)

    * Hmmm

## Planning

* Planning is related to scheduling, but:

    * Operators may (often will) have zero duration

    * Can perform an operation as many times as needed

    * Operations have preconditions and postconditions

## Blocks World

* Standard planning environment:

    * Consider blocks A, B, ... in stacks on a table in some way

    * Want to rearrange them some different way

    * Operations:

        * Move a top block to (infinite) table to start a
          new stack

        * Pick up the top block of some stack and place it
          on top of a different stack

* There is an *easy* algorithm that takes at most *2n*
operations for *n* blocks…

## General Purpose Planning

* Describe operators and environment in some generic way

* Have a GP planner try to find a plan

* Blocks World instances are *hard* for GP planners (!?)

## Optimal Blocks World

* Want a *shortest* restacking plan

* Turns out this problem is NP-hard (!?)

* Worse yet, finding an *approximately* shortest plan is
  NP-hard (?!?)

* But can solve reasonable-sized instances by… A✶ search!

* Best planners do big state-space change to reduce search

## Advanced Planning

* Logical formulation of planning problems for GP planners

* Optimal-cost planning

* Planning under uncertainty — what if:

    * Environment isn't really known for sure in the future

    * Operators might not do what they're supposed to
