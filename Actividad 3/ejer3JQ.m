function x = ejer3JQ(R, niter)
    x0 = 1;

    x = (1/2)*(x0 + (R/x0));
    
    for i = 1:niter
        x = (1/2)*(x + (R/x));
    end
    
    x = vpa(x);
end 