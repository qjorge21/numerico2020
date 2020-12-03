function D = diferenciasDivididasJQ(X, f)
    % input: X vector de valores x0,x1,...,xn a interpolar
    %        f funcion a evaluar en los puntos
    % output: D matriz diagonal superior resultado del proceso
    %         interpolador de Newton
    % Calcula la matriz de diferencias divididas del proceso de Newton
    
    % N numero de filas, M columnas (se supone que es 1)
    [N, M] = size(X);
    % inicializo matriz D
    D = zeros(N);
    
    %lleno columna 1 de D con los valores de f evaluados en X
    for i = 1:N
        D(i,1) = vpa(f(X(i)));
        %D(i,1) = f(i);
    end
        
    % contador que me es util en la iteracion
    k = 1;
    % lleno el resto de columnas de D
    for i = 2:N
        for j = 1:N-k
            D(j,i) = (D(j+1,i-1) - D(j,i-1)) / (X(j+k)-X(j));
        end
        k = k + 1;
    end
end