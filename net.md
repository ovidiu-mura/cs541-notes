
## Neural Nets

* neuron threshold: *(sum i \| x\[i\] - h\[i\] &gt; 0.5)*
* may replace *&gt;* (expensive) with cheaper and differentiable
    nonlinear function
* need at least two layers
* how to compute weights?
    * training v. reinforcement?
    * in any case, error *backpropagation* via gradient descent on
        squared error
        * consider threshold case
        * assume *E = (t - o)\^2* where *E* is error, *t* is target
            response, *o* is output response
        * change *h'\[i\] - h\[i\] = a \* dE/dh\[i\] = - a \*
            x\[i\] \* E*

## ML Example: Neural Net Backgammon

* What is backgammon?
* Why is BG hard?
* Gerry Tesauro 199x: TD(lambda) NN reinforcement learning can learn
    to play good BG from rules alone!
* Add shallow search for tactics, tune: best BG player ever!
* Humans learn BG from TD(lambda), close circle
* Go?

## CS Ethics: Neural Net Actuarials?

* Can build a neural net that

    * given: training data about insurance payoffs
    * predicts: expected cost of policy to insurance co.

* Ethically, must use only socially sanctioned data,
  e.g. not race!

* *But*

    * net can infer race from e.g. eye color, average salary, traffic
      stops by location

    * can infer from given set of inputs?

    * net is nondeclarative: *how does it use the inputs*?

* Net may inadvertantly "discriminate" based on true costs
* Worse, malicious person may adjust input choice and training data
    (even weights?) to discriminate
* Conclusions?
