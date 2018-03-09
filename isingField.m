%Sample according to the Glauber dynamics, with an n dimensional Ising
%model, external field alpha, adjacency matrix beta, 
%and numIters iterations
function [ X ] = isingField(n, alpha, beta, numIters)
%Generate a random starting vector
X = 2*randi(2, n, 1) - 3;
%iterate as many times as desired
for l = 1:numIters
    %Choose a random node to sample
    j = randi(n,1,1);
    betaJ = beta(:,j);
    %Compute the local parameter
    gamma = dot(X, betaJ);
    p = exp(alpha(j) + gamma)/(exp(alpha(j) + gamma) + exp(-alpha(j) - gamma));
    if (rand < p)
        X(j) = 1;
    else
        X(j) = -1;
    end       
end
end

