intervals = 0.1:0.001:0.99;
lambda_1 = 6*intervals;
mu = [6,5,8,7,6];
lambda_2 = 1;

for i = 1:length(lambda_1)
  lambda = [lambda_1(i), lambda_2];
  mc = mean_clients(lambda, mu);
  avg_time(i) = sum(mc)/sum(lambda);
endfor

plot(lambda_1, avg_time, 'g', 'linewidth', 2);

title("Average delay of a client based on different λ1 values");
xlabel("λ1")
ylabel("Average delay of a client (sec)");
