function tabla_romberg = rombergJQ(f, a, b, N)
    % Calcula la tabla con aproximaciones de Romber de una integral
    % Input: f funcion a integrar
    %        a,b limites de integracion
    %        n tamaño tabla romberg
    % Output: tabla con aproximaciones de n x n
    
    % esto es dado que los arreglos o vectores en matlab arrancan en 1 y el
    % algoritmo de romber arranca desde 0
    N = N + 1;

    tabla_romberg = zeros(4);
    
    % elemento 0,0
    tabla_romberg(1,1) = ((double(f(a))+double(f(b)))/2)*(b-a);
    
    % elementos primer columna 
    for i = 2:N
        h = (b-a)/2^(i-1);
        sum = 0;
        
        for k=1:2^(i-2)
            sum = sum + double(f(a+(2*k-1)*h));
        end
        tabla_romberg(i,1) = (tabla_romberg(i-1,1)/2) + sum*h;
    end
    
    % columnas restantes
    for j=2:N
        for i=j:N
            tabla_romberg(i,j) = tabla_romberg(i,j-1) + (tabla_romberg(i,j-1)-tabla_romberg(i-1,j-1))/(4^(j-1)-1);
        end
    end
end