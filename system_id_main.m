%% Heating System Identification using Real Data
% Developed by Mohammad Feyzi
% This script implements Subspace (4SID) and ARMAX identification.

clc; clear; close all;

%% 1. Load and Preprocess Data
% Assuming data is in 'thermal_data.mat' with columns: [Time, Input, Output]
load('thermal_data.mat'); 
z = iddata(output, input, 2); % 2-second sampling time

% Remove means and trends to focus on dynamics
z_pre = detrend(z);

%% 2. Subspace Identification (4SID)
% Estimating a state-space model (n=2 based on PDF results)
sys_ss = n4sid(z_pre, 2); 

%% 3. ARMAX Identification
% Estimating an ARMAX model [na nb nc nk]
sys_armax = armax(z_pre, [2 2 2 1]);

%% 4. Model Validation
% Compare model outputs with measured data
figure;
compare(z_pre, sys_ss, sys_armax);
title('Model Fitness Comparison');

% Residual Analysis (Whiteness test)
figure;
resid(z_pre, sys_ss);
title('Residual Analysis for Subspace Model');

% Stability Check (Pole-Zero Map)
figure;
pzmap(sys_ss);
title('Pole-Zero Map (Subspace Model)');
grid on;

%% 5. Export Results
fprintf('Subspace Model Fit: %.2f%%\n', sys_ss.Report.Fit.FitPercent);
fprintf('ARMAX Model Fit: %.2f%%\n', sys_armax.Report.Fit.FitPercent);
