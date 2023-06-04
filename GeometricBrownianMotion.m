% Parameters
S0 = 100;       % initial asset price
mu = 0.05;      % expected return
sigma = 0.2;    % volatility
T = 1;          % time horizon
dt = 0.01;      % time step
N = T/dt;       % number of time steps
nPaths = 1000;  % number of paths

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

% Plot paths
figure;
plot(0:dt:T, S);
xlabel('Time');
ylabel('Asset Price');
title('Geometric Brownian Motion - Asset Price Simulation');
