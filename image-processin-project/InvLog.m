
function s = InvLog(a, c)
    a = im2double(a);
    
    s = power(2.0, a/c) - 1;
    s = im2uint8(s);
end

