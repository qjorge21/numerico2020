function [T,bT] = triangulizarGaussJQ(A,b)
    % Ejercicio 2. Actividad 5
    % output T y bT luego de triangulizar por gauss jordan
    % input A y b del sistema
    c = size(A);
    N = c(1);
    
    for i = 1:N-1
        fila = A(i,:);
        pivot_fila = fila(i);
        
        for j = i+1:N
            fila_actual = A(j,:);
            pivot_fila_actual = fila_actual(i);
            
            multiplicador = -(pivot_fila_actual/pivot_fila);
            
            A(j,:) = fila_actual + (multiplicador .* fila);
            b(j) = b(j) + (multiplicador .* b(i));
        end
    end
    
    T = A;
    
    bT = b;
end