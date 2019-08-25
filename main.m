function [ I, R] = main( src, alpha, beta,lambda,delta, vareps, sigma12, sigma2,K)
    if (~exist('alpha','var'))	% alpha
       alpha = 0.01;
    end
    if (~exist('beta','var'))	% beta 
       beta = 0.0001;
    end
    
    if (~exist('lambda','var'))	% beta 
       lambda = 0.05*100;
    end
    
    if (~exist('delta','var'))      % delta
       delta = 0.001;
    end

    if (~exist('vareps','var'))      % vareps 
       vareps = 0.01;
    end

    if (~exist('sigma12','var'))      % sigma12 
       sigma12 = 1;
    end

    if (~exist('sigma2','var'))      % sigma2
        sigma2 = 1;
    end
    
    if (~exist('K','var'))      % K -- maximum iterations
       K = 20;
    end
    
    hsv = rgb2hsv(src);
    I = hsv(:,:,3);
    S = src;      
    I1 = max(max(S(:,:,1),S(:,:,2)),S(:,:,3));% I'
    B = GTV(I1,lambda,sigma12,sigma2,1,1); % use GTV to obtian B
    R = ones(size(S));                                         
    for iter = 1:K
        
        preI=I;
        Rhsv = rgb2hsv(R);
        preR=Rhsv(:,:,3);
        
        [wx, wy] = computeWeights( I, sigma12, sigma2);% compute wx, wy using Eq. (16)
        I = solveLinearEquation1( B, wx, wy, alpha);%  update I_k using Eq. (23)
        eplisonI = norm(I-preI, 'fro')/norm(preI, 'fro');% iteration error      

        for  ch = 1:3
        R(:,:,ch) = S(:,:,ch)./I;
        [ux,uy] = computeWeights(R(:,:,ch),sigma12,sigma2);% compute wx, wy using Eq. (16)
        [qx,qy] = computeWeights(R(:,:,ch),0,0,1);% compute wx, wy using Eq. (17)
        R(:,:,ch)= solveLinearEquation2 (S(:,:,ch), I, ux, uy, beta, qx, qy, delta);%  update I_k using Eq. (21)   
        end
        
        RGB_Rhsv = rgb2hsv(R);
        
        eplisonR = norm(RGB_Rhsv(:,:,3)-preR, 'fro')/norm(preR, 'fro');% iteration error 
        
        fprintf('Iterations #%d : eplisonI = %f; eplisonR = %f\n', iter, eplisonI, eplisonR);
        if(eplisonI<vareps||eplisonR<vareps||iter==K)
            fprintf('Iterations = %d\n', iter);
            break;
        end
    end
end