clc; clear; close all;
% Load your spectrum data
data=readtable('SiO2 Reference.xlsx','Sheet','Reference With Nb', 'PreserveVariableNames', true);
energy=data.x;
mu=data.y;
%set pre edge to y=0 by subtracting
mu=mu-0.3513-0.1261+0.498-0.016-0.007;
hold on
plot(energy,mu);


% Step 2: Define the Post-Edge Region
edge_energy=538.5;
post_edge_width=600-edge_energy; % Width of the post-edge region (in eV), adjust as needed
post_edge_region=(energy>edge_energy);

% Step 3: Fit a Polynomial to the Post-Edge Region
degree=1;
p=polyfit(energy(post_edge_region),mu(post_edge_region),degree);
post_edge_fit=polyval(p,energy);

% Step 6: Normalize the Spectrum
mu_normalized=mu./post_edge_fit;

% Step 7: Plot Normalized Data
plot(energy,mu_normalized);
legend('Original','Normalized');
xlabel('Energy (eV)');
ylabel('Normalized Absorption');
title('Normalized Data');
grid on

% Step 8: open mu_normalized and copy the values to wherever