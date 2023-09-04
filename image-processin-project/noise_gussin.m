function [new_img] = noise_gussin(a,v,m)
a=double(a);
[h w l] = size(a);


for i=1:255
   nom_of_pixel=round(((exp(-((i-m)^2/(2*v*v))))/(sqrt(2*3.14*v*v)))*w*h);
   for x=1:nom_of_pixel
       row=ceil(rand(1,1)*h);
       colom=ceil(rand(1,1)*w);
       a(row,colom)=a(row,colom)+i;
   
   
   end 

end
for k=1:1
    mn=min(min(a(:,:,k)));
    mx=max(min(a(:,:,k)));
    new_img(:,:,k)=((a(:,:,k)-mn)/(mx-mn))*255;

end   
new_img=uint8(new_img);

end