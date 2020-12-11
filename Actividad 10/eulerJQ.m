function [tV, xV] = eulerJQ(f,a,b,x0,n)
    tV = zeros(n+1,1);
    tV(1) = a;
    
    xV = zeros(n+1,1);
    xV(1) = x0;
    
    h = (b-a)/n;
    
    for i=2:n+1
        xV(i) = xV(i-1) + h* double(f(tV(i-1),xV(i-1)));
        tV(i) = tV(i-1) + h;
    end
end