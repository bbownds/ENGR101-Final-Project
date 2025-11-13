% HW9A Q1
% Brock Bownds, Josue Meraz
% bbownds@hmc.edu & jmeraz@hmc.edu
% 11/12/25

load('HW9.mat');  % loads variable x

% Provided values
Ts = 0.01;
Fs = 1/Ts;
t = (0:length(x)-1) * Ts;  % Create time vector based on sampling time & length of x
% Plot CT Signal

plot(t, x, 'LineWidth',1.5);               
xlabel('$t$',Interpreter='latex', FontSize=13);
ylabel('$x(t)$', Interpreter='latex',FontSize=13);
title('Sampled Periodic Pulse Train $x(t)$','Interpreter','latex','FontSize',15);
grid on;
xlim([0 2]); ylim([-1 6]);
hold on;

% Compute the mean
mean_value = mean(x);

% Plot mean line
h_mean = yline(mean_value, '--r', 'LineWidth', 1.5);
legend({'$x(t)$', sprintf('Mean = %.3f', mean_value)}, ...
    'Interpreter', 'latex', 'Location', 'northoutside', 'Orientation', 'horizontal');
hold off;

% Computing T0
thres = (max(x) + min(x)) / 2;
up = x > thres;          

r_edge = find(diff(up) == 1);
t_edges = r_edge * Ts;

% Compute differences to estimate period
T0_estimates = diff(t_edges);         % differences between rising edges
T0 = mean(T0_estimates);              % average period

fprintf('T0 = %.4f seconds\n', T0);