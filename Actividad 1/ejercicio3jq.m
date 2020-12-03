function y = ejercicio3jq(x)
  n = length(x);
  y = zeros(1,n);
  for i = 1:n
    if x(i) < 0
      y(i) = -1;
    else
      y(i) = 1;
    endif
  endfor
endfunction
