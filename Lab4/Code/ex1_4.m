p_blocking = zeros(1,200);
lambda = 200/60;
mu = 1/23;
r = lambda/mu;
found = false;

for i = 1:200
  p_blocking(i) = erlangb_iterative(r, i);
  if (p_blocking(i) < 0.01 && !found)
    answer = i;
    found = true;
  endif
endfor

plot(p_blocking, 'b', 'linewidth', 2);
title("P(blocking) per number of lines");
xlabel("Number of lines");
ylabel("P(blocking)");

display(["Number of lines needed so that P(blocking) is less than 1% is: ", num2str(answer), "."]);