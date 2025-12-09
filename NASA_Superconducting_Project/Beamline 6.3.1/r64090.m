clc;clear;close all;
% Normalizing a sample spectra
Data=readtable('SigScan64090.xlsx','Sheet','SigScan64090');
x=Data.X;
y=Data.Y;

% Normalization equation guess
q=(1:1711)';
e=(1799:2501)';
w=0.00004.*q-0.068669;
%w=-0.00000001*q.^2+0.00002*q-0.02;
%r=0.000000000004*e.^2-1000*e+1800000;

% Plotting the pre and post-edge subtractions
figure
hold on
plot(x(1:1711),w)
%plot(x(1799:2501),e)
plot(x,y)
legend('Subtraction 1','Subtraction 2','Data')
xlabel('Energy (eV)');
ylabel('Intensity');
hold off
y(1:1711) = y(1:1711)+w;
%y(1799:2501)=y(1799:2501)+r;

% Plotting the normalized spectra
figure
plot(x,16.66*(y-0.393))
title('Normalized')
grid on;
xlabel('Energy (eV)');
ylabel('Intensity');

% Makig the normalized spectra exportable
ax=gca; 
h=findobj(gca,'Type','line');
o=h.XData;
p=h.YData;
o=o.'
p=p.'

clc;