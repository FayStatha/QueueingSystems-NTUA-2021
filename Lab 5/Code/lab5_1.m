pkg load queueing;

a = 0.001:0.001:0.999;

lambda = 10^4;
mu_1 = 15*10^6/(128*8);
mu_2 = 12*10^6/(128*8);

lambda_1 = lambda*a;
lambda_2 = lambda*(1-a);

min = 10^8;
min_a = 1;

for i = 1:columns(lambda_1)
    [U_1(i), R_1(i), Q_1(i), X_1(i), P0_1(i)] = qsmm1(lambda_1(i), mu_1);
    [U_2(i), R_2(i), Q_2(i), X_2(i), P0_2(i)] = qsmm1(lambda_2(i), mu_2);
    Q_all(i) = Q_1(i) + Q_2(i);
    avg_delay(i) = Q_all(i)/lambda;
    if avg_delay(i) < min
      min = avg_delay(i);
      min_a = a(i);
    endif
endfor

figure(1);

plot(a, avg_delay, 'r');

title("Average delay E[T] based on different α");
xlabel("Probability α")
ylabel("Average delay E[T] (sec)");

display(['Minimum delay is: ', num2str(min), ' for α = ', num2str(min_a)]);