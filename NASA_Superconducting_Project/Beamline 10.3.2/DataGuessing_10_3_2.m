% Sample spectra oxide combination guessing
clc; clear; close all;
% Importing the references
Nb2O5=readtable('Nb2O5Pdr_spot3_10lines_026_XAS_processed.xlsx','Sheet','Smoothed');
o=Nb2O5.x;
p=Nb2O5.y;
NbO2=readtable('NbO2pdr_spot3_008_XAS_processed.xlsx','Sheet','Smoothed');
k=NbO2.x;
l=NbO2.y;
NbO=readtable('NbOPdr_spot5_10lines_020_XAS_processed.xlsx','Sheet','Smoothed');
n=NbO.x;
m=NbO.y;
Nb=readtable('Nbpieceoffoilthin_fluo_calibrated_001_XAS_processed','Sheet','Smoothed');
u=Nb.x;
i=Nb.y;
NewNb=readtable('6W2L_Spot2_10lines_039_XAS_processed.xlsx','Sheet','Smoothed');
t=NewNb.x;
y=NewNb.y;

% Importing the samples
% Data=readtable('2_XAS_processed.xlsx','Sheet','Smoothed');
% Data=readtable('6W2L_Spot2_10lines_039_XAS_processed.xlsx','Sheet','Smoothed');
% Data=readtable('5GW2_70_10lines_050_051_052_processed_avg.xlsx', 'Sheet', 'Smoothed');
% Data=readtable('8_XAS_processed.xlsx', 'Sheet', 'Smoothed');
Data=readtable('12W1a_spot2_10lines048_XAS_processed.xlsx', 'Sheet', 'Smoothed');
h=Data.x;
j=Data.y;

% Plotting the derivatives of all the spectras
hold on
plot(u,gradient(i,u))
plot(t,gradient(y,t))
plot(o,gradient(p,o))
plot(k,gradient(l,k))
plot(n,gradient(m,n))
plot(h,gradient(j,h))
hold off
title('Powder Reference Spectra Derivatives');
xlabel('Energy (eV)');
ylabel('Intensity');
grid on;
legend('Metal (Foil)', 'Metal (W2L)', 'Nb2O5', 'NbO2', 'NbO','Data');
axis([2321 2428 -1.1 1.5])

% Plotting the reference spectra
figure
hold on
% Foil
% plot(u,i)
% W2L
plot(t,y)
plot(o,p)
plot(k,l)
plot(n,m)
hold off
title('Powder Reference Spectra');
xlabel('Energy (eV)');
ylabel('Intensity');
grid on;
legend('Metal', 'Nb2O5', 'NbO2', 'NbO');
axis([2321 2428 -0.05 3.2])

% Guessing linear combinations of the spectra
% Metal
a=1;
% Nb2O5
b=0;
% NbO2
c=0;
% NbO
d=0;

% Plotting the guess with the sample
figure
hold on
% Actual metal
plot(o,gradient(i,u)*a+gradient(p,o)*b+gradient(l,k)*c+gradient(m,n)*d)
% W2L as metal
plot(o,gradient(y,t)*a+gradient(p,o)*b+gradient(l,k)*c+gradient(m,n)*d)
plot(h,gradient(j,h))
%plot(u,i, '--')
%plot(o,p, '--')
%plot(k,l, '--')
%plot(n,m, '--')
%plot(t,y, '--')
hold off
legend('Foil Guess', 'W2L Guess', 'Data');
% legend('D4', 'Foil', 'Nb2O5', 'NbO2', 'NbO', 'W2L');
title('Derivative Data Guess');
xlabel('Energy (eV)');
ylabel('Intensity');
grid on;
axis([2322 2427.5 -1.1 2]);

% Plotting the 2 possible metal references
figure
hold on
% Actual metal
plot(o,i*a+p*b+l*c+m*d)
% W2L as metal
plot(o,y*a+p*b+l*c+m*d)
plot(h,j)
%plot(u,i, '--')
%plot(o,p, '--')
%plot(k,l, '--')
%plot(n,m, '--')
%plot(t,y, '--')
hold off
legend('Foil Guess', 'W2L Guess', 'Data');
% legend('D4', 'Foil', 'Nb2O5', 'NbO2', 'NbO', 'W2L');
title('Data Guess');
xlabel('Energy (eV)');
ylabel('Intensity');
grid on;
axis([2322 2427.5 -0.1 5.2]);
clc;

% '2_XAS_processed.xlsx','Sheet','Sheet1' D4 #62 15% Nb2O5 15% NbO2 (foil)
% 60% Metal 40% Nb2O5 (W2L)

% '6W2L_Spot2_10lines_039_XAS_processed.xlsx','Sheet','Sheet1' 100% Metal

% '5GW2_70_10lines_050_051_052_processed_avg.xlsx', 'Sheet', 'Smoothed' 100%
% Metal

% '8_XAS_processed.xlsx', 'Sheet', 'Smoothed' 100% Metal GW2 500

% '12W1a_spot2_10lines048_XAS_processed.xlsx', 'Sheet', 'Sheet1' 100% Metal