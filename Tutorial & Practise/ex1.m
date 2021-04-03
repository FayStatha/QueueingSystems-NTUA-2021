# First build the array
my_array = rand(100, 100);

# Task a
display(my_array(45:49,34:37));

# Task b
count = 0;

for i=1:100
  for j=1:100
    if (my_array(i,j) > 0.5)
      count = count + 1;
    endif
  endfor
endfor

display(count);

# Task c
sum_of_elements = sum(sum(my_array));

display(sum_of_elements);

# Task d
mean_of_elements = mean(mean(my_array));

display(mean_of_elements);