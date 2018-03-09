%Generates Figure 2 of the paper
load('precomputedSynthetic.mat')
n = 40^2;
rtn = sqrt(n);
Ctwelve = generateTwelve(n, 1);
ht = 0.5*log(1 + sqrt(2));
betaCands = (-0.02:0.005:ht);
ht = betaCands(end);
params = logspace(-3, 0, 75);
numTrials = 500;
numMples = zeros(length(params), 1);
numStats = zeros(length(params), 1);

for j = 1:length(params)
    for i = 1:numTrials
        S = generateEvilGrid(n, params(j));
        bhat = mple(S);
        if bhat >= ht
            numMples(j) = numMples(j) + 1;
            numStats(j) = numStats(j) + 1;
            continue;
        end
        bhatIndex = find(betaCands == bhat);
        h = Y(bhatIndex, :);

        Z = sum(sum(triu(times(S * S', Ctwelve))));
        lt = length(find(h < Z));
        p = min(lt, 100 - lt)/100;
        if p <= 0.05
            numStats(j) = numStats(j) + 1;
        end
    end
end
semilogx(params, numStats/numTrials, params, numMples/numTrials);