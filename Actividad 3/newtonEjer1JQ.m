function [x, iter, error] = newtonEjer1JQ(f, x0, niter)
    fp = diff(f);

    iter = zeros(niter,1);
        
    x = x0 - (f(x0)/fp(x0));
    
    for i = 1:niter
        iter(i) = x;
        
        if f(x) == 0
            break
        else
            x = x - (f(x)/fp(x));
        end
    end
    
    error = abs(vpa(f(x)));
    x = vpa(x);
    
    
end