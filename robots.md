## Robot?

* The term "robot" is slippery. (Carol Kapek's *RUR*
  originated the term, so it's not too helpful.)

* For our purposes: an AI agent attached to some machinery
  for manipulating or navigating the real world

* Usual agent thing: sensors, effectors, AI director

* So not Battlebots (human remote control), but maybe a
  thermostat (AI?)

## Sensors?

* Sensor can be most anything: thermometer, "3D" compass, 3D
  accelerometer, GPS, wheel rotation counter, video camera,
  network of sensor nodes on a farm…

    * Sensors have both *systematic error* (consistently
      measure wrong) and *stochastic error* (give different
      answers in same situation)

    * Sensors fail, which is to say you see sudden negative changes
      in their error pattern. In the *best case* they just
      stop reporting at all and you know that

## Interpreting Sensors

* First AI problem: how to make sense of what the sensors
  are saying

    * Detect "useless" broken sensors and ignore them

    * *Decode* sensors to get salient information: easier
      for a thermometer than a video camera

    * *Integrate* information from various sensors to
      estimate the state of the world

## Decoding Sensors

* Some sensors are more direct than others

    * Thermometer may drop voltage linear in temp: figure
      out linear relation and call it a day

    * GPS has lots of measurement noise: will need to do
      statistics to reduce stochastic error

    * 3D accelerometer has systematic bias and stochastic
      drift: quite hard to deal with

    * Video camera needs some serious AI to interpret
      the output: optical flow, neural nets, etc

* Inverting a function can be much harder than the forward
  direction

## Integrating Sensors

* This is known as "filtering" in the literature for
  some reason

* Can do dumb heuristic things: "use the 'best' sensor
  unless the other sensors strongly disagree, then fall
  back to 'second best'"

* Can take a statistical approach

* Can use a more AI-ish approach

## Spectral Decomposition

* Given:

    * A gamma-ray spectrum of an unknown sample

    * Known gamma-ray spectra of radioisotopes

* Problem: infer levels of radioisotopes. Why is this hard?

    * Sample spectrum will be very noisy (stochastic error)

    * Spectrometer has known bias (systematic error)

    * Continuous search space: how to adjust estimates
      ("weights") of radioisotopes to match sample?

## A Statistical Filter

* One approach: Convex Optimization

* Extension of Linear Programming to optimization
  functions of various types

* I used CVXPY for this problem

* <http://github.com/BartMassey/sd.git>

* Is this actually AI? (I think so)

## Agent Tracking

* Given:

    * A prediction about how an agent is expected to travel
      ("dead reckoning")

    * Sensor readings reporting the position of the agent

* Problem: Track the agent (either this robot, or some other
  entity). Why is this hard?

    * The prediction is likely to be dodgy

    * The sensors are hard to invert

    * The sensors have systematic and stochastic error

## Kalman Filters

* Typical solution: makes best linear estimate
  from various sensors in the presence of noise

* There are a million "better" Kalman Filter variants

* Not a great answer given the problems listed above:

    * Dead reckoning is likely to give weird errors

    * Sensors are hard to linearize

    * Sensor errors are likely not Gaussian

* Quite cheap in CPU cost, quite small memory cost

## A Bayesian Particle Filter

* Another approach: Bayesian Particle Filtering

* Basic idea: use emergent behavior of ensemble (!) of
  models of vehicle position

* For each model ("particle"), at each sensor reading:

    * Propagate each model forward according to dead reckoning
      including stochastic (random) component

    * Re-weight each model's likelihood by how well it agrees with
      the sensor reading

* When an estimate is needed:

    * Construct an estimate of true position from weighted
      model positions and likelihoods

    * Discard the least-likely models

    * Duplicate a likelihood-weighted random sample of the
      the rest to restore the population

* <http://github.com/BartMassey/bpt.git>

* Is this actually AI? (I think so)

## Simultaneous Localization and Mapping (SLAM)

* Produce not only good navigation but a true map of the
  world

* But these interact

* Variety of standard methods; typically a lot of AI-ish code

## Decisions

* Assuming you know what is going on, deciding what to do
  about it is still hard (duh)

    * Have to predict the future (a whole 'nother area of AI)

    * Have to figure out how to achieve the desired effect

* Example: navigating an IRL maze with an IRL robot

    * What is the best algorithm for exploring a maze?
      (surely depends on the maze?)

    * Can the robot get stuck? Can it run out of power?

    * How much time and compute power do you have for these
      decisions?

* "Perfect" maze-running mice…

## Effectors

* Figuring out how to operate actuators is sometimes hard

* Consider moving all the joints in a robot body to pick up
  a cup of tea

    * *Control* problem: how to apply power to the joints
      within their limits to get them where they should be?

    * *Inverse kinematics* problem: what joint motions lead
      to the desired path?

* Standard modern solution: machine learning (models human
  learning?)

* AIBO was Sony's robot pet back in 1998…

## Robots Are AI+

* Lots of hard AI problems to solve in-robot

* Mixed in with problems in

    * Electronics

    * Mechanics

    * Understanding of the world
