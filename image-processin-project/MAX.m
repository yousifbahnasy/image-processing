function [output] = MAX(a)

x=rand(size(a));
a(x(:)<0.3)=0;

sto=[];
[c b]=size(a);
output=zeros(c,b);
for i=2:c-1
    for j=2:b-1
        sto=[a(i-1,j-1),a(i-1,j),a(i-1,j+1),a(i,j-1),a(i,j)...
            ,a(i,j+1),a(i+1,j-1),a(i+1,j),a(i+1,j+1)];
        es=max(sto);
        output(i,j)=es;
        sto=[];
    end
end

output=(uint8(output));

end
