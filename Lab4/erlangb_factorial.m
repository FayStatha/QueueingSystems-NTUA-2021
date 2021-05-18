function result = erlangb_factorial(r,c)
   nom = r^c/factorial(c);
   den = 1;
   for k = 1:c
     den += (r^k/factorial(k));
   endfor
   result = nom/den;
endfunction
