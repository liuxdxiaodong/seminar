close all
clear
clc

m = 20;
n = 100;
X = zeros(m,n);
n1 = max(m,n);
n2 = min(m,n);
r0_hat = 0;
lambda = 1/sqrt(n1);
L0_hat = inexact_alm_rpca(X,lambda);
[U0,S0,V0] = svd(L0_hat);
for i = 1:n2
    if S(i,i)>0.001*S(1,1)
        r0_hat = r0_hat+1;
    end
end



