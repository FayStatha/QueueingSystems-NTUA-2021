pkg load statistics

clc;
clear all;
close all;

nfig = 1;
colors = "mgrbk";

# TASK A: In a common diagram, design the Probability Density Function of Exponential Distribution
# with mean 0.5, 1, 3. In the horizontal axes, choose k parameters between 0 and 8.

k = 0:0.00001:8;
mean = [0.5, 1, 3];

for i = 1:3
  exp(i,:) = exppdf(k, mean(i));
endfor


figure(nfig);
hold on;
for i = 1:3
  plot(k, exp(i,:), colors(i), 'LineWidth', 1.5);
endfor
hold off;

title("Probability Density Function of Exponential Distribution");
xlabel("k values");
ylabel("probability");
legend("mean = 0.5", "mean = 1", "mean = 3");

# TASK B: In a common diagram, design the Cumulative Distribution Function of Exponential Distribution
# with mean 0.5, 1, 3. In the horizontal axes, choose k parameters between 0 and 8.

for i = 1:3
  exp(i,:) = expcdf(k, mean(i));
endfor

nfig = nfig + 1;
figure(nfig);
hold on;
for i = 1:3
  plot(k, exp(i,:), colors(i), 'LineWidth', 1.5);
endfor
hold off;

title("Cumulative Distribution Function of Exponential Distribution");
xlabel("k values");
ylabel("probability");
legend("mean = 0.5", "mean = 1", "mean = 3", 'location', 'southeast');

# TASK C: calculate tha probabilities P(X>30000) and P(X>50000|X>20000) with 1/lamda = 2.5 sec
# to show memory loss property of exponential distribution

exp_c = expcdf(k, 2.5);

probab_1 = 1 - exp_c(30000);
display("P(X>30000) when X~Exp(1/2.5) is")
display(probab_1)

probab_2 = (1 - exp_c(50000))/(1 - exp_c(20000));
display("P(X>50000|X>20000) when X~Exp(1/2.5) is")
display(probab_2)