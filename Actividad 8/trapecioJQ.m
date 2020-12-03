function resultado = trapecioJQ(f, a, b, n)
  % Calcula el valor de una integral usando el metodo del trapecio
  % Input: f funcion a integrar
  %        a,b limites de integracion
  %        n cantidad de intervalos
  
  h = (b-a)/n;
  sumatoria = 0;
  
  for i=1:n-1
    x1 = a + i*h;
    sumatoria = sumatoria + double(f(x1));
  end
  
  resultado = h*(0.5*(double(f(a))+double(f(b)))+sumatoria);
end