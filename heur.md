# Heuristic and Rule-Based AI

## Problem and Instance

* Basic idea from algorithms

* An *instance* is

    * Some specific description of a situation

    * Some description of what is wanted in that situation

* A *problem* is a collection of related instances

* A *class* is a collection of related problems

## AI Problems

* In AI, a problem is likely to be

    * Fuzzily specified: want a "smart answer" that is "good enough"

    * Hard: No efficient algorithm is known to exist for
      large / hard instances

    * Human-tractable: Humans demonstrably do a reasonable job
      on real-world instances

* "AI Complete" problems are those for which a good solution
  will require general intelligence

* (Conversely, a general intelligence would handle standard
  algorithms problems)

## Problem: Pathfinding

* *Instance:* A map

* *Solution:* A good route through that map

* Issues:

    * How much detail is in the map? Like a Google map? A
      treasure map? A photo?

    * Similar: How is the map represented? A graph? An
      image? Something else?

    * What is a "good" route? Short? Low-effort? Safe?

* Dijkstra's Algorithm or similar search is good for small
  instances of simple problems

* Super-fancy AI techniques are used on some kinds of
  real-world problem

## Abstraction

* Abstract away "irrelevant" details

* For example, take image to Google Map (fancy graph),
  Google Map to simple graph

* Hard to tell what is irrelevant

## Games

* We study games because they are

    * Hard: seem to require some intelligence

    * Pre-abstracted: "simple" models, clear rules, "win
      condition"

* "Game" is a bit ill-defined: certainly includes
  single-agent and multiple-agent things

* Games range from competitive to cooperative

## Shut The Box

* [Shut The Box](https://en.wikipedia.org/wiki/Shut_the_Box)
  is a simple multi-player probabilistic dice
  [game](http://www.shut-the-box.net)
  vaguely related to Yahtzee

* We will use the single-player 9-digit game with "digital"
  ("say what you see") scoring

* I have built a single-player
  [solver](http://github.com/BartMassey/digitgame) for this
  game. We will learn how it works. Today is not that
  day

* (rules, demo)

* Let's build some Python AIs for this game

## Shut The Box: Setup

* "Obvious": Represent a *state* as a set of remaining
  digits and a dice roll

* Apparently a state is an instance to be solved

* Solution? A "better" state

  * Can be greedy: pick the next state with lowest score

  * Greed is not necessarily good: actual scoring is at the end

  * Now we're balancing two things: lower score / "better" numbers

## Shut The Box: Code

* AI code is a lot of setup per unit intelligence

* I've done some of this setup for you here

* Let's look at the code

## Shut The Box: Player

* Just choosing randomly from the legal moves is not AI (or
  is it)?

* But it's a good place to start

* We'll then build stronger heuristic rules and evaluate via
  play

## Shut The Box: Evaluating the Player

* Could try to do a full analytic evaluation

* Much easier to play a bunch of games and see how it does

* What is the success measure? Mean? Number of perfect
  scores? Something else?

* Will the AI vary depending on what success measure is
  chosen? (yes)
