clc;clear;close all;
% Normalizing the Nb2O5 reference
data=readtable('Nb2O5 Reference.xlsx','Sheet','Nb2O5 Reference');
x=data.x;
y=data.y;

% Normalization equation guess
q=(1:220)';
%e=(1799:2501)';
w=0.00001.*q-(0.48-0.478);
%w=-0.00000001*q.^2+0.00002*q-0.02;
%r=0.000000000004*e.^2-1000*e+1800000;

% Plot guessed normalization
figure
hold on
plot(x(1:220),w)
%plot(x(1799:2501),e)
plot(x,y-0.477)
legend('Subtraction 1','Data')
xlabel('Energy (eV)');
ylabel('Intensity');
grid on
hold off
y(1:220)=y(1:220)+w;
%y(1799:2501)=y(1799:2501)+r;

% Plot normalized spectra
figure
plot(x,8.333*(y-0.478))
title('Normalized')
grid on;
xlabel('Energy (eV)');
ylabel('Intensity');

% Take normalized spectra and make it exportable
ax=gca; 
h=findobj(gca,'Type','line');
o=h.XData;
p=h.YData;
o=o.'
p=p.'
clc;