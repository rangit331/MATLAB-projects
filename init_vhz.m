clear;              % Removes variables from the workspace
clc;                % Clear the screen
close all;          % Close the figures

%% Controller parameters
T_s = 125e-6;       % Sampling period, switching frequency f_sw = 1/(2*T_s)
psi_s_ref = 0.95;   % Stator-flux reference (or the V/Hz constant)