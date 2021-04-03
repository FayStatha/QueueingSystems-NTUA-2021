x = -pi:0.01:pi;

subplot (2, 2, 1)
plot(x, sin(x), "b");
legend("sin(x)");
subplot (2, 2, 2)
plot(x, cos(x), "r");
legend("cos(x)");
subplot (2, 2, 3)
plot(x, sin(2*x), "g");
legend("sin(2*x)");
subplot(2, 2, 4)
plot(x, cos(2*x), "m");
legend("cos(2*x)");