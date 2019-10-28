## AI, Decision Making, and Probability

* About decision-making

* Uncertainty, likelihood, and probability

* Decision-theoretic methods

## Probability

* Idea: *chance* and *likelihood* are important concepts for real
reasoning

* Method: assign probabilities to events and combinations of events

* Reason from model using calculation

* This is a general plan:

            Evidence -----------------> Conclusions
               |                            ^
               |                            |
               v                            |
             Model   -----------------> Extrapolation

## Probability of Events

* Domain: events

    * *pr(E)* is probability that event *E* happens

    * *pr(E) = #E / (#E + #¬E)*

    * For a coin *pr(H) = #H / (#H + #T) = 1 / 2*

    * For a pair of dice:

         * *pr(R7) = #R7 / #R*
         
         * *#R7 = #{(1, 6), (2, 5), (3, 4), …} = 6*

         * *#R = #{D×D} = 36*
         
         * *pr(R7) = 6 / 36 = 1/6*

         * Check with computer program
           [prob7](http://github.com/pdx-cs-ai/prob7]

## Probability of Logical Situations

* Domain: propositional formula

    * *pr(p)* is probability of logical combination of events

    * *p* is a prop formula

* Priors and conditionals

    * *pr(p|q)* is prob of *p* given *q* (easy to get backward)

## Axioms Of Probability

  * equivalence: if *p ≡ q* then *pr(p) = pr(q)*

  * range: *0 ≤ pr(p) ≤ 1*

  * negation: *pr(¬p) = 1 - pr(p)*

  * conjunction: *pr(p ∧ q) = pr(p) pr(q|p) = pr(q) pr(p|q)*

## Derived Probability Rules

* disjunction: *pr(p ∨ q) = pr(¬(¬p ∧ ¬q)) = 1 - pr(¬p ∧ ¬q)*

* Bayes's Rule: 

          pr(q) pr(p|q) = pr(p ∧ q) = pr(p) pr(q|p)
          pr(q) pr(p|q) = pr(q|p) pr(p)
          pr(p|q) = pr(q|p) pr(p) / pr(q)

## Independence

* When *p* and *q* are conditionally independent *pr(p|q) = pr(p)*

    * By Bayes's Rule

            pr(q|p) = pr(p|q) pr(q) / pr(p)
                    = pr(p) pr(q) / pr(p)
                    = pr(q)

    * In this case, conjunction gets easier

        * *pr(p ∧ q) = pr(p|q) pr(q) = pr(p) pr(q)*

* When *p* and *q* are strictly independent *pr(p ∧ q) = 0*

    * In this case, disjunction gets easier

            pr(p ∨ q)
            = 1 - pr(¬p ∧ ¬q)
            = 1 - pr(¬p) pr(¬q)
            = 1 - (1 - pr(p))(1 - pr(q))
            = 1 - (1 - pr(p) - pr(q) - pr(p) pr(q))
            = pr(p) + pr(q) + pr(p) pr(q)
            = pr(p) + pr(q)

## Bayes's Rule

* Given

    * evidence *E* with *prior probability* *pr(E)*

    * hypothesis *H* with pp *pr(H)*

    * probability *pr(E|H)* of the evidence given that the
      hypothesis holds

* We want

    * probability *pr(H|E)* that the hypothesis holds given
      the evidence

* By Bayes's Rule

    * *pr(H|E) = pr(E|H) pr(H) / pr(E)*

## The Medical Example

* H = "You have Glaubner's Disease"  
  E = "Reaper's Test is positive"

* Rare disease: *pr(H) = 1e-6*

* Low false positive rate: *pr(E|¬H) = 1e-4*

* Perfect false negative rate: *pr(E|H) = 1*

        pr(H|E) = pr(H) pr(E|H) / pr(E)
                = pr(H) / pr(E∧H ∨ E∧¬H)
                = pr(H) / (pr(E|¬H) pr(¬H) + pr(E|H) pr(H))
                = 1e-6 / (1e-4 × (1-1e-6) + 1e-6)
                ~= 1e-6 / 1e-4 = 1e-2 = 0.01

* IRL the false negative rate will be nonzero too, so you
  will not learn a ton from the test either way

* Been there

## Bayesian Belief Networks

* Bayes Net (BBN, influence diagram) : indicate which priors and
  conditionals have significant influence in practice

                        Cloudy
                       /      \
                  Sprinkler   Rain
                       \      /
                      Wet Grass

* Usually reason one of two ways:

    * causal/top-down: 
    
             p(W|C) = p(W|S∨R)
                    = 1 - p(W|¬S) p(¬S|C) p(C) ×
                          p(W|¬R) p(¬R|C) p(C)

    * diagnostic/bottom-up: *p(C|W)*

* Polytrees: special case for easy computation

* Problem: everything depends on everything else

    * Need to know impossible number of prior and conditional
      probabilities to conclude anything

    * Maybe *learn* probabilities?

## Is Your Probabilistic Model Meaningful?

* Difference between 0.5 and "don't know" and "don't care"

* MYCIN and probabilities *vs* "likelihoods"

* Consequence of Cox's Theorem: under reasonable
  assumptions, any labeling of logical sentences with real
  numbers will be consistent with probability

* Measurement issues; numeric issues
