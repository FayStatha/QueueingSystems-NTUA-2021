function result = mean_clients(lambda, mu)
  [rho, ~] = intensities(lambda, mu)
  result = rho./(1-rho);
endfunction
