function [new_img] = saltandpepper(a,ps,pp)
[ H W L]=size(a);
num_of_salt=(ps*W*H);
num_of_pepr=(pp*W*H);
for i=1:num_of_salt
    row=ceil(rand(1,1)*H);
    colom=ceil(rand(1,1)*W);
    a(row,colom)=255;
end
for i=1:num_of_pepr
    row=ceil(rand(1,1)*H);
    colom=ceil(rand(1,1)*W);
    a(row,colom)=0;
end
new_img=a;
new_img=uint8(new_img);

end