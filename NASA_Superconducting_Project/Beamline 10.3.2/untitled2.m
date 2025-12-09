clc; close all; clear;
% Plotting some data together
Data=readtable('5GW2_70_10lines_050_051_052_processed_avg.xlsx', 'Sheet', 'Smoothed');
h=Data.x;
j=Data.y;
Data2=readtable('2_XAS_processed.xlsx','Sheet','Smoothed');
n=Data2.x;
m=Data2.y;
Data3=readtable('8_XAS_processed.xlsx','Sheet','Smoothed');
u=Data3.x;
i=Data3.y;
figure
hold on
plot(h,j)
plot(n,m)
plot(u,i)
hold off
title('D4, GW2 70, GW2 500')
legend('GW2 70', 'D4', 'GW2 500');
xlabel('Energy (eV)');
ylabel('Intensity');
grid on
axis([2321.5 2427.7 -0.05 5.1])
clc;