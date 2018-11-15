clear;clc;
% 生成过程 
phi1 = 0.2; 
mu1 = 5; 
sigma1 = 3; 
phi2 = 0.4; 
mu2 = 20; 
sigma2 = 5; 
phi3 = 0.4; 
mu3 = 50; 
sigma3 = 10; 
N = 10000; 
x = zeros(N,1); 
for i = 1 : N 
    rate = rand; 
    if rate <= phi1 
        x(i) = normrnd(mu1,sigma1); 
    elseif rate <= phi1+phi2 
        x(i) = normrnd(mu2,sigma2); 
    else x(i) = normrnd(mu3,sigma3); 
    end
end
figure(1); 
subplot(2,2,1); 
hist(x,1000); 
% 学习过程 
mu = [0, 5, 10]; 
sigma = [5, 5, 5]; 
phi = [0.33, 0.33, 0.34]; 
w = zeros(N,3); 
T = 50; 
mu_ = zeros(T+1,3); 
sigma_ = zeros(T+1,3); 
phi_ = zeros(T+1,3); 
mu_(1,:) = mu; 
sigma_(1,:) = sigma; 
phi_(1,:) = phi; 
for t = 1 : T 
    % Expectation 
    for k = 1 : 3 
        w(:,k) = phi(k)*normpdf(x,mu(k),sigma(k)); 
    end
    w = w./repmat(sum(w,2),[1 3]); 
    
    % Maximization 
    for k = 1 : 3 
        mu(k) = w(:,k)'*x / sum(w(:,k));
        sigma(k) = sqrt(w(:,k)'*((x-mu(k)).*(x-mu(k))) / sum(w(:,k))); 
        phi(k) = sum(w(:,k)) / N; 
    end
    mu_(t+1,:) = mu; 
    sigma_(t+1,:) = sigma; 
    phi_(t+1,:) = phi; 
end
figure(1);
subplot(2,2,2); 
plot(phi_); 
title('\phi'); 
figure(1); 
subplot(2,2,3); 
plot(mu_); 
title('\mu'); 
figure(1); 
subplot(2,2,4); 
plot(sigma_); 
title('\sigma');
