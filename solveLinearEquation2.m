function dst = solveLinearEquation2(s, ir, uvx, uvy, alphabet,qx,qy,et)
    if (~exist('qx','var'))
       qx = 0;
       et = 0;
    end
    if (~exist('qy','var'))
       qy = 0;
       et = 0;
    end
    [h, w] = size(s);
    hw = h * w;
    %% calculate the five-point positive definite Laplacian matrix
    uvx = uvx(:);
    uvy = uvy(:);
    ux = padarray(uvx, h, 'pre'); ux = ux(1:end-h);
    uy = padarray(uvy, 1, 'pre'); uy = uy(1:end-1);
    D = uvx+ux+uvy+uy;
    T = spdiags([-uvx, -uvy],[-h,-1],hw,hw);
    if (et==0)
        Q = T;
    else
        qx = qx(:);
        qy = qy(:);
        q1x = padarray(qx, h, 'pre'); q1x = q1x(1:end-h);
        q1y = padarray(qy, 1, 'pre'); q1y = q1y(1:end-1);
        Dn = qx+q1x+qy+q1y;
        Tn = spdiags([-qx, -qy],[-h,-1],hw,hw);
        Q =  Tn + Tn' + spdiags(Dn, 0, hw, hw);                 
    end
    
    MN = T + T' + spdiags(D, 0, hw, hw);                   
    ir2 = ir.^2;                                        
    ir2 = spdiags(ir2(:),0,hw,hw); 

    DEN = ir2 + alphabet * MN + et * Q;  
    NUM = ir.*s;                           
    %% solve
    L = ichol(DEN,struct('michol','on'));  
    [dst,~] = pcg(DEN, NUM(:), 0.01, 100, L, L'); 
    dst = reshape(dst, h, w);
end