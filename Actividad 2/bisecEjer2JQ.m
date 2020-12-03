function [r, c, N, iter] = bisecEjer2JQ(f,intervalo,tol)
    a = intervalo(1);
    b= intervalo(2);

    N = ceil((log(b-a) - log(2*tol))/log(2));
    
    iter = zeros(N,1);
    
    c = (a+b)/2;
    
    iter(1) = c;
            
    for i = 2:N
        if f(c) == 0
            break
        elseif f(a)*f(c) < 0
            b = c;
        else
            a = c;
        end
      
        c = (a+b)/2;
        
        iter(i) = c;
    end
    
    r = f(c);
end