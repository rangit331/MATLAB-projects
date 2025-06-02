%% Grid voltage

figure(1);
subplot(3, 2, 1); 
plot(u_g_abc.time, u_g_abc.data(:,1), 'r','linewidth', 1.5); hold on; grid on;
plot(u_g_abc.time, u_g_abc.data(:,2), 'g','linewidth', 1.5); 
plot(u_g_abc.time, u_g_abc.data(:,3), 'b','linewidth', 1.5);

legend('u_g_a','u_g_b', 'u_g_c','FontSize',12);
xlabel('Time (s)');
ylabel('Grid voltage (V)');
%% Power
subplot (3,2,2);
plot(p_g_ref.time, p_g_ref.data/1000, 'b'); hold on; grid on;
plot(q_g_ref.time, q_g_ref.data/1000, 'r'); hold on; grid on;
p_g = 3/2 * u_gN * i_cd;
q_g = - 3/2 * u_gN * i_cq;

plot(p_g.time, p_g.data/1000, 'b','linewidth', 2);
plot(q_g.time, q_g.data/1000, 'r','linewidth', 2);

legend('p_g_ref', 'q_g_ref', 'p_g', 'q_g','FontSize',12);
xlabel('Time (s)');
ylabel('Power (KW)');

%% Current abc

subplot (3,2,3);
plot(i_c_abc.time, i_c_abc.data(:,1), 'r'); hold on; grid on;
plot(i_c_abc.time, i_c_abc.data(:,2), 'g'); 
plot(i_c_abc.time, i_c_abc.data(:,3), 'b');

legend('ica','icb', 'icc','FontSize',12);
xlabel('Time (s)');
ylabel('Converter current (A)');
%% current dq
subplot (3,2,4);
plot(i_cd_ref.time, i_cd_ref.data, 'b'); hold on; grid on;
plot(i_cq_ref.time, i_cq_ref.data, 'r'); hold on; grid on;

plot(i_cd.time, i_cd.data, 'b','linewidth', 2);
plot(i_cq.time, i_cq.data, 'r','linewidth', 2);

legend('i_cd,ref', 'i_cq,ref', 'i_cd', 'i_cq','FontSize',12);
xlabel('Time (s)');
ylabel('Converter current (A)');

%% theta_g
theta_ge_deg = theta_ge *(180/pi);
theta_g_cap_deg = theta_g_cap * (180/pi); 
subplot(3,2,5);
plot(theta_ge_deg.time, theta_ge_deg.data,'r','linewidth', 2);hold on; grid on;
plot(theta_ge_deg.time, theta_ge_deg.data, 'b','linewidth', 1.15); hold on; grid on;

legend('\theta', '\theta_pk','FontSize',12);
xlabel('Time (s)');
ylabel('Angle (deg)');

%% U_dc
%u_c = u_cs * exp(-1j * theta_ge);
subplot (3,2,6)

u_dc1 = u_dc/sqrt(3);
u_dc2 = (2/3) * (u_dc);

plot(u_c_ref_lim.time, u_c_ref_lim.data, 'b','linewidth',2); hold on; grid on;
plot(u_dc1.time, u_dc1.data, 'r--','linewidth',2);
plot(u_dc2.time, u_dc2.data, 'r:','lineWidth',2);
legend('uc','udc/sqrt(3)', '(2/3)udc','FontSize',12);
xlabel('Time(s)');
ylabel('Converter Voltage (V)');
ylim([200 450]);
