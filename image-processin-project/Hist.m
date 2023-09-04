function  [ histarr ] = Hist(a)
    [H, W, L]=size(a);
    histarr=zeros(256,L);
    for e = 1:L
        for i = 1:H
            for j = 1:W
                histarr(a(i,j,e)+1,e)=histarr(a(i,j,e)+1,e)+1;
            end
        end
    end
    for i=1:L
        figure, bar(histarr(:,i));
        titel('original histogram')
    end
end
