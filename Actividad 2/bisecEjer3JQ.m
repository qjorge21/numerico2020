function [r, c, N, iter] = bisecEjer3JQ(f,intervalo,tol)
    a = intervalo(1);
    b = intervalo(2);
    
    t = ceil((log(b-a) - log(2*tol))/log(2));
    
    iter = zeros(t,1);
    
    c = (a+b)/2;
    
    iter(1) = c;
    
    N=2;
        
    while (b-a)/2 > tol
        if f(c) == 0
            break
        elseif f(a)*f(c) < 0
            b = c;
        else
            a = c;
        end
      
        c = (a+b)/2;
        
        iter(N) = c;
        
        N = N +1;
    end
    
    r = f(c);
end