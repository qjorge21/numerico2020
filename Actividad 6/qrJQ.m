function [D] = qrJQ(A, niter)
    for i = 1:niter
       [Q,R] = qr(A);
       A = R*Q;
    end
    
    D = A;
end