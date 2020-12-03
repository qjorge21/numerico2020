function [x] = gaussJordanJQ(A,b)
    % triangulizo la matriz A,b
    [T,bT] = triangulizarGaussJQ(A,b);
    % resuelvo el sistema
    x = resolverGaussJQ(T,bT);
end