function resultados = sumasRiemmanJQ(f, a, b, n)
  % Calcula el valor de una integral mediante la suma de Riemann a
  % izquierda y derecha
  % Input: f funcion a integrar
  %        a,b limites de integracion
  %        n cantidad de intervalos
  
  % defino h
  h = (b-a)/n;
  
  % Almaceno valores de f evaluado en los x
  fx = [];
  for i=0:n
    xi = a + i*h;
    fx(i+1) = double(f(xi));
  end  
  
  % Calculo suma a izquierda
  sri = 0;
  for i=1:n
    sri = sri + fx(i);
  end
  sri = sri * h;
  
  % Calculo suma a derecha
  srd = 0;
  for i=2:n+1
    srd = srd + fx(i);
  end
  srd = srd * h;
  
  resultados = [sri, srd];
end
