lambda = [4,1];
mu = [6,5,8,7,6];

# a
[rho, ~] = intensities(lambda, mu);

#b
mc = mean_clients(lambda, mu);
avg_time = sum(mc)/sum(lambda);

display(['Average service time = ', num2str(avg_time), ' sec']);