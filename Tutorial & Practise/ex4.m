x = -5:0.1:5;
b1 = stdnormal_pdf(x);
b2 = normpdf(x, 0, sqrt(2));

figure(1);
hold on;
plot(x, b1, "r");
plot(x, b2, "b");
hold off;
title("Normal Distributions");
legend("mu = 0, sigma = 1", "mu = 0, sigma = sqrt(2)");