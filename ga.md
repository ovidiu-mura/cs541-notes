## Genetic Algorithms

* another biological model: evolution
* basic approach
    * select feature set
    * construct random "genomes" corresponding to features being
        considered positive, negative
    * repeatedly
        * select highest-scoring genomes on training data
        * create new genomes by mixing genes from sets of selected
            genomes
            * randomly
            * "crossover" on fixed sequences
            * some other way
        * randomly mutate some of the genes of new genomes
    * stop when sufficiently good fit reached (PAC)
* advantages
    * simple to do, understand
    * requires little understanding of problem
* disadvantages
    * evolution is slow!
    * details of scheme can still matter
