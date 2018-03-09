%Generates a sqrt(n)xsqrt(n) square Ising model with neighborhood
%of all nodes with taxicab distance at most 2
function [ beta ] = generateTwelve(n, T)
rtn = sqrt(n);
if floor(rtn) ~= rtn
    return
end
beta = zeros(n, n);

for i = 1:n
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
  %Down-right edges
  if mod(i, rtn) ~= 0 && (i + rtn <= n)
    beta(i, i+rtn+1) = T;
    beta(i+rtn+1, i) = T;
  end
  %Up-right edges
  if mod(i, rtn) ~= 1 &&(i + rtn <= n)
    beta(i, i+rtn-1) = T;
    beta(i+rtn-1, i) = T;
  end
  %Down-down edges
  if mod(i, rtn) ~= 0 && mod(i, rtn) ~= (rtn-1)
      beta(i, i+2) = T;
      beta(i+2, i) = T;
  end
  %Right-right-edges
  if (i + 2*rtn <= n)
    beta(i, i+2*rtn) = T;
    beta(i+2*rtn, i) = T;
  end
end

end

