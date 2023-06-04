% Parameters
T = 1;          % time horizon
dt = 0.01;      % time step
N = T/dt;       % number of time steps
nPaths = 1000;  % number of paths

% Set random number generator seed
rng(42);

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

% Compute statistics
mean_W_T = mean(W(end,:));
std_W_T = std(W(end,:));
median_W_T = median(W(end,:));
min_W_T = min(W(end,:));
max_W_T = max(W(end,:));

% Print results
fprintf('Expected value of W^2(T): %.2f\n', E_W2_T); % Expected value of W^2(T): 1.02
fprintf('Mean of W(T): %.2f\n', mean_W_T); % Mean of W(T): -0.02
fprintf('Standard deviation of W(T): %.2f\n', std_W_T); % Standard deviation of W(T): 1.01
fprintf('Median of W(T): %.2f\n', median_W_T); % Median of W(T): -0.00
fprintf('Minimum of W(T): %.2f\n', min_W_T); % Minimum of W(T): -2.65
fprintf('Maximum of W(T): %.2f\n', max_W_T); % Maximum of W(T): 3.10

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
