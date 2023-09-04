function [nimag] = low_ideal_pass(a,D0)
[H,W,L]=size(a);
filter=zeros(H,W,L);
for k=1:H
    for j=1:W
        dis=sqrt((k-H/2).^2+(j-W/2).^2);
        
        if(dis<=D0)
            filter(k,j)=1;
        end
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

