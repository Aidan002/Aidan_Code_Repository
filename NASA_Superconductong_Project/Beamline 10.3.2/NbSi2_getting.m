clc; close all; clear;
% Trying to extract the oxides from this heated sample to get a Nb metal
% spectra

% Importing data
Heated=readtable('3W2L_Heated_Spot1_10lines_030_XAS_processed.xlsx', 'Sheet', 'Sheet1', 'PreserveVariableNames', true);
k=Heated.x;
l=Heated.y;
Unheated=readtable('6W2L_Spot2_10lines_039_XAS_processed.xlsx','Sheet','Sheet1', 'PreserveVariableNames', true);
o=Unheated.x;
p=Unheated.y;

% Plotting and guessing the oxide subtraction
hold on
% Should be 72% NbSi2 and oxides and 28% metal
plot(k,1.4*(l-0.28*p));
plot(k,l);
plot(o,p);
hold off
legend('Subtracted', 'Heated', 'Unheated');
xlabel('Energy (eV)');
ylabel('Intensity');
grid on
xlim([2322 2427.5]);
