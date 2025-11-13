% HW9A Q3
% Brock Bownds, Josue Meraz
% bbownds@hmc.edu & jmeraz@hmc.edu
% 11/12/25

load('HW9.mat');  % x

Ts = 0.01;
Fs = 1/Ts;  % Sampling frequency

% Choose 1000 consecutive points
x_sect = x(1:1000);
k = -500:499;

[X, f] = fdomain(x_sect, Fs);

figure;
plot(f, abs(X), 'LineWidth', 1.2);
xlabel('$f$ (Hz)', 'Interpreter','latex', 'FontSize',13);
ylabel('$|X(f)|$', 'Interpreter','latex', 'FontSize',13);
title('$|X|$ vs. $f$', 'Interpreter','latex', 'FontSize',14);
grid on;

[maxValue, maxIndex] = max(abs(X));

positive_idx = find(f > 0);               % only positive frequencies
abs_pos = abs(X(positive_idx));           % magnitudes at those indices

[ nextMaxValue, rel_idx ] = max(abs_pos); % location within positive index list
nextMaxIndex = positive_idx(rel_idx);     % convert to absolute index

fprintf('Maximum Value: %.4f at index %d (f = %.4f Hz)\n', ...
        maxValue, maxIndex, f(maxIndex));

fprintf('Highest positive-frequency peak: %.4f at f = %.4f Hz (index %d)\n', ...
        nextMaxValue, f(nextMaxIndex), nextMaxIndex);

%% ---------- Annotate the peak on the plot ----------
hold on;
plot(f(nextMaxIndex), nextMaxValue, 'ro', 'MarkerSize', 8);
text(f(nextMaxIndex), nextMaxValue, ...
     sprintf('  %.4f', nextMaxValue), ...
     'VerticalAlignment','bottom', ...
     'HorizontalAlignment','left', ...
     'FontSize',10);
hold off;
