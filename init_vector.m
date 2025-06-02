clear;              % Removes variables from the workspace
clc;                % Clear the screen
close all;          % Close the figures

%% Inverse-Gamma model parameters used in the control system
R_s = 3.7;          % Stator resistance
R_R = 2.1;          % Rotor resistance
L_M = 0.224;        % Magnetizing inductance
L_sigma = 0.021;    % Leakage inductance 
n_p = 2;            % Number of pole pairs
J = 0.016;          % Total moment of inertia

%% Control parameters
T_s = 125e-6;       % Sampling period, switching frequency f_sw = 1/(2*T_s)
alpha_c = 2*pi*600; % Current-control bandwidth
alpha_s = 2*pi*20;  % Speed-control bandwidth
tau_M_max = 20;     % Maximum torque
psi_R_ref = 0.9;    % Rotor-flux reference