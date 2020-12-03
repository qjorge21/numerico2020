function [Q] = gramSchmidtJQ(A)
    tam = size(A);
    % filas
    N = tam(1);
    % columnas
    M = tam(2);
    
    % defino matriz de ceros inicial Q
    Q = zeros(N,M);
    
    a1 = A(:,1);
    
    Q(:,1) = a1 / norm(a1);
        
    for i = 2:M
       v = A(:,i);
       
       for k = 1:i-1
          v = v - (Q(:,k)' * A(:,i)) * Q(:,k); 
       end
       
       Q(:,i) = v / norm(v);
    end
end