%Computes the maximum pseudolikelihood estimator for common node and edge
%potentials (a,b) for a bitstring X on graph with adjacency matrix E
function [a, b] = mpleGraphField(X, E)
    n = length(X);
    alphaCands = (-1:0.001:1);
    betaCands = (-1:0.001:1);
    fns = zeros(length(betaCands), length(alphaCands));
        
    for i = 1:n
        neighbors = E(:, i);
        localSum = dot(X, neighbors);
        [w, z] = meshgrid(alphaCands, localSum*betaCands);
        localMat = w+z;
        fns = fns + X(i)*localMat - log(exp(localMat) + exp(-localMat));
    end
    [bindex, aindex] = find(fns == max(max(fns)));
    size(aindex)
    a = alphaCands(aindex(1));
    b = betaCands(bindex(1));
end
