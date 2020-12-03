function [autovalor, autovector] = metodoPotenciaJQ(A, x0, niter)
    % Metodo de la potencia
    % Calcula el auto valor y auto vector dominante de la matriz A
    % dado un x0 inicial
    x = x0;
    
    for i = 1:niter
        xT = A * x;
        x = xT / norm(xT);
    end
    
    autovalor = max(A * x);
    
    autovector = x;
end