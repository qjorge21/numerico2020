function [x, error] = normaFrobeniusEjer2JQ(A, b, x0, iter)
    c = size(A);
    dim1 = c(1);
    dim2 = c(2);
    
    % vecnorm retorna la norma euclidea de cada columna
    % por lo tanto hago la traspuesta antes
    N = vecnorm(transpose(A));
    
    % matriz identidad dim N
    I = eye(dim1);
    
    % controlo que sea diagonalmente dominante
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
        disp('Matriz diagonalmente dominante, converge mediante metodo normas frobenius');
    else
        disp('Matriz NO diagonalmente dominante, no se asegura convergencia mediante metodo normas frobenius');
    end
    
    % pre inicializo Mf para reducir tiempo de ejecucion
    Mf = zeros(dim1,dim2);
    % creacion matriz de norma de frobenius
    for i = 1 : dim1
        Mf(i,i) = A(i,i)/(N(i))^2;
    end
    
    % Calculo el "B" y "d" del metodo iterativo (de formula xnp = B*xn + d)
    % para reducir tiempo de ejecucion
    B = I-Mf*A;
    d = Mf*b;
    
    % inicializo mediante x0 y empiezo iteracion
    x = B*x0 + d;
    
    % empiezo iteracion
    for i = 2:iter
        x = B*x + d;
    end
    
    error = norm(A*x - b);
end