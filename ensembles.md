## Theme: Emergent Behavior

* Behavior of a complex composition of simple behaviors

* Examples so far in this course:

    * State-Space search: simple individual search steps
      combine to reach a global goal

    * Machine Learning: combination of simple features are
      interpreted to accurately make a complex decision

    * Neural Nets: combination of simple perceptrons
      makes sophisticated decisions

    * Genetic Algorithms: Interaction of simple genomes
      produces complex answer

* Arguably the only road to AI

## Ensembles

* An *ensemble* is a collection of like things

* We are interested in emergent behavior of ensembles

* Inspiration is often drawn from biology

    * Beehives

    * Bird flocks, fish schools

    * Ant colonies

## Ant Colony

* You want a short path through a maze

* Put a bunch of ants at the entrance and food
  at the exit

* Watch the ants wander through the space

    * At first, they seem to be moving fairly randomly

    * Over time, they form into lines. Why?

    * When an ant finds food, it starts back down the line the
      other way

* The ants' path will become optimized for retrieving food


## Pheromones

* Ants deposit pheromones (smelly stuff) as they move

* Ants follow "pheromone trails" somewhat

* Pheromones decay slowly over time

* More pheromones are released while an ant is leaving a food source

* Net effect: frequently traversed stretches of trail are
  reinforced

## Ant Colony Optimization

* You want a short path through a maze

* Quite literal: move "ants" across a map, depositing
  pheromone trails and decaying pheromones

* After some running time, grab the strongest pheromone path

* <http://github.com/pdx-cs-ai/sim-ant>

## Ensembles of Learners

* Idea: Given an ensemble of weak machine learners, use some
  kind of weighted voting to make a stronger overall learner

* This only makes sense if there is some independence
  between the learners: method, source data, results

* A *boosting* algorithm is used to combine the learners

## AdaBoost

* An effective boosting algorithm

* Adjusts both weights of individual learners
  and weights of errors on individual instances
  passed to the learners

* Outline of training pseudocode (textbook p. 751)
        
        w[x] ← 1 for all instances
        create z[L]
        for each learner L
            E ← 0
            for each incorrectly classified L(x)
                E += w[x]
            for each correctly classified L(x)
                w[x] *= E / (1 - E)
            normalize w
            z[L] ← log (1 - E) / E
        return z

* To classify an instance *x*, choose the class *c* that
  maximizes

        sum[L in learners] (z[L] (L(x) = c))

## Effectiveness of AdaBoost

* Works mysteriously well, reportedly
