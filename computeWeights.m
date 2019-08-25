function [wx, wy] = computeWeights(s,sigma,sigma1,t1)
    if (~exist('t1','var'))
      t1 = 0;
    end
    
    eps = 0.0001;
    
    dxo = diff(s,1,2);
    dxo = padarray(dxo, [0 1], 'post');
    dyo = diff(s,1,1);
    dyo = padarray(dyo, [1 0], 'post');
    
    wxo = max(max(abs(dxo),[],3),eps).^(-1);
    wyo = max(max(abs(dyo),[],3),eps).^(-1);
    if (t1==1)
        wx = wxo;
        wy = wyo; 
    else
        sg = gauss_filter(s,sigma1);
        dx = diff(sg,1,2);
        dx = padarray(dx, [0 1], 'post');
        dy = diff(sg,1,1);
        dy = padarray(dy, [1 0], 'post');
        

        wx = max(max((exp((dx.*dx)./(2*sigma))),[],3),eps).^(-1);
        wy = max(max((exp((dy.*dy)./(2*sigma))),[],3),eps).^(-1);

        wx = wxo.*(wx);
        wy = wyo.*(wy);
    end
    wx(:,end) = 0;
    wy(end,:) = 0;
   
end