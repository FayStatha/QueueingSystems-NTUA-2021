% M/M/1/10 simulation. We will find the probabilities of all states.
% Note: Due to ergodicity, every state has a probability >0.

pkg load statistics

clc;
clear all;
close all;

rand("seed",1);

lambdas = [1,5,10];

nfig = 0;

for j = 1:1:length(lambdas)

  arrivals = zeros(1,11); % to keep the arrivals in each state
  total_arrivals = 0; % to measure the total number of arrivals
  current_state = 0;  % holds the current state of the system
  previous_mean_clients = 0; % will help in the convergence test
  mean_delay = 0;
  index = 0;
  
  mu = 5;
  threshold = lambdas(j)/(lambdas(j) + mu); % the threshold used to calculate probabilities

  transitions = 0; % holds the transitions of the simulation in transitions steps

  while transitions >= 0
    transitions = transitions + 1; % one more transitions step
    
    if mod(transitions,1000) == 0 % check for convergence every 1000 transitions steps
      index = index + 1;
      for i=1:1:length(arrivals)
          P(i) = arrivals(i)/total_arrivals; % calculate the probability of every state in the system
      endfor
      
      mean_clients = 0; % calculate the mean number of clients in the system
      for i=1:1:length(arrivals)
         mean_clients = mean_clients + (i-1).*P(i);
      endfor
      to_plot(index) = mean_clients;
          
      if abs(mean_clients - previous_mean_clients) < 0.00001 || transitions > 1000000 % convergence test
        break;
      endif
      
      previous_mean_clients = mean_clients;
      
    endif
    
    random_number = rand(1); % generate a random number (Uniform distribution)
    if current_state == 0 || random_number < threshold % arrival
      total_arrivals = total_arrivals + 1;
      arrivals(current_state + 1) = arrivals(current_state + 1) + 1; % increase the number of arrivals in the current state
      %{
      if transitions <= 30
        if current_state == 0
          my_arrivals = 0;
        else
          my_arrivals = arrivals(current_state);
        endif
        display(["Current state is ", num2str(current_state), ". Next transition is an arrival. Total arrivals in current state = ", num2str(my_arrivals)]);
      endif
      %}
      if current_state != 10
        current_state = current_state + 1;
      endif
    else % departure
      %{
      if transitions <= 30
        if current_state == 0
          my_arrivals = 0;
        else
          my_arrivals = arrivals(current_state);
        endif
        display(["Current state is ", num2str(current_state), ". Next transition is a departure. Total arrivals in current state = ", num2str(my_arrivals)]);
      endif
      %}
      if current_state != 0 % no departure from an empty system
        current_state = current_state - 1;
        mean_delay=mean_delay+current_state*exprnd(1/mu);
      endif
    endif
  endwhile

  display("Probabilities of each state: ");
  for i=1:1:length(arrivals)
    display(["State: ", num2str(i-1), " has probability ", num2str(P(i))]);
  endfor
  display("\n");
  
  mean_delay=mean_delay/(total_arrivals-arrivals(11));
  display(["Mean delay is: ", num2str(mean_delay), "\n"]);
  
  display(["Probability of blocking a client: ", num2str(P(11)), "\n"]);
  
  avg_clients = sum(P.*[0,1,2,3,4,5,6,7,8,9,10]);
  display(["Average number of clients in the system: ", num2str(avg_clients), "\n"]);

  nfig = nfig+1;
  figure(nfig);
  plot(to_plot,"b","linewidth",1.8);
  title(["Average number of clients in the M/M/1/10 queue: Convergence for λ = ", num2str(lambdas(j)), " clients/min"]);
  xlabel("Transitions in thousands");
  ylabel("Average number of clients");

  nfig = nfig + 1;
  figure(nfig);
  bar(0:1:(length(arrivals)-1),P,'b',0.4);
  title(["Probabilities for λ = ", num2str(lambdas(j)), " clients/min"]);
 endfor