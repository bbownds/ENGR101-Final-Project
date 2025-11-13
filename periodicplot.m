% Plotting HW9.mat File
% Brock B, bbownds@hmc.edu
% Josue M, jmeraz@hmc.edu

load('HW9.mat');  % loads variable x
n = length(x);
centered_x = x - mean(x);  % optional: center the data itself
indices = (1:n) - n/2;     % centers x-axis around 0
plot(indices, x, 'o-', LineWidth=1.5);
xlabel('$t$',Interpreter='latex', FontSize=13);
ylabel('$x(t)$', Interpreter='latex',FontSize=13);
title('Periodic Pulse Train','Interpreter','latex','FontSize',15);
grid on;
xlim([-10 10]);
ylim([-1 6]);

hold on;
yline(mean_value, '--r', sprintf('Mean = %.3f', mean_value), ...
    'LabelHorizontalAlignment', 'left', 'Interpreter', 'latex');
hold off;