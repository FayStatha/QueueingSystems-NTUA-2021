pkg load statistics

clc;
clear all;
close all;

# TASK A: In a common diagram, design the Probability Mass Function of Poisson Distribution
# with lambda parameters 3, 10, 30, 50. In the horizontal axes, choose k parameters 
# between 0 and 70. 

k = 0:1:70;
lambda = [3, 10, 30, 50];
lambda_new = [3, 10, 50];

for i=1:columns(lambda_new)
  poisson(i,:) = poisspdf(k,lambda(i));
endfor

colors = "rbkm";
figure(1);
hold on;
for i=1:columns(lambda_new)
  stem(k,poisson(i,:),colors(i),"linewidth",1.2);
endfor
hold off;

title("Probability Mass Function of Poisson processes");
xlabel("k values");
ylabel("probability");
legend("lambda=3","lambda=10","lambda=50");

# TASK B: regarding the poisson process with parameter lambda 30, compute its mean 
# value and variance

index = find(lambda == 30);
chosen = poisson(index,:);
mean_value = 0;

for i=0:(columns(poisson(index,:))-1)
  p_new = poisson(index, i+1);
  mean_value = mean_value + i.*poisson(index,i+1);
endfor

display("mean value of Poisson with lambda 30 is");
display(mean_value);

second_moment = 0;
for i=0:(columns(poisson(index,:))-1)
  second_moment = second_moment + i.*i.*poisson(index,i+1);
endfor

variance = second_moment - mean_value.^2;
display("Variance of Poisson with lambda 30 is");
display(variance);

# TASK C: consider the convolution of the Poisson distribution with lambda 20 with 
# the Poisson distribution with lambda 30. 

first = find(lambda_new==10);
second = find(lambda_new==50);
poisson_first = poisson(first,:);
poisson_second = poisson(second,:);

composed = conv(poisson_first,poisson_second);
new_k = 0:1:(2*70);

figure(2);
hold on;
stem(k,poisson_first(:),colors(1),"linewidth",1.2);
stem(k,poisson_second(:),colors(2),"linewidth",1.2);
stem(new_k,composed,"mo","linewidth",2);
hold off;
title("Convolution of two Poisson processes");
xlabel("k values");
ylabel("Probability");
legend("lambda=10","lambda=50","new process");

# TASK D: show that Poisson process is the limit of the binomial distribution.
k = 0:1:200;
# Define the desired Poisson Process
lambda = 30;

n = [lambda.*10, lambda.*100, lambda.*1000];
p = lambda./n;

figure(3);

hold on;
for i=1:3
  binomial = binopdf(k,n(i),p(i));
  stem(k,binomial,colors(i),'linewidth',1.2);
endfor
hold off;
title("Poisson process as the limit of the binomial process");
xlabel("k values");
ylabel("Probability");
legend("n=300", "n=3000", "n=30000");