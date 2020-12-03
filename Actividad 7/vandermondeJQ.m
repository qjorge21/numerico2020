function [A] = vandermondeJQ(X,f)
    % input: f es la funcion a interpolar con vandermonde
    %        X vector de coeficientes de la particion
    % output: A es la matriz de coeficientes del polinomio de vandermonde
    
    % obtengo N
    [N,M] = size(X);
    
    % inicializo matriz V
    V = zeros(N);
    
    % uso a "i" como indice para llenar matriz V
    for i = 1:N
        V(:,i) = X.^(i-1);
    end
    
    
    % defino vector columna resultante de evaluar f(x) sobre el vector X
    F = double(f(X));
    
    % Resuelvo sistema para obtener coefecicientes de A de vandermonde
    A = V \ F;

    A = A';
end