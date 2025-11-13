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

%% This is our K's that we want to check for
k = [1, 2, 3, 4];

%The DTFT coefficients 
coefficient = abs( (A.*sin(k.*pi.*d)) ./ (N0.*sin( (k.*pi)./(N0) )));

fprintf('ak = %.4f ',coefficient)
