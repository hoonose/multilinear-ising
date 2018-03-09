%Precomputes MCMC stats for grid ising model
n = 40^2;
Ctwelve = generateTwelve(n, 1);

ht = 0.5*log(1 + sqrt(2));
betaCands = (-0.02:0.005:ht)';
m = length(betaCands);

numTrials = 100;
Y = zeros(m, numTrials);
Z = zeros(1, numTrials);
X = zeros(n, 1);

for i = 1:m
    tic
    i
    beta = generateGrid(n, betaCands(i));
    for j = 1:numTrials
        X = ising(n, beta, 2.5*n*log(n));
        Z(j) = sum(sum(triu(times(X * X', Ctwelve))));
    end
    Y(i, :) = sort(Z);
    toc
end
