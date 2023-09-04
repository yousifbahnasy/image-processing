function [newimg] = Sharpening(a)

g=fspecial('average',[5,5]);
c=imfilter(a,g);
c=3*imsubtract(a,c);
newimg=imadd(a,c);
end
