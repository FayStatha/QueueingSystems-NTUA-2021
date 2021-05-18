function result = erlangb_iterative(r,n)
  if (n > 0)
    prev = erlangb_iterative(r,n-1);
    result = (r*prev)/(r*prev+n);
  else
    result = 1;
  endif
endfunction