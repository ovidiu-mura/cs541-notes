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

## Fundamentals Of Probability

* Domain: propositions

    * *pr(p)* is probability of event

    * Here, *p* is a prop formula

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

* *p* and *q* are conditionally independent when  *pr(p|q) = pr(p)*

    * By Bayes's Rule

            pr(q|p) = pr(p|q) pr(q) / pr(p)
                    = pr(p) pr(q) / pr(p)
                    = pr(q)

    * In this case, conjunction gets easier

        * *pr(p ∧ q) = pr(p|q) pr(q) = pr(p) pr(q)*

* *p* and *q* are strictly independent when also *pr(p ∧ q) = 0*

    * In this case, disjunction gets easier

            pr(p ∨ q)
            = 1 - pr(¬p ∧ ¬q)
            = 1 - pr(¬p) pr(¬q)
            = 1 - (1 - pr(p))(1 - pr(q))
            = 1 - (1 - pr(p) - pr(q) - pr(p) pr(q))
            = pr(p) + pr(q) + pr(p) pr(q)
            = pr(p) + pr(q)

## Applying Bayes's Rule

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

problem: everything depends on everything else

need to know impossible number of prior and conditional probabilities to
conclude anything

## Bayesian Belief Networks

* Bayes Net (BBN, influence diagram): indicate which priors and
  conditionals have significant influence in practice

    * causal/top-down: *p(M|L) = p(M∧B|L) + p(¬M∧¬B|L)*

    * diagnostic/bottom-up: *p(¬L|¬M) = p(¬M|¬L) p(¬L) / p(¬M)*

* Polytrees: special case for easy computation

* Learning with BBNs

## Is Your Probabilistic Model Meaningful?

* Difference between 0.5 and "don't know" and "don't care"

* MYCIN and probabilities *vs* "likelihoods"

* Cox's Theorem: under reasonable assumptions, any labeling of
  logical sentences with real numbers will be consistent with
  probability

* Problems with real numbers

## Decision theory

* The utility equation: 

* Transitivity and other paradoxes

* Cost of gathering information
