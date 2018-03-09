%Generate Figure 1 of the paper
n = 200^2;
S1 = generateEvilGrid(n, 0.04);
figure(1)
gridIsingPlot(S1);

bhat1 = mple(S1)
beta2 = generateGrid(n, bhat1);
S2 = ising(n, beta2, 2.5*n*log(n));
figure(2)
gridIsingPlot(S2)