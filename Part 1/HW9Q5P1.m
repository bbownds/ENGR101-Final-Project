% HW9A Q5P1
% Brock Bownds, Josue Meraz
% bbownds@hmc.edu & jmeraz@hmc.edu
% 11/12/25

load('HW9.mat');  % x


% The following are the constant values are for the 
T0 = 0.0939;
T1 = 0.05;
A = 5;

%Number of samples per period when signal is on
N1 = T1/.01;

%Number of samples in one period 
N0 = T0/.01;

%Duty cycle
d = N1/N0;

k = [1, 2, 3, 4];

% The DTFT coefficients 
coefficient = abs((A.*sin(k.*pi.*d)) ./ (N0.*sin((k.*pi)./(N0))));

for i = 1:length(k)
    fprintf('ak_%d = %.3f ', k(i), coefficient(i));
end

%% Q5P2

a0 = 3.238;

% New duty cycle
d1 = a0/A;

new_coeff = abs((A.*sin(k.*pi.*d1)) ./ (N0.*sin((k.*pi)./(N0))));

% for i = 1:length(k)
%     fprintf('ak_%d = %.3f ', k(i), new_coeff(i));
% end

%% Q5P3
% Compute the DFT of the 1000-sample segment
[X, f] = fdomain(X_sect, Fs);    % Fs = 1/Ts = 100 Hz

% Find positive frequency indices only
pos_idx = find(f > 0);

% Magnitude of X for positive frequencies
Xpos = abs(X(pos_idx));
fpos = f(pos_idx);

[~, fmental_ix] = max(Xpos);
Np1 = pos_idx(fmental_ix);     % This is the index in X corresponding to the fundamental

fprintf('Fundamental frequency peak index Np1 = %d (f = %.6f Hz)\n', ...
        Np1, f(Np1));

harmonic_mag = zeros(1,4);

for k = 1:4
    index_k = k * Np1;

    if index_k <= length(X)
        harmonic_mag(k) = abs(X(index_k));
    else
        harmonic_mag(k) = NaN;   % Out of range → no harmonic
    end

    fprintf('|X[%d*Np1]| = |X[%d]| = %.6f\n', ...
            k, index_k, harmonic_mag(k));
end

