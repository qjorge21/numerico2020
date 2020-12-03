function [x, error] = jacobEjer1JQ(A, b, x0, iter)
    % defino D^-1 como Dinv
    D = inv(diag(diag(A)));
    
    % calculo tamaño de la matriz
    c = size(A);
    dim1 = c(1);
    dim2 = c(2);
    
    % defino matriz identidad
    I = eye(dim1);
    
    % controlo que la matriz sea diag dominante
    isDiagDom = true;
    
    for i = 1 : dim1
        sum = 0;
        for j = 1 : dim2
            if(i ~= j)
                sum = sum + abs(A(i,j));
            end
        end
        if(A(i,i)<=sum)
            isDiagDom = false;
            break;
        end
    end
    
    if(isDiagDom)
        disp('Matriz diagonalmente dominante, converge mediante metodo Jacob');
    else
        disp('Matriz NO diagonalmente dominante, no se asegura convergencia mediante metodo Jacob');
    end
    
    % Calculo el "B" y "d" del metodo iterativo (de formula xnp = B*xn + d)
    % Con esto reduzco tiempo de ejecucion
    B = I - D*A;
    d = D*b;
    % inicializo con x0
    x = B*x0 + d;

    % empiezo iteracion
    for i = 2:iter
        x = B*x + d;
    end
    
    error = norm(A*x - b);

end