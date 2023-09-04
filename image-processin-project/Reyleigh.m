function [ res ] = Reyleigh( a,c,b )
a=double(a);
[h,w,l]=size(a);
for i=1:255
    num_of_noise=round(((exp(-(((i-c)^2)/b))*(i-c)*2) /b)*w*h);
    for j=1:num_of_noise
        row=ceil(rand(1,1)*h);
        column=ceil(rand(1,1)*w);
        for m=1:l
        a(row,column,m)=a(row,column,m)+i;
        end
    end
end
for k=1:l
    mn=min(min(a(:,:,k)));
    mx=max(max(a(:,:,k)));
    res(:,:,k)=((a(:,:,k)-mn)/(mx-mn))*255;
end
res=uint8(res);
imshow(res);    
end
