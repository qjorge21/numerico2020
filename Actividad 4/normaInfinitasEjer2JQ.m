function [x, error] = normaInfinitasEjer2JQ(A, b, x0, iter)
    c = size(A);
    dim1 = c(1);
    dim2 = c(2);
    
    % matriz identidad dim N
    I = eye(dim1);
    
    % controlo que sea diagonalmente dominante
    isDiagDom = true;
    
    % pre inicializo suma para mejorar velocidad ejecucion 
    suma = zeros(1,dim1);
    
    % ahora si almaceno el i-esimo valor de la sumatoria para cada i
    % para luego usarlo para calcular lo g i-esimos
    for i = 1 : dim1
        suma(i) = 0;
        for j = 1 : dim2
            if(i ~= j)
                suma(i) = suma(i) + abs(A(i,j));
            end
        end
        if(A(i,i)<=suma(i))
            isDiagDom = false;
            break;
        end
    end
    
    if(isDiagDom)
        disp('Matriz diagonalmente dominante, converge mediante metodo normas infinitas');
    else
        disp('Matriz NO diagonalmente dominante, no se asegura convergencia mediante metodo normas infinitas');
    end
    
    gi = zeros(1,dim1);
    
    %calculos de los g i-esimos
    for i = 1 : dim1
        gi(i) = A(i,i) - suma(i);
    end
    
    % calculo sg como el menor de los gi
    sg = min(gi);
    
    % calculo norma infinita de A
    Ninf = norm(A,'inf');
    
    % calculo alfa sub cero
    alfa0 = 2 / (Ninf + sg);
    
    % Calculo el "B" y "d" del metodo iterativo (de formula xnp = B*xn + d)
    % para reducir tiempo de ejecucion
    B = I-alfa0*A;
    d = alfa0*b;
    
    % inicializo mediante x0 y empiezo iteracion
    x = B*x0 + d;
    
    % empiezo iteracion
    for i = 2:iter
        x = B*x + d;
    end
    
    error = norm(A*x - b);
   
    
end