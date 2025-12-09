clc;clear;close all;
% Recreating the NbO reference spectra using Gaussians
rawTable = readtable('NbO Reference Data.xlsx','Sheet','Sheet1');
x = rawTable.C;
y = rawTable.B;
hold on
plot(x,y)

h=0.8;
w=1.1;

x = 1:1:2400;
%create step function
s = 0.18*atan(x-2367.6)+0.27;
%create main gaussian
g1 = myGauss(x,2371.2,0.4*w,7/h);
%create smaller gaussian
g2 = myGauss(x,2374.2,1.5*w,3.2/h);
g3 = myGauss(x,2380.9,1.6*w,0.7/h);
g4 = myGauss(x,2387.8,w,0.5/h);
g5 = myGauss(x,2396,1.5*w,0.35/h);

%add everything together
Nb_ref(2,:) = g1+g2+g3+g4+g5+s;

Nb_ref(1,:) = x;
Nb_ref = Nb_ref';
%plot(s)
%plot(g1)
%plot(g2)
%plot(g3)
%plot(g4)
%plot(g5)
plot(Nb_ref(:,2))

xlim([2350 2400])
ylim([-0.1 7.4])
title('NbO Reference')
xlabel('Energy (eV)')
ylabel('Intensity')
box on
grid on
legend('Data','Fit')

%mu = mean
%sig = variance
%amp = amplitude
%x = x axis
function out = myGauss(x,mu,sig,amp)
out = amp*exp(-(((x-mu).^2)/(2*sig.^2)));
end