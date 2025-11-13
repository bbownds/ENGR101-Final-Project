% HW9A Q2
% Brock Bownds, Josue Meraz
% bbownds@hmc.edu & jmeraz@hmc.edu
% 11/12/25

load('HW9.mat');  % x

Ts = 0.01;
Fs = 1/Ts;  % Sampling frequency

% Choose 1000 consecutive  points
x_sect = x(1:1000);
k = -500:499;

[X, f] = fdomain(x_sect,Fs);

% Plot the frequency domain representation
figure;
plot(f, abs(X), 'LineWidth', 1.2);
xlabel('$f (Hz)$', 'Interpreter','latex', FontSize=13);
ylabel('$|X(f)|$', 'Interpreter','latex', FontSize=13);
title('$|X|$ vs. $f$', 'Interpreter','latex', FontSize=14);
grid on;

% Plot against the DFT index k
figure;
plot(k, abs(X), 'LineWidth', 1.2, 'Color','r');
xlabel('$k$ (DFT Index)', 'Interpreter','latex', FontSize=13);
ylabel('$|X(k)|$', 'Interpreter','latex', FontSize=13);
title('$|X|$ vs. $k$', 'Interpreter','latex', FontSize=14);
grid on;
