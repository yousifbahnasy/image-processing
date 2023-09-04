function [nimg] = WEIGHT(a)
maskw=[1 2 1;2 4 2;1 2 1] *(1/16);

nimg=imfilter(a,maskw,'replicate');

imshow(nimg);
end

