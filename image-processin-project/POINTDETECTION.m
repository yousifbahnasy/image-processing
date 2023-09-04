function [newimg] = POINTDETECTION(a)
g=[0 1 0;1 -4 1;0 1 0];
newimg=imfilter(a,g);
end