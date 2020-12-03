function [x, niter, iter] = newtonEjer2JQ(f, x0, tol)
    fp = diff(f);
    
    x = x0 - (f(x0)/fp(x0));
    
    n = 1;
    
    while abs(f(x)) > tol
        iter(n) = vpa(x);
        
        if f(x) == 0
            break
        else
            x = x - (f(x)/fp(x));
        end
        n = n + 1;
    end
    
    iter = iter';
    niter = n;
    x = vpa(x);
    
    
end