## Decision theory

* The utility equation

* Measuring information

* Cost of gathering information

* A Bayesian method

## Expected Value

* The *expected value* of a uniformly distributed set of
  numbers is the average of its values
  
        E(S) = sum S / |S|

* More generally, the expected value is the centroid

        E(S) = sum [e in S] e pr(e in S)

  This reduces to the average when elements are equally
  probable

## The Utility Equation

* Sometimes you need to pick a best action *a* from a set
  of choices *A*

* When you know what effect *e(a)* each action will have, and
  you know the value *v(e)* of each effect, this is easy:
  just pick

        argmax [a in A] v(e(a))

* But the world is uncertain. Sometimes all you know is
  the probability of various action effects *pr(e|a)*

* You might evaluate the utility *U* of an action in terms
  of *expected* effect value

        U(a) = E(v(a)) = sum [e in e(a)] v(e) pr(e|a)

* You can now just maximize again

        argmax [a in A] U(a)

## The Game of Hangman

* "Defendant" picks a word, writes blanks for
  its letters, draws a gallows


        ----
        |  |
        |
        |
        |
        |       _ _ _ _ _ _ _ _


* "Prosecution" guesses letters of the word in turn.
  Guessing a letter not in the word causes a body part
  to be added to the gallows. Guessing a letter in the word
  fills in all occurrences

        ----   z w
        |  |
        |
        |  O
        |  |
        |      _ _ _ _ _ _ i _



* "Trial" is over when word is completed or def is hanged

        ----   z w e a o u
        |  |
        |
        |  O
        | /|\
        | / \  _ _ _ _ _ _ i c

## Hangman Prosecution and Utility

* What letter should pros guess first?

* Let's assume that def chose random 8-letter word
  from known dictionary

* Let's further assume that a found letter has a uniform
  value of 1

* Then find

        argmax [l in 'a'..'z'] (l in word) pr(word|dict)

* This is an easy calculation: 'e' occurs in 2/3 of the
  8-letter words (see `bestguess.py`)

## Hangman: My Assumptions Are Weak

* Problem: because 'e' is so common, hitting it doesn't
  necessarily narrow things down *so* much
  
* Value function should be based on expected chance of
  winning after hitting *or missing* the letter

* Problem: Def isn't choosing uniformly — will pick "hard"
  words

* Need to know probability given defense strategy
  *pr(word|ds(dict))*

* So

        argmax [l in 'a'..'z'] v(win with word) pr(word|ds(dict))

## Hangman: Nash Equilibrium

* Ugh. *ds(dict)* will depend on guessing strategy

    * "Good old rock. Can always count on rock"

* Adversary games are hard. But Nash Equilibrium exists and
  can *in principle* be calculated

* Current research for me

## Information Theory

* Consider these strings of bits

        0111111111111111

        0101100010011011

    * `x` is boring and easy to describe. You could predict
      the "next value" pretty reliably

    * `y` is complicated

* Shannon *et al*: `x` has "less information" than `y`

* Information content can be viewed as a utility
  function. The *entropy* of a set is given as

        u(S) = sum [i in S] pr(i) lg 1/pr(i)
             = sum [i in S] - pr(i) lg pr(i)

  For our sets (strings)

        u(x) = - pr(0) lg pr(0) - pr(1) lg pr(1)
             = - (1/16) lg (1/16) - (15/16) lg (15/16)
            ~= 0.337

        u(y) = - pr(0) lg pr(0) - pr(1) lg pr(1)
             = - 2 (8/16) lg (8/16)
             = -2 × 0.5 × -1 = 1

## Hangman: Entropy-Based Prosecution

* Pros wants to get to a state where there is only one
  choice

* Standard trick: pick the letter that has the greatest
  expected chance of reducing the entropy the most

        argmax [l in 'a'..'z']
            (1 - sum [p in part(l, dict)] u(l))) pr(l)

* Does this still produce 'e' as the initial guess? It does

* We have taken into account the "cost of gathering
  information" as part of the utility: we don't want to make
  a guess that costs us a body part unless we get a lot
  of information from it

## Demonic Hangman

* Consider "Demonic Hangman": Def cheats as desired by
  changing the word in a way consistent with the guesses so
  far

* Now we almost *have* to use entropy to narrow Def down to
  only one choice quickly

## Bayesian Classification

* A form of machine learning

* Given a bunch of evidence for and against a thing, decide
  whether the thing

* Formulate as a classic probability problem

         pr(H|E1=v1, E2=v2, ... En=vn)

* We can use Bayes Rule to turn this around

           pr(E1=v1, E2=v2, ... En=vn|H) pr(H)
         = -----------------------------------
           pr(E1=v1, E2=v2, ... En=vn)

* Now we "just" need the probabilities: perhaps we can examine
  a bunch of classified examples and compute them

## Binary Naïve Bayes

* Problem: There's a huge space of possible values here;
  likely no way we'll get enough examples to accurately
  estimate probabilities

* Let's reduce the state space:

    * Binarize the hypothesis and evidence. Now the state
      space size is *2^(n+1)* for *n* features

    * Naively assume that all the features are independent
      (they aren't). Then we can just replace the
      conjunction with a product

               pr(E1=v1) pr(E2=v2) ... pr(En=vn|H) pr(H)
             = -----------------------------------
               pr(E1=v1) pr(E2=v2) ... pr(En=vn)

* Sadly, the naive assumption means that the probabilities
  will be too low, since interactions won't be counted: but
  comparable for H true and false. So


        H iff pr(H|E) > pr(not H|E)

* Note that this comparison drops the denominator, which is nice

* Games might be played to make the computation more tractable

## Heart Anomalies: The HW2 Dataset

* We have a bunch of evidence of heart anomalies obtained
  from radiography

* The evidence consists of a fixed list of *features* that
  are present in each radiogram

* Further, the radiograms have been accurately classified
  into one of two categories: normal or abnormal

* Imagine we are given a radiogram of unknown category
  but with all the features measured

* Our job: Is this a radiogram of a normal or abnormal heart?

* See Homework 2
