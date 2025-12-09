clc;clear;close all;
% Normalizing the NbO reference
data=readtable('NbO Reference.xlsx','Sheet','NbO Reference');
x=data.X;
y=data.Y;

% Normalization equation guess
q=(1:221)';
%e=(1799:2501)';
w=0.00004.*q-(0.228-0.219);
%w=-0.00000001*q.^2+0.00002*q-0.02;
%r=0.000000000004*e.^2-1000*e+1800000;

% Plotting the pre-edge subtraction
figure
hold on
plot(x(1:221),w)
%plot(x(1799:2501),e)
plot(x,y-0.477)
legend('Subtraction 1','Data')
xlabel('Energy (eV)');
ylabel('Intensity');
hold off
y(1:221)=y(1:221)+w;
%y(1799:2501)=y(1799:2501)+r;

% Plotting the normalized spectra
figure
plot(x,10.87*(y-0.42))
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