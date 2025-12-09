clc;clear;close all;
% Recreating a NbSi2 reference using Gaussians
Array=csvread('NbSi2 data.csv');
x=Array(:, 1);
y=Array(:, 2);
hold on
plot(x,y);
grid on;

x = 1:1:2420;
%create step function
s = 0.33*atan(x-2367)-1.1;
s(1:1:2420) = s(1:1:2420)+1.59;
%create main gaussian
g1 = myGauss(x,2369.6,1.4,2.6);
%create smaller gaussian
g2 = myGauss(x,2408,5.5,0.2);
g3 = myGauss(x,2372.7,2.8,2.75);

%add everything together
Nb_ref(2,:) = g1+g2+g3+s;
%apply slope to end
Nb_ref(1,:) = x;
Nb_ref = Nb_ref';

%plot(s)
%plot(g1)
%plot(g2)
%plot(g3)
%plot(Nb_ref(:,2))
xlim([2355 2414]);
ylim([-0.25 3.75])
%mu = mean
%sig = variance
%amp = amplitude
%x = x axis
function out = myGauss(x,mu,sig,amp)
out = amp*exp(-(((x-mu).^2)/(2*sig.^2)));
end