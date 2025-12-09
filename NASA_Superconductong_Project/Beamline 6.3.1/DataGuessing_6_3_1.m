% Use K edge if sample is almost 100% metal in the L edge
clc; clear; close all;
% Import Nb oxide reference spectra
Nb2O5=readtable('Nb2O5 Reference.xlsx','Sheet','Normalized');
o=Nb2O5.x;
p=Nb2O5.y;
NbO2=readtable('NbO2 Reference.xlsx','Sheet','Normalized');
k=NbO2.x;
l=NbO2.y;
NbO=readtable('NbO Reference.xlsx','Sheet','Normalized');
n=NbO.x;
m=NbO.y;
Data=readtable('SigScan63757.xlsx','Sheet','Normalized');
h=Data.x;
j=Data.y;

% Plot of all reference spectra
hold on
plot(o,p)
plot(k,l)
plot(n,m)
hold off
title('Powder Reference Spectra');
xlabel('Energy (eV)');
ylabel('Intensity');
grid on
legend('Nb2O5', 'NbO2', 'NbO');
xlim([499 601]);
ylim([-0.05 1.95]);

% The % of oxide relative to just the oxides
%Nb2O5
a=0.15;
%NbO2
b=0;
%NbO
c=0.85;

% Plot of the guessed combination of oxide reference spectra
figure
hold on
plot(o,p*a+l*b+m*c)
plot(h,j)
plot(o,p, '--')
plot(k,l, '--')
plot(n,m, '--')
hold off
legend('Guess','Data', 'Nb2O5', 'NbO2', 'NbO');
title('Data Fit Guess');
xlabel('Energy (eV)');
ylabel('Intensity');
grid on;
xlim([499 601]);
clc;

% Conclusions
% 'SigScan64090.xlsx','Sheet','Sheet1' 80% NbO 10% NbO2 10% Nb2O5 W3
% 'SigScan63757.xlsx','Sheet','Sheet1' 15% NbO2 85% NbO D4