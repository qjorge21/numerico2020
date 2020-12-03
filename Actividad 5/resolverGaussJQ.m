function [x] = resolverGaussJQ(A,b)
    % Ejercicio 1. Actividad 5
    % output x: aproximacion
    % input A,b: A matriz triangular superior; b vector resultante
    % Resuelve un sistema Ax = b, con A ya triangular superior
    c = size(A);
    N = c(1);
    
    vector_soluciones = zeros(1,N);
    
    i = N;
    
    while i >= 1
        vector_fila = A(i,:);

       
        if i == N
            % si es ultima fila, resuelvo directamente la ecuacion
            pivot = vector_fila(i);
            
            soluc = b(i)/pivot;
            
            vector_soluciones(i) = soluc;
        else
            % logica si no es ultima fila
           
            % guardo pivot
            pivot = vector_fila(i);
            
            % reemplazo solucion anterior
            % aca esta el error
            for k= i+1:N
                vector_fila(k) = vector_fila(k) .* vector_soluciones(k);
            end
            
            j = i + 1;
            
            sumatoria = 0;
            
            while j <= N
                sumatoria = sumatoria + vector_fila(j);
                j = j + 1;
            end
            
            soluc = (b(i) - sumatoria) / pivot;
            
            vector_soluciones(i) = soluc;

        end
        
        i= i -1;
    end
            
    x = vector_soluciones;    
    
end