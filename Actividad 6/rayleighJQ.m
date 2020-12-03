function [autovector, autovalor] = rayleighJQ(A, x0, niter)
    
    c = size(A);
    N = c(1);
    
    I = eye(N,N);
    
    x = x0;
    
    
    for i = 1:niter                
        rq = (x'*A*x) / (x'*x);
        
        xT = (A-rq*I)\x;
        
        x = xT / max(xT);
    end
    
    autovector = x;
    autovalor = rq;
end