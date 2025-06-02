%% Speed and torque
figure(1);
subplot(2, 1, 1); 
plot(w_M.time, n_p*w_M.data, 'b', 'linewidth', 2); hold on; grid on; 
stairs(w_M_ref.time, n_p*w_M_ref.data, 'r'); 
legend('Rotor speed', 'Reference', 'Location','SouthEast');
ylabel('Electr. angular speed (rad/s)');

subplot(2,1,2);
plot(tau_M.time, tau_M.data, 'b', 'linewidth', 2); hold on; grid on;   
stairs(tau_M_ref.time, tau_M_ref.data, 'r'); 
axis([0 1 -10 30]); % Zoom
legend('Electromagnetic torque', 'Reference', 'Location', 'SouthEast');
xlabel('Time (s)'); ylabel('Torque (Nm)');

%% Currents
figure(2);
subplot(2, 1, 1);
stairs(i_s.time, real(i_s.data), 'b', 'linewidth', 2); hold on; grid on;
stairs(i_s_ref.time, real(i_s_ref.data), 'r');  
stairs(i_s.time, imag(i_s.data), 'b', 'linewidth', 2);  
stairs(i_s_ref.time, imag(i_s_ref.data), 'r');  
legend('Sampled (d-axis)', 'Reference (d-axis)', ...
    'Sampled (q-axis)', 'Reference (q-axis)',...
    'Location', 'SouthEast');
ylabel('Currents in dq coordinates (A)');

subplot(2,1,2);
plot(i_s_abc.time, i_s_abc.data(:,1), 'r'); hold on; grid on;
plot(i_s_abc.time, i_s_abc.data(:,2), 'g');  
plot(i_s_abc.time, i_s_abc.data(:,3), 'b');  
legend('a-phase', 'b-phase', 'c-phase');
xlabel('Time (s)'); ylabel('Actual phase currents (A)');

%% Flux linkages
figure(3);
subplot(2, 1, 1);
plot(psi_Rs.time, abs(psi_Rs.data), 'b', 'linewidth', 2); hold on; grid on;
stairs(psi_R_est.time, psi_R_est.data, 'r');  
legend('Actual', 'Estimate', 'Location', 'SouthEast');
ylabel('Rotor flux (Vs)');

subplot(2,1,2);
plot(psi_Rs.time, angle(psi_Rs.data), 'b', 'linewidth', 2); 
hold on; grid on;
stairs(theta_s_est.time, theta_s_est.data,'r');
legend('Actual', 'Estimate');
xlabel('Time (s)'); ylabel('Rotor flux angle (rad)');