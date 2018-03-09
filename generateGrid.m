%Generates a sqrt(n)xsqrt(n) square Ising model with four neighborhood
function [ beta ] = generateGrid(n, T)
rtn = sqrt(n);
if floor(rtn) ~= rtn
    return
end
beta = sparse(n, n);

for i = 1:n
  %Only need to add right and down edges
  %Down edges
  if mod(i, rtn) ~= 0
    beta(i, i+1) = T;
    beta(i+1, i) = T;
  end
  %Right edges
  if (i + rtn <= n)
    beta(i, i+rtn) = T;
    beta(i+rtn, i) = T;
  end
end

end

