function [new_img] = noise_uniform(a,c,b)
a=double(a);
[H W L]=size(a);
num_of_pixel=round((1/b-c)*W*H);
for i=1:255
    for x=1:num_of_pixel
        row=ceil(rand(1,1)*H);
        colom=ceil(rand(1,1)*W);
        a(row,colom)=a(row,colom)+i;
    end
end
for k=1:1
    mn=min(min(a(:,:,k)));
    mx=max(max(a(:,:,k)));
    new_img(:,:,k)=((a(:,:,k)-mn)/(mx-mn))*255;
end
new_img=uint8(new_img);
end