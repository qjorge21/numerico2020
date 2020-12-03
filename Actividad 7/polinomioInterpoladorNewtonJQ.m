function [r] = polinomioInterpoladorNewtonJQ(f, X, a)
    % input: f es la funcion a interpolar con newton
    %        X vector de coeficientes de la particion
    %        x0 punto a evaluar el polinomio de Newton
    % output: r es el vector resultante de evaluar el polinomio de Newton P
    % en cada punto de a
    %         P es la expresion del polinomio interpolador de newton
    
    % Obtengo matriz de diferencias divididas de newton
    D = diferenciasDivididasJQ(X,f);
    
    % defino A como el vector con los coeficientes obtenidos de la matriz D
    % (primera fila)
    display('Los coeficientes de newton obtenidos son:')
    A = D(1,:)
    
    % Calculo N como el tamaño del vector X
    [N,M] = size(X);
    
    % Calculo tamR como el tamaño del vector a
    [tamR, colR] = size(a);
    
    
    for k = 1:tamR
        sumatoria = A(1);
    
        for i = 2:N
           producto = A(i);
           
           for j = 1:i-1
              producto = producto * (a(k) - X(j)); 
           end
           sumatoria = sumatoria + producto;
        end
        
        r(k) = sumatoria;
    end
    
    r = r';
end