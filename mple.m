function b = mple(X)
    %high temperature for the grid
    ht = 0.5*log(1 + sqrt(2));
    betaCands = (-0.02:0.005:ht)';
    %betaCands = (-1:0.005:1)';
    fns = zeros(length(betaCands), 1);
    
    n = length(X);
    rtn = sqrt(n);
    if floor(rtn) ~= rtn
        return
    end
    
    for i = 1:n
        localSum = 0;
        %Down edges
        if mod(i, rtn) ~= 0
            localSum = localSum + X(i+1);
        end
        %Right edges
        if (i + rtn <= n)
            localSum = localSum + X(i+rtn);
        end
        %Up edges
        if mod(i, rtn) ~= 1
            localSum = localSum + X(i-1);
        end
        %Left edges
        if (i - rtn >= 1)
            localSum = localSum + X(i-rtn);
        end
        fns = fns + betaCands*X(i)*localSum - log(exp(betaCands*localSum) + exp(-betaCands*localSum));
    end
    extreme = max(abs(betaCands(fns == max(fns))));
    b = betaCands((abs(betaCands) == extreme) & (fns == max(fns)));
end