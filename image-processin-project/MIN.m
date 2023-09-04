function [output] = MIN(a)
x=rand(size(a));
a(x(:)>0.95)=255;
sto=[];
[c b]=size(a);
output=zeros(c,b);
for i=2:c-1
    for j=2:b-1
        sto=[a(i-1,j-1),a(i-1,j),a(i-1,j+1),a(i,j-1),a(i,j)...
            ,a(i,j+1),a(i+1,j-1),a(i+1,j),a(i+1,j+1)];
        es=min(sto);
        output(i,j)=es;
        sto=[];
    end
end
output=uint8(output);
end






