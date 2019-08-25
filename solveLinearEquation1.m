function out = solveLinearEquation1(in, wx, wy, lambda)  
    [h,w,c] = size(in);
    n = h*w;
    wx = wx(:);
    wy = wy(:);
    %% calculate the five-point positive definite Laplacian matrix
    ux = padarray(wx, h, 'pre'); ux = ux(1:end-h);
    uy = padarray(wy, 1, 'pre'); uy = uy(1:end-1);
    D = wx+ux+wy+uy; 
    B = spdiags([-wx, -wy],[-h,-1],n,n);
    L = B + B' + spdiags(D, 0, n, n);

    A = speye(n) + lambda*L; 
        F = ichol(A,struct('michol','on'));    
        out = in;
        for i=1:c
            tin = in(:,:,i);
            [tout, ~] = pcg(A, tin(:),0.01,100, F, F'); 
            out(:,:,i) = reshape(tout, h, w);
        end       
end