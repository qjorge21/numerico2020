function aproximacion = simpsonJQ(f, a, b, N)
    % Calcula la aproximacion de una integral mediante el metodo de Simpson
    % Input: f funcion a integrar
    %        a,b limites de integracion
    %        n cantidad de particiones
    % Output: valor que aproxima la integral
    
    h = (b-a)/N;
    
    % Calculo suma 1
    sum1 = 0;
    
    for i = 1:(N/2)
        sum1 = sum1 + double(f(a + (2*i - 1)*h));
    end

    
    % Calculo suma 1
    sum2 = 0;
    
    for i = 1:((N/2)-1)
        sum2 = sum2 + double(f(a + 2*i*h));
    end
    
    aproximacion = (h/3) * (double(f(a)) + double(f(b)) + 4*sum1 + 2*sum2);
end