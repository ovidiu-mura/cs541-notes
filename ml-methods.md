* Paper on Spam detection from long ago:
  <http://web.cecs.pdx.edu/~bart/papers/spam.pdf>

## Brute Force

* Collect training instances in a bag.

* Pick matching training instance from bag, and classify
  target identically

* Problems:

    * no/multiple matches
    * huge bag
    * slow classification

## Minimum Distance Voting (k-Nearest Neighbor)

* Help with some of the problems of brute force

* Pick *k* "closest" instances from bag

    * Metric for boolean features is usually "Hamming
      Distance"

            H(v1, v2) = sum[i](v1[i] ^ v2[i])

* Vote the instances

## Naive Bayesian learning

* (We've already looked at this)

* Binary setting: Count the number of occurrences of each feature in
  positive and negative setting

* Compare underestimates of probabilities using products

* Take logs to turn products into sums

* Use m-separation to get accurate products

## Decision Trees and ID3

* Want to build a "binary decision tree" that splits
  training set on binary features for a binary class

* ID3 (Quinlan) idea:

  * Greedily pick a feature that splits the training set "as
    well as possible" into positive and negative subsets.

  * For each subset, recurse: pick a remaining feature to
    try to improve the split

  * Stop when the current subset is (almost) all one class

## Information Gain

* Select next feature *f* in tree to maximize information
  gain

    * Recall

            U(S) = sum[x in 0, 1] -pr(x in S) log pr(x in S)

      where

            pr(x in S) = |S[c=x]| / |S|

    * Now compute information gain *Δu* for each feature *f*

            S+ = S[f=1]
            S- = S[f=0]
            Δu = u(S) - (|S+|/|S|) u(S+) - (|S-|/|S|) u(S-)

* Avoid overfitting (gain is probably just training set
  anomaly)

    * Stop when gain from best split is below some threshold

    * Stop when statistical significance of split is low
      (*chi^2* test)

* Greedy is not optimal: mild independence assumption

## Perceptron

* "Artificial Neuron" (Papert *et al*): basis of neural nets

* Handles continuous inputs and outputs well: we will
  binarize anyway because binary

* Idea: predict the binary class as a thresholded weighted sum 
  of the features

        c = sum[i] w[i] x[i] > 0

  (we will use signed weights and features: `x[i], w[i] in [-1..1]`

* Training consists of learning appropriate weights *w*

    * Assign some initial weights (random?)

    * Feed each training instance through the perceptron

    * Adjust the weights "toward the true classification"

            w[i] += a (c - y) x[i]

      where *y* is the unthresholded output. Remember that
      *c* and *x* are -1 or 1. *a* is the "learning rate":
      smalller (a < 0.1) means more reliable convergence,
      larger can mean faster learning or divergence

    * Run all the training instances repeatedly until the
      average accuracy isn't getting better
