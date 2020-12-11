function [tV, xV] = rungeKutta4JQ(f,a,b,x0,n)
    tV = zeros(n+1,1);
    tV(1) = a;
    
    xV = zeros(n+1,1);
    xV(1) = x0;
    
    h = (b-a)/n;
    
    for i=2:n+1
        k1 = h * double(f(tV(i-1),h)); % h*f(t,x).
        k2 = h * double(f(tV(i-1)+h/2,xV(i-1)+k1/2)); % h*f(t+h/2, x+k1/2).
        k3 = h * double(f(tV(i-1)+h/2,xV(i-1)+k2/2)); % h*f(t+h/2, x+k2/2).
        k4 = h * double(f(tV(i-1)+h,xV(i-1)+k3)); % h*f(t+h, x+k3).
        
        tV(i) = tV(i-1) + h; % t+h
        xV(i) = xV(i-1) + (k1+2*k2+2*k3+k4)/6;        
    end
end