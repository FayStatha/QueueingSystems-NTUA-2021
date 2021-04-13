# Lab 2

The second lab of the course was about understanding M/M/1 and M/M/1/K queues.

The code for the third exercise was given to us, as a demo code, and we only made some small changes.

Also, the first exercise was theoretical.

#### Exercise 2 - M/M/1

##### Task A

Given lambda = 5 customers/min, find mu values in interval [0,10], so that the system is ergodic.

#### Task B

For the mu values of task A, plot the below diagrams:

- Utilization
- Average server response time
- Average number of customers in system
- Throughput of system

#### Task C

Which mu value would you select and why, bases on the diagram of average response time.

#### Task D

What conclusion can you make about the throughput of the system on M/M/1 queues.

#### Exercise 3 - Birth-Death Process application on M/M/1/K

An M/M/1/4 system is given. Arrivals in system depend on the state, with lambda_i = lamda/(i+1). Lambda = 5 customers/min and mu = 10 customers/min.

In the begging there are no customers in the system.

##### Task A

Make a mathematical model of the system as a Birth-Death Process. Design the transition rates diagram and, also, calculate the ergodic probabilities of each state and the probability of blocking a customer. 

#### Task B

Using ctmcbd command, of queueuing package, make a model of the systems:

##### Subtask i

Calculate the transition matrix.

##### Subtask ii

Using ctmc command of queueing package, find the ergodic probabilities of each state. Confirm that they are the same with the probabilities calculated in Task A.

##### Subtask iii

Find the average number of customers in the system.

##### Subtask iv

Find the probability of blocking a customer.

##### Subtask v

For each state of the system, design the diagram of probabilities as a function of time, from begging until they have a distance lower than 1% from the ergodic probabilties of subtask ii.

##### Subtask vi

Repeat subtask v, with lambda = 5 customers/min and mu = 1, 5 or 20 customers/min. What conclustion do you make about the convergence speed and the final probabilities?