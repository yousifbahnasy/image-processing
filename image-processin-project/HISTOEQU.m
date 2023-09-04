function [Hp] = HISTOEQU(a)
pixels=size(a,1)*size(a,2);

Hp=uint8(zeros(size(a,1),size(a,2)));
f=zeros(256,1);
pf=zeros(256,1);
pc=zeros(256,1);
c=zeros(256,1);
out=zeros(256,1);
n=1:256;

for i=1:size(a,1)
    for j=1:size(a,2)
        v=a(i,j);
        f(v+1)=f(v+1)+1;
        pf(v+1)=f(v+1)/pixels;
    end
end
sum=0;

for i=1:size(pf)
       sum=sum+f(i);
       c(i)=sum;
       pc(i)=c(i)/pixels;
       out(i)=round(pc(i)*255);
end

for i=1:size(a,1)
    for j=1:size(a,2)
            Hp(i,j)=out(a(i,j)+1);
    end
end
 figure,imhist(Hp);
        titel(' histogram')
end

