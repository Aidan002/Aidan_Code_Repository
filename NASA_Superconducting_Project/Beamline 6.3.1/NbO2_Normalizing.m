clc;clear;close all;
% Normalizing the NbO2 reference
data=readtable('NbO2 Reference.xlsx','Sheet','NbO2 Reference');
x=data.X;
y=data.Y;

% Normalization guess
q=(1:208)';
%e=(1799:2501)';
w=0.00004.*q-(0.3603-0.3518);
%w=-0.00000001*q.^2+0.00002*q-0.02;
%r=0.000000000004*e.^2-1000*e+1800000;

% Plotting the guess and pre-edge subtraction
figure
hold on
plot(x(1:208),w)
%plot(x(1799:2501),e)
plot(x,y)
legend('Subtraction 1','Data')
xlabel('Energy (eV)');
ylabel('Intensity');
grid on
hold off
y(1:208)=y(1:208)+w;
%y(1799:2501)=y(1799:2501)+r;

% Plotting the guess
figure
plot(x,16.33*(y-0.351))
title('Normalized')
grid on;
xlabel('Energy (eV)');
ylabel('Intensity');

% Making the guess exportable
ax=gca; 
h=findobj(gca,'Type','line');
o=h.XData;
p=h.YData;
o=o.'
p=p.'
clc;