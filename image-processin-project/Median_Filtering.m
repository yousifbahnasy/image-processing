function [d] = Median_Filtering(a)

c=imnoise(a,'salt & pepper',0.02);
c=double(c);

[m n]=size(a);
for i=2:1:m-1
    for j=2:1:n-1
r=[c(i-1,j-1) c(i-1,j) c(i-1,j+1) c(i,j-1) c(i,j) c(i,j+1) c(i+1,j-1) c(i+1,j) c(i+1,j+1)];
   b=sort(r);
   d(i,j)= median(b);
   d=uint8(d);
  end
end
