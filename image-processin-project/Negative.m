function result = Negative(a)
    a = im2double(a);
    
    result = 1 - a;
    result = im2uint8(result);
end
