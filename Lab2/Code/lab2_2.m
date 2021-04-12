clc;
clear all;
close all;

pkg load queueing;

lambda = 5;
mu = 5.1:0.001:10;

U = zeros(1, 500);
R = zeros(1, 500);
Q = zeros(1, 500);
X = zeros(1, 500);
P0 = zeros(1, 500);

colors = "mgrbk";

for i = 1:columns(mu)
  [U(i), R(i), Q(i), X(i), P0(i)] = qsmm1(lambda, mu(i));
endfor

nfig = 1;
figure(nfig);

plot(mu, U, colors(nfig));

title("Utilization of system based on different μ");
xlabel("μ (customers/min)")
ylabel("Utilization");

nfig = nfig + 1;
figure(nfig);

plot(mu, R, colors(nfig));

title("Server response time based on different μ");
xlabel("μ (customers/min)")
ylabel("Server response time");

nfig = nfig + 1;
figure(nfig);

plot(mu, Q, colors(nfig));

title("Average number of requests based on different μ");
xlabel("μ (customers/min)")
ylabel("Average number of requests");

nfig = nfig + 1;
figure(nfig);

plot(mu, X, colors(nfig));

title("Througput based on different μ");
xlabel("μ (customers/min)")
ylabel("Throughput");