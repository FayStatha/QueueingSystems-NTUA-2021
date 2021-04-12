% system M/M/1/4

clc;
clear all;
close all;

pkg load queueing

lambda = 5;
mu = 10;%1, 5, 20
nfig = 1;
states = [0, 1, 2, 3, 4]; % system with capacity 4 states
% the initial state of the system. The system is initially empty.
initial_state = [1, 0, 0, 0, 0];

% define the birth and death rates between the states of the system.
births_B = [lambda, lambda/2, lambda/3, lambda/4];
deaths_D = [mu, mu, mu, mu];

% get the transition matrix of the birth-death process
transition_matrix = ctmcbd(births_B, deaths_D);
display(transition_matrix);


% get the ergodic probabilities of the system
P = ctmc(transition_matrix);
display(P);

% plot the ergodic probabilities (bar for bar chart)
figure(nfig);
bar(states, P, "r", 0.5);

% calculate average number of customers in the system
avg_cust = sum(P.*[0,1,2,3,4]);
display(["Average number of customers in the system: ", num2str(avg_cust)]);

% calculate P(blocking)
P_blocking = P(5);
display(["P(blocking) = ", num2str(P_blocking)]);

% transient probability of state 0 until convergence to ergodic probability. Convergence takes place P0 and P differ by 0.01
index = 0;
for T = 0 : 0.01 : 50
  index = index + 1;
  P0 = ctmc(transition_matrix, T, initial_state);
  for i=1:5
    Prob(i,index) = P0(i);
  endfor
  if P0 - P < 0.01
    break;
  endif
endfor

nfig = nfig+1;
colors = "mbgrc";

T = 0 : 0.01 : T;
figure(nfig);
hold on;
for i=1:5
  plot(T,Prob(i,:),colors(i),"linewidth",2);
endfor
hold off;

title(["Probabilities of system with λ = ", num2str(lambda), " customers/min and μ = ", num2str(mu), " customers/min"])
legend("State 0", "State 1", "State 2", "State 3", "State 4");
xlabel("Time");
ylabel("Probabilities");