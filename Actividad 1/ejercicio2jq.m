function y = ejercicio2jq(x)
  n = length(x);
  y = zeros(1,n);
  for i = 1:n
    y(i) = x(i)*x(i);
  end
end
