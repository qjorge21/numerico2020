function [x, error] = gaussSeidelEjer2JQ(A, b, x0, iter)
    c = size(A);
    
    tam = c(1);
    
    % calculo matrices L D U
    % matriz diagonal
    D = diag(diag(A));
    % obtengo matriz diagonal inferior
    L = tril(A);
    % obtengo matriz diagonal superior 
    U = triu(A);
    
    % elimino elementos de la diagonal de L y U
    for i = 1:tam
        L(i,i) = 0;
        U(i,i) = 0;
    end
    
    % Calculo el "B" del metodo iterativo (de formula xnp = B*xn + d)
    B = -(inv(D + L))*U;
    % calculo radio espectral de B
    radioEsp = max(abs(eig(B)));
    
    if(radioEsp < 1)
        disp('Radio espectral menor a uno, converge mediante metodo Gauss Seidel')
    else
        disp('Radio espectral mayor o igual a uno, no se asegura convergencia mediante metodo Gauss Seidel')
    end
    
    % calculo "d" de la formula xnp = B*xn + d para no hacerlo en cada
    % iteracion
    d = inv(D + L)*b;
    
    % reutilizo B para reducir el tiempo de ejecucion
    % inicializo mediante x0
    x = B*x0 + d;
    
    for i= 2:iter
        x = B*x + d;
    end
    
    error = norm(A*x - b);
end