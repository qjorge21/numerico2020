function resultado = puntoMedioJQ(f, a, b, n)
  % Calcula el valor de una integral usando el metodo del punto medio
  % Input: f funcion a integrar
  %        a,b limites de integracion
  %        n cantidad de intervalos
  
  h = (b-a)/n;
  resultado = 0;
  
  for i=0:n-1
    x1 = a + i*h;
    x2 = a + (i+1)*h;
    pm = (x1 + x2)/2;
    resultado = resultado + double(f(pm));
  end
  
  resultado = resultado * h;  
end