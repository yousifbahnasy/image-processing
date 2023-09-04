function [u] = Midpoint_filter(a)
a=im2double(rgb2gray(a));
paddedimage2=padarray(a,[2,2]);
[r,c]=size(paddedimage2);
for i=2:r-1
    for j=2:c-1
        out=[paddedimage2(i-1,j-1),paddedimage2(i-1,j),paddedimage2(i-1,j+1),paddedimage2(i,j-1),paddedimage2(i,j),paddedimage2(i,j+1),paddedimage2(i-1,j),paddedimage2(i+1,j-1),paddedimage2(i+1,j),paddedimage2(i+1,j+1)];
       d=max(out);
       b=min(out);
        u(i,j)=(d+b)/2;
    end
end

end
