function result = Gray2Binary( a, T)
[H, W] = size(a);
result = zeros(H, W);
for i=1:H
  for j=1:W
if a(i, j) > T
    result(i, j) = 1;
else
    result(i, j) = 0;
end
end
end
result = logical(result);
end