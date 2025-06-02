%% Clear memory etc.
clear;                  % Remove variables from the workspace
clc;                    % Clear screen
close all;              % Close all figures

%% Controller parameters
% System parameters
L_f = 10e-3;            % Inductance of the filter inductor
C = 1e-3;               % DC-bus capacitance
w_g = 2*pi*50;          % Grid angular frequency
u_gN = sqrt(2/3)*400;   % Nominal grid voltage (phase-to-neutral, peak value)

% PWM and current controller
f_sw = 8e3;             % Switching frequency
T_s = 1/(2*f_sw);       % Sampling period
alpha_c = 2*pi*400;     % Current-control bandwidth

% PLL
w0_pll = 2*pi*20;       % Undamped natural frequency

% DC-bus voltage controller (needed in Section 3)
w0_dc = 2*pi*30;        % DC-bus voltage controller: undamped natural frequency
p_max = 10e3;           % Maximum limit for the power reference