function [ X ] = generateEvilGrid(n, p)
%Choose each of the six edges with probability p
%Mirrors the current value
rtn = sqrt(n);
if floor(rtn) ~= rtn
    return
end
X = 2*randi(2, n, 1) - 3;

for i = 1:n
    %Down edges
    if mod(i, rtn) ~= 0
        if rand < p
            X(i+1) = X(i);
        end
    end
    %Down-right edges
    if mod(i, rtn) ~= 0 && (i + rtn <= n)  
        if rand < p
            X(i+rtn+1) = X(i);
        end
    end
    %Right edges
    if (i + rtn <= n)
        if rand < p
            X(i+rtn) = X(i);
        end
    end
    %Up-right edges
    if mod(i, rtn) ~= 1 &&(i + rtn <= n)
        if rand < p
            X(i+rtn-1) = X(i);
        end
    end
    %Down-down edges
      if mod(i, rtn) ~= 0 && mod(i, rtn) ~= (rtn-1)
          if rand < p
              X(i+2) = X(i);
          end
      end        
    %Right-right edges
      if (i + 2*rtn <= n)
          if rand < p
              X(i+2*rtn) = X(i);
          end
      end
end


end
