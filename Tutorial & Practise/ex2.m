system_matrix = [2, 7, 3; 4, -5, -1; 2, -4, 1];
system_cons = [5; 10; -1];

solution = system_matrix\system_cons;

display(solution)


