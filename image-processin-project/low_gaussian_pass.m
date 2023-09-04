function [BG] = low_gaussian_pass(a,D0)
[H W L]=size(a);
filter=zeros(H,W,L);
for j=1:H
    for k=1:W
        dis=sqrt((j-(H/2)).^2+(k-(W/2)).^2);
        filter(j,k)=exp(-(dis).^2/(2*(D0).^2));
    end
end
f2=fft2(a);
f2=fftshift(f2);
rel=real(f2);
img=imag(f2);
nrel=filter.*rel;
nimg=filter.*img;
BG=nrel(:,:)+i*nimg(:,:);
BG=fftshift(BG);
BG=ifft2(BG);
BG=mat2gray(abs(BG));

end