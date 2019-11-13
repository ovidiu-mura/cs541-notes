## Perceptron

* Recall the Perceptron

        h = sum[i] w[i] x[i]
        y = h > 0

* The Perceptron is trained using an error term

        w[i] += a (c - y) x[i]

* This isn't necessarily the best plan: it distributes
  error equally across all weights

* More traditional plan: distribute error according to
  effect on the output using *∂y/∂h*

* Sadly, `y = h > 0` is not so differentiable

## Sigmoid Squashing Function

* The sigmoid function is

        s(h) = (e**h - 1) / (e**h + 1)

* You can plot it with `gnuplot`

* You can add a constant to make it steeper or shallower,

        s(h) = (e**(ah) - 1) / (e**(ah) + 1)

  but we won't

* `s(h)` is differentiable, so we can distribute error more
  fairly

## Beyond Perceptrons

* One PCT is kind of a poor learner

* Learning XOR is impossible

        x1 x2  y
         0  0  0
         0  1  1
         1  0  1
         1  1  0

  Cannot choose *w1*, *w2* such that

        x1 * w1 + x2 * w2 > 0

  matches the sign

## "Neural" Nets

* Idea: Glue PCTS together into a DAG so that they can learn
  more complicated functions

        x1 ^ x2 = (x1 | x2) & !(x1 & x2)
        w21 (w111 x1 + w112 x2 > 0) + w22 (w121 x1 + w122 x2 > 0) > 0

  * *w111* and *w112* positive
  * *w121* and *w122* negative
  * *w21* positive
  * *w22* negative

* *Note:* The inner nonlinearity is critical. Otherwise
  simple algebra gives

       (w21 w111 + w22 w121) x1 + (w21 w112 + w22 w122) x2 > 0

       a1 x1 + a2 x2 > 0

  and we're back where we started.

## Weight Assignment

* We have a discriminator that can XOR, but how to
  pick the right weights?

* Use training (or reinforcement) to adjust the weights as with
  PCT

* Weight assignment by error *backpropagation*: gradient descent on
  squared error

    * Consider threshold case

    * Assume

            E = (c - y)**2

      where *E* is error, *c* is target response, *y* is
      output response

    * Change 

            h'[i] - h[i] = a  dE/dh[i]
                         = -a * x[i] * E

      (See fancy writeup)

## Big Nets

* Typical architecture: input layer → hidden layers → output layer

    * More / wider (and fancier) hidden layers = more
      generalization ("deep learning")

    * Training gets slow quickly

* Use multicore CPUs, SIMD graphics cards, Tensor Processing
  Units to do weight adjustments on a whole layer in parallel

## ML Example: Neural Net Backgammon

* What is backgammon?

* Why is BG hard?

* Gerry Tesauro 199x: *TD(lambda)* NN reinforcement learning
  can learn to play good BG from rules alone!

* Add shallow search for tactics, tune: best BG player ever!

* Humans learn BG from *TD(lambda)*, close circle

* Recently Go, Chess, etc

## CS Ethics: Neural Net Actuarials?

* Can build a neural net that

    * Given: training data about time-on-job
    * Predicts: expected time-on-job

* Ethically, must use only socially sanctioned inputs,
  e.g. not race!

* *But*

    * Net can infer race from e.g. eye color, average salary, traffic
      stops by location, the MMPI (!)

    * Net is nondeclarative: *how does it use the inputs*?

* Net may inadvertantly "discriminate" based on hidden
  undesired variables

* Worse, malicious person may adjust input choice and
  training data (even weights?) to discriminate

    * Hidden Delta theorems: NPC to find intentionally-induced
      errors

* Conclusions?
