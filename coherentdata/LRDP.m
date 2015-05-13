function L_star = LRDP(X)

[m,n] = size(X);
A_check = zeros(m,n);
n1 = max(m,n);
n2 = min(m,n);
r0_hat = 0;

% X(:,4) = ones(m,1);
% X = imnoise(X,'Gaussian',0,1);
lambda = 1/sqrt(n1);
L0_hat = inexact_alm_rpca(X,lambda);
[U0,S0,V0] = svd(L0_hat);
for i = 1:n2
    if S0(i,i)>0.001*S0(1,1)
        r0_hat = r0_hat+1;
    else
        S0(i,i) = 0;
    end
end
L0_check = U0 * S0 * V0';
for i = 1:n
    normi = norm(L0_check(:,i),2);
    A_check(:,i) = L0_check(:,i)/normi;
end

Z_star = inexact_alm_lrr_l21(X,A_check,lambda);
L_star = A_check * Z_star;
end