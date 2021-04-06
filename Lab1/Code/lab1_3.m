pkg load statistics

clc;
clear all;
close all;

nfig = 1;

number_of_events = [100, 200, 300, 500, 1000, 100000];

for j=1:6
  random_intervals = exprnd(1/5, 1, number_of_events(j));

  event_time = zeros(1, number_of_events(j));
  counts = ones(1, number_of_events(j));
  event_time(1) = random_intervals(1);

  for i=2:number_of_events(j)
    event_time(i) = event_time(i-1) + random_intervals(i);
    counts(i) = counts(i-1) + 1;
  endfor
  
  if (j == 1)
    figure(nfig);
    stairs(event_time, counts, 'linewidth', 1.5);

    title("Poisson Counting Process with λ = 5");
    ylabel("Count of events");
    xlabel("Time");
  endif

  mean_value_of_events = number_of_events(j)/event_time(number_of_events(j));

  disp(["Mean value of poisson events in unit of time for ", num2str(number_of_events(j)),...
                          " events, is ", num2str(mean_value_of_events), "."]);
endfor