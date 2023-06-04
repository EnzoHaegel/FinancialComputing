% Parameters
T = 1;          % time horizon
dt = 0.01;      % time step
N = T/dt;       % number of time steps
nPaths = 1000;  % number of paths

% Initialize W and W^2
W = zeros(N+1, nPaths);
W2 = zeros(N+1, nPaths);

% Generate paths
for iPath = 1:nPaths
    for iStep = 1:N
        dW = sqrt(dt)*randn;    % increment for Wiener process
        W(iStep+1, iPath) = W(iStep, iPath) + dW;
        W2(iStep+1, iPath) = W(iStep+1, iPath)^2;
    end
end

% Compute expected value of W^2(T)
E_W2_T = mean(W2(end,:));

fprintf('Expected value of W^2(T): %.2f\n', E_W2_T);
fprintf('T: %.2f\n', T);

% Plot paths
figure;
subplot(2,1,1);
plot(0:dt:T, W);
xlabel('Time');
ylabel('W(t)');
title('Simulation of Wiener process W(t)');

subplot(2,1,2);
plot(0:dt:T, W2);
xlabel('Time');
ylabel('W^2(t)');
title('Simulation of W^2(t)');
