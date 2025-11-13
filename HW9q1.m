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