function [r, c, error, iter] = bisecEjer1JQ(f,intervalo,N)
    a = intervalo(1);
    b= intervalo(2);

    iter = zeros(N,1);
    
    c = (a+b)/2;
    
    iter(1) = c;
    
    i=2;
    
    while i<=N
        if f(c)==0
            break
        elseif f(a)*f(c) < 0
            b = c;
        else
            a = c;
        end
      
        c = (a+b)/2;
        
        iter(i) = c;
        
        i = i +1;
    end
    
    r = f(c);
    
    error = (b-a) / 2;
end