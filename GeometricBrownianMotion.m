% Parameters
S0 = 100;       % initial asset price
mu = 0.05;      % expected return
sigma = 0.2;    % volatility
T = 1;          % time horizon
dt = 0.01;      % time step
N = T/dt;       % number of time steps
nPaths = 1000;  % number of paths

% Set random number generator seed
rng(42);

% Initialize asset paths
S = zeros(N+1, nPaths);
S(1, :) = S0;

% Generate paths
for iPath = 1:nPaths
    for iStep = 1:N
        epsilon = randn;  % standard normal random number
        S(iStep+1, iPath) = S0 * exp((mu - 0.5 * sigma^2) * (iStep*dt) + sigma * sqrt(iStep*dt) * epsilon);
    end
end

% Compute statistics at T
S_T = S(end,:); % asset prices at time T
mean_S_T = mean(S_T); % mean asset price at time T
std_S_T = std(S_T); % standard deviation of asset prices at time T
median_S_T = median(S_T); % median asset price at time T
min_S_T = min(S_T); % minimum asset price at time T
max_S_T = max(S_T); % maximum asset price at time T

% Print results
fprintf('Mean asset price at T: %.2f\n', mean_S_T); % Mean asset price at T: 105.43
fprintf('Standard deviation of asset price at T: %.2f\n', std_S_T); % Standard deviation of asset price at T: 21.58
fprintf('Median asset price at T: %.2f\n', median_S_T); % Median asset price at T: 102.98
fprintf('Minimum asset price at T: %.2f\n', min_S_T); % Minimum asset price at T: 52.59
fprintf('Maximum asset price at T: %.2f\n', max_S_T); % Maximum asset price at T: 196.30

% Plot paths
figure;
plot(0:dt:T, S);
xlabel('Time');
ylabel('Asset Price');
title('Geometric Brownian Motion - Asset Price Simulation');
grid on;
