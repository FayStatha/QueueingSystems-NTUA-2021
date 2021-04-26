# Lab 3

The third lab of the course was about making a simulation of M/M/1/10 system.

Mu = 5 customers/min and lambda = {1, 5, 10} customers/min.

The simulation must calculate:
- The ergodic probabilities of the system.
- The average number of customers in the system.
- The probability of blocking a customer.
- The average delay for each customer.

#### Exercise

##### Task (1)

For the first 30 transisions of the system, display the current state, the type of the next transistion (arival or departure) and the number of arrivals in the current state.

If the results are fine, remove this debugging part of code and continue with the simulation.

#### Task (2)

Run the simulation for the given lambda values.

Plot the average number of customers in system and also the final ergodic probability of each state.

#### Task (3)

What conclusions do you make about the convergence speed? How many transisions in the begging of the simulation can you ignore to make the system converge faster? 

#### Task (4)

What changes do you need to make to the code in order to implement a system with variable mu value:
mu = mu_0 * (i+1), where mu_0 = 1 customer/min and i stands for the state of the system?
