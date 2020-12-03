function [x, iter] = secanteEjer4JQ(f, x0, x1, niter, tol)
    iter = zeros(niter,1);
   
    x = x1 - ((x1-x0)/(f(x1)-f(x0)))*f(x1);
    
    xant = x1;
    
    iter(1) = x;
    
    i = 2;
    
    while i <= niter
        if(abs(f(x)) <= tol)
            disp('Se detiene el loop porque se alcanzo la tolerancia')
            x = vpa(x);
            return
        else
            aux = xant;
            xant = x;
            x = x - ((x-aux)/(f(x)-f(aux)))*f(x);
            iter(i) = x;
        end
        i = i + 1;
    end
    
    disp('Se detiene el loop porque se alcanzo el maximo de iteraciones')
    x = vpa(x);
            
end