function [newimg] = MEANF1(a)
[H W L]=size(a);
newimg=zeros(H,W);
for i=1:H
    for j=1:W
        rmin=max(1,i-1);
        rmax=min(H,i+1);
        cmin=max(1,j-1);
        cmax=min(W,j+1);
        temp=a(rmin:rmax,cmin:cmax);
        newimg(i,j)=mean(temp(:));
    end
end
newimg=uint8(newimg);
end