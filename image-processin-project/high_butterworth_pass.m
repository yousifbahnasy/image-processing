function [nimag] = high_butterworth_pass(a,D0,n)
[H,W,L]=size(a);
filter=zeros(H,W,L);
for k=1:H
    for j=1:W
        dis=sqrt((k-H/2).^2+(j-W/2).^2);
        filter(k,j)=(1/(1+(D0/dis)^2*n));
    end
end
fi=fft2(a);
fi=fftshift(fi);
reall=real(fi);
imagin=imag(fi);
nreall=filter.*reall;
nimagin=filter.*imagin;
nimag=nreall(:,:)+i*nimagin(:,:);
nimag=fftshift(nimag);
nimag=ifft2(nimag);
nimag=mat2gray(abs(nimag));

end