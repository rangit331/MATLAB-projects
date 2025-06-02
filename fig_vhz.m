%% Speed and torque
figure(1);
subplot(2, 1, 1); 
plot(w_M.time, 2*w_M.data, 'b'); hold on; grid on;
stairs(w_s_ref.time, w_s_ref.data,'r');
legend('Electrical rotor speed', 'Stator frequency', ...
    'Location', 'SouthEast');
ylabel('Angular speed (rad/s)');

subplot(2, 1, 2);
plot(tau_M.time, tau_M.data, 'b'); hold on; grid on; 
plot(tau_L.time, tau_L.data, 'r');  
legend('Electromagnetic torque', 'Load torque', 'Location', 'SouthEast');
xlabel('Time (s)'); ylabel('Torque (Nm)');

%% Voltages and currents
figure(2);
subplot(2, 1, 1);
plot(u_ss.time, real(u_ss.data), 'b'); hold on; grid on; 
stairs(u_ss_ref_lim.time, real(u_ss_ref_lim.data), 'r');
axis([0.9 0.925 -400 400]); % Zoom
legend('Actual (a-phase)', 'Reference');
ylabel('Phase-to-neutral voltage (V)');

subplot(2,1,2);
% Actual currents
plot(i_s_abc.time, i_s_abc.data(:,1), 'r'); hold on; grid on;
plot(i_s_abc.time, i_s_abc.data(:,2), 'g'); 
plot(i_s_abc.time, i_s_abc.data(:,3), 'b'); 
% Synchronously sampled currents
stairs(i_s_abc_k.time,i_s_abc_k.data, 'k'); 
axis([0.9 0.925 -10 10]); 
legend('a', 'b', 'c');
xlabel('Time (s)'); ylabel('Phase currents (A)');

%% PWM details
figure(3);
subplot(2, 1, 1); 
stairs(d_abc.time, d_abc.data(:,1), 'r','linewidth', 1); hold on; grid on;
stairs(d_abc.time, d_abc.data(:,2), 'g','linewidth', 2);
stairs(d_abc.time, d_abc.data(:,3), 'b','linewidth', 3);
plot(tri.time, tri.data,'k--');  
axis([0.9 0.9+4*T_s 0 1]); 
legend('a', 'b', 'c'); 
ylabel('Duty ratios');

subplot(2, 1, 2); 
plot(u_abc.time, u_abc.data(:,1), 'r', 'linewidth', 1); hold on; grid on;  
plot(u_abc.time, u_abc.data(:,2), 'g', 'linewidth', 2);  
plot(u_abc.time, u_abc.data(:,3), 'b', 'linewidth', 3);  
axis([0.9 0.9+4*T_s 0 600]); 
legend('a', 'b', 'c'); 
xlabel('Time (s)'); ylabel('Pole voltages (V)');