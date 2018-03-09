%Plots a bitstring X, which corresponds to a sqrt(n)xsqrt(n) grid
function gridIsingPlot(X)
nsq = length(X);
n = sqrt(nsq);
R = zeros(n,n);
B = zeros(n,n);

for i = 1:length(X)
if X(i) == 1
  R(i) = 1;
else
  B(i) = 1;
end
end
out = zeros(n,n,3);
out(:,:,1) = R;
out(:,:,3) = B;
imshow(out)
