function [ nImg ] = Stretching( a, newMin , newMax )
    [H, W, L] = size(a);
    nImg = zeros(H,W,L);
    a = double(a);
    nImg = double(nImg);
    for e = 1:L
        oldMax = max(max(a(:,:,e)));
        oldMin = min(min(a(:,:,e)));
        for i=1:H
            for j=1:W
                nImg(i,j,e)= (((a(i,j,e)-oldMin) / (oldMax-oldMin)) * (newMax-newMin))+newMin;
            end
        end
    end
    nImg = uint8(nImg);
    
end
