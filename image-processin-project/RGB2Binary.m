function result = RGB2Binary(a, T)
a = double(a);
r = a(:, :, 1);
g = a(:, :, 2); 
b = a(:, :, 3);
gray = (r + g + b) / 3;
[H, W] = size(gray);
result = zeros(H, W);
for i=1:H
for j=1:W
if gray(i, j) > T 
    result(i, j) = 1;
else
    result(i, j) = 0;
end
end
end
result = logical(result);
end