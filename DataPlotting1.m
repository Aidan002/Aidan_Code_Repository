clc; clear; close all;

Data=readtable('Data1.xlsx','sheet','Data1');

Angle=Data.Angle;
DivergenceHalfAngle=Data.DivergenceHalfAngle;

Angle_2=Angle(1:7);
DivergenceHalfAngle_2=DivergenceHalfAngle(1:7);

AxialPositionMM_40=Data.AxialPositionMM_40;
AxialPositionMM_30=Data.AxialPositionMM_30;
AxialPositionMM_20=Data.AxialPositionMM_20;
AxialPositionMM_10=Data.AxialPositionMM_10;
AxialPositionMM0=Data.AxialPositionMM0;
AxialPositionMM10=Data.AxialPositionMM10;
AxialPositionMM20=Data.AxialPositionMM20;
AxialPositionMM30=Data.AxialPositionMM30;
AxialPositionMM40=Data.AxialPositionMM40;

BeamWidth_40=Data.BeamWidth_40;
BeamWidth_30=Data.BeamWidth_30;
BeamWidth_20=Data.BeamWidth_20;
BeamWidth_10=Data.BeamWidth_10;
BeamWidth0=Data.BeamWidth0;
BeamWidth10=Data.BeamWidth10;
BeamWidth20=Data.BeamWidth20;
BeamWidth30=Data.BeamWidth30;
BeamWidth40=Data.BeamWidth40;

AxialPositionU=2;
AngleU=2;
DivergenceHalfAngleU=Data.DivergenceHalfAngleU;
BeamWidth_40U=Data.BeamWidth_40U;
BeamWidth_30U=Data.BeamWidth_30U;
BeamWidth_20U=Data.BeamWidth_20U;
BeamWidth_10U=Data.BeamWidth_10U;
BeamWidth0U=Data.BeamWidth0U;
BeamWidth10U=Data.BeamWidth10U;
BeamWidth20U=Data.BeamWidth20U;
BeamWidth30U=Data.BeamWidth30U;
BeamWidth40U=Data.BeamWidth40U;

Slope=Data.Slope;
Slope_40=Slope(1);
Slope_30=Slope(2);
Slope_20=Slope(3);
Slope_10=Slope(4);
Slope0=Slope(5);
Slope10=Slope(6);
Slope20=Slope(7);
Slope30=Slope(8);
Slope40=Slope(9);

YInt=Data.YInt;
YInt_40=YInt(1);
YInt_30=YInt(2);
YInt_20=YInt(3);
YInt_10=YInt(4);
YInt0=YInt(5);
YInt10=YInt(6);
YInt20=YInt(7);
YInt30=YInt(8);
YInt40=YInt(9);

c=15;
x_40=(AxialPositionMM_40(4)-c):1:(AxialPositionMM_40(1)+c);
x_30=AxialPositionMM_30(4)-c:1:AxialPositionMM_30(1)+c;
x_20=AxialPositionMM_20(4)-c:1:AxialPositionMM_20(1)+c;
x_10=AxialPositionMM_10(4)-c:1:AxialPositionMM_10(1)+c;
x0=AxialPositionMM0(4)-c:1:AxialPositionMM0(1)+c;
x10=AxialPositionMM10(4)-c:1:AxialPositionMM10(1)+c;
x20=AxialPositionMM20(4)-c:1:AxialPositionMM20(1)+c;
x30=AxialPositionMM30(4)-c:1:AxialPositionMM30(1)+c;
x40=AxialPositionMM40(4)-c:1:AxialPositionMM40(1)+c;

longx_40=0:1500:3000;
longx_30=0:1500:3000;
longx_20=0:1500:3000;
longx_10=0:1500:3000;
longx0=0:1500:3000;
longx10=0:1500:3000;
longx20=0:1500:3000;
longx30=0:1500:3000;
longx40=0:1500:3000;

y_40=Slope_40*x_40+YInt_40;
y_30=Slope_30*x_30+YInt_30;
y_20=Slope_20*x_20+YInt_20;
y_10=Slope_10*x_10+YInt_10;
y0=Slope0*x0+YInt0;
y10=Slope10*x10+YInt10;
y20=Slope20*x20+YInt20;
y30=Slope30*x30+YInt30;
y40=Slope40*x40+YInt40;

longy_40=Slope_40.*longx_40+YInt_40;
longy_30=Slope_30.*longx_30+YInt_30;
longy_20=Slope_20.*longx_20+YInt_20;
longy_10=Slope_10.*longx_10+YInt_10;
longy0=Slope0.*longx0+YInt0;
longy10=Slope10.*longx10+YInt10;
longy20=Slope20.*longx20+YInt20;
longy30=Slope30.*longx30+YInt30;
longy40=Slope40.*longx40+YInt40;

x_prime_1=sign(Angle).*abs(Angle).^(1/4);
p1=polyfit(x_prime_1, DivergenceHalfAngle, 1);
x2=-3.6:0.1:4.8;
x2_c=-44:0.1:44;
y_fit_1=p1(1)*x2+p1(2);
y_fit_c1=p1(1)*sign(x2_c).*abs(x2_c).^(1/4)+p1(2);

x_prime_2=sign(Angle_2).*abs(Angle_2).^(1/4);
p2=polyfit(x_prime_2, DivergenceHalfAngle_2, 1);
x3=-4:0.1:3.3;
x3_c=-44:0.1:24.5;
y_fit_2=p2(1)*x3+p2(2);
y_fit_c2=p2(1)*sign(x3_c).*abs(x3_c).^(1/4)+p2(2);

p3=polyfit(Angle, DivergenceHalfAngle, 1);
x4=-43:1:44;
y_fit_3=p3(1)*x4+p3(2);

figure;
%figure('Position', [1 479 680 510]);
hold on
errorbar(Angle, DivergenceHalfAngle, AngleU, 'horizontal', 's', 'Color', 'Magenta')
errorbar(Angle, DivergenceHalfAngle, DivergenceHalfAngleU, 's', 'Color', 'Magenta')
plot(Angle, DivergenceHalfAngle,'marker','square', 'MarkerFaceColor', 'black', 'linestyle','none')
plot(x4, y_fit_3, 'Color', 'Red')
%axis([-45 45 -1.4 2.15])
grid on
box on
title('Divergence Half-Angle Data')
xlabel('Shearing Interferometer Fringe Angle')
ylabel('Divergence Half-Angle (mrad)')
xline(0, 'Color', '#808080')
yline(0, 'Color', '#808080')
hold off

%exportgraphics(gcf,"figure1.png")

figure;
%figure('Position', [1750 441 803 550]);
tiledlayout(2,2)
sgtitle('Divergence Half-Angle Regression')

nexttile;
hold on
errorbar(x_prime_1, DivergenceHalfAngle, nthroot(AngleU, 4), 'horizontal', 's', 'Color', 'Magenta')
errorbar(x_prime_1, DivergenceHalfAngle, DivergenceHalfAngleU, 's', 'Color', 'Magenta')
plot(x_prime_1, DivergenceHalfAngle,'marker','square', 'MarkerFaceColor', 'black', 'linestyle','none')
plot(x2, y_fit_1, 'Color', 'red')
%axis([-4.99 4.99 -1.05 2.15])
grid on
box on
title('Linear Regression')
xlabel('Shearing Interferometer Fringe Angle ∜(°)')
ylabel('Divergence Half-Angle (mrad)')
xline(0, 'Color', '#808080')
yline(0, 'Color', '#808080')
hold off

nexttile;
hold on
errorbar(Angle, DivergenceHalfAngle, AngleU, 'horizontal', 's', 'Color', 'Magenta')
errorbar(Angle, DivergenceHalfAngle, DivergenceHalfAngleU, 's', 'Color', 'Magenta')
plot(Angle, DivergenceHalfAngle,'marker','square', 'MarkerFaceColor', 'black', 'linestyle','none')
plot(x2_c, y_fit_c1, 'Color', 'red')
%axis([-45 45 -1.05 2.15])
grid on
box on
title('Quartic Root Regression')
xlabel('Shearing Interferometer Fringe Angle (°)')
ylabel('Divergence Half-Angle (mrad)')
xline(0, 'Color', '#808080')
yline(0, 'Color', '#808080')
hold off

nexttile;
hold on
errorbar(x_prime_2, DivergenceHalfAngle(1:7), nthroot(AngleU, 4), 'horizontal', 's', 'Color', 'Magenta')
errorbar(x_prime_2, DivergenceHalfAngle(1:7), DivergenceHalfAngleU(1:7), 's', 'Color', 'Magenta')
plot(x_prime_2, DivergenceHalfAngle(1:7),'marker','square', 'MarkerFaceColor', 'black', 'linestyle','none')
plot(x3, y_fit_2, 'Color', 'blue')
%axis([-4.99 4.99 -1.05 1])
grid on
box on
title('Linear Regression Excluding Outliers')
xlabel('Shearing Interferometer Fringe Angle ∜(°)')
ylabel('Divergence Half-Angle (mrad)')
xline(0, 'Color', '#808080')
yline(0, 'Color', '#808080')
hold off

nexttile;
hold on
errorbar(Angle(1:7), DivergenceHalfAngle(1:7), AngleU, 'horizontal', 's', 'Color', 'Magenta')
errorbar(Angle(1:7), DivergenceHalfAngle(1:7), DivergenceHalfAngleU(1:7), 's', 'Color', 'Magenta')
plot(Angle(1:7), DivergenceHalfAngle(1:7),'marker','square', 'MarkerFaceColor', 'black', 'linestyle','none')
plot(x3_c, y_fit_c2, 'Color', 'blue')
%axis([-45 26 -1.05 0.95])
grid on
box on
title('Quartic Root Regression Excluding Outliers')
xlabel('Shearing Interferometer Fringe Angle (°)')
ylabel('Divergence Half-Angle (mrad)')
xline(0, 'Color', '#808080')
yline(0, 'Color', '#808080')
hold off

%exportgraphics(gcf,"figure2.png")

figure;
%figure('Position', [686 264 1058 724]);
tiledlayout(3,3)
sgtitle('Slope Vizualization With Linear Regression')

nexttile
hold on
errorbar(AxialPositionMM_40, BeamWidth_40, AxialPositionU, 'horizontal', 's')
errorbar(AxialPositionMM_40, BeamWidth_40, BeamWidth_40U, 's', 'Color', 'Magenta')
plot(AxialPositionMM_40, BeamWidth_40,'marker','square', 'MarkerFaceColor', 'black', 'linestyle','none')
plot(x_40, y_40, 'Color', 'red')
%axis([(x_40(1)-8) (x_40(end)+8) 0.17 1.25])
grid on
box on
title('Shearing Interferometer Fringe Angle: -40°')
xlabel('Axial Position (mm)')
ylabel('Beam Width (mm)')
hold off

nexttile
hold on
errorbar(AxialPositionMM_30, BeamWidth_30, AxialPositionU, 'horizontal', 's')
errorbar(AxialPositionMM_30, BeamWidth_30, BeamWidth_30U, 's', 'Color', 'Magenta')
plot(AxialPositionMM_30, BeamWidth_30,'marker','square', 'MarkerFaceColor', 'black', 'linestyle','none')
plot(x_30, y_30, 'Color', 'red')
%axis([(x_30(1)-8) (x_30(end)+8) 0.21 1.29])
grid on
box on
title('Shearing Interferometer Fringe Angle: -30°')
xlabel('Axial Position (mm)')
ylabel('Beam Width (mm)')
hold off

nexttile
hold on
errorbar(AxialPositionMM_20, BeamWidth_20, AxialPositionU, 'horizontal', 's')
errorbar(AxialPositionMM_20, BeamWidth_20, BeamWidth_20U, 's', 'Color', 'Magenta')
plot(AxialPositionMM_20, BeamWidth_20,'marker','square', 'MarkerFaceColor', 'black', 'linestyle','none')
plot(x_20, y_20, 'Color', 'red')
%axis([(x_20(1)-8) (x_20(end)+8) 0.23 1.31])
grid on
box on
title('Shearing Interferometer Fringe Angle: -20°')
xlabel('Axial Position (mm)')
ylabel('Beam Width (mm)')
hold off

nexttile
hold on
errorbar(AxialPositionMM_10, BeamWidth_10, AxialPositionU, 'horizontal', 's')
errorbar(AxialPositionMM_10, BeamWidth_10, BeamWidth_10U, 's', 'Color', 'Magenta')
plot(AxialPositionMM_10, BeamWidth_10,'marker','square', 'MarkerFaceColor', 'black', 'linestyle','none')
plot(x_10, y_10, 'Color', 'red')
%axis([(x_10(1)-8) (x_10(end)+8) 0.33 1.41])
grid on
box on
title('Shearing Interferometer Fringe Angle: -10°')
xlabel('Axial Position (mm)')
ylabel('Beam Width (mm)')
hold off

nexttile
hold on
errorbar(AxialPositionMM0, BeamWidth0, AxialPositionU, 'horizontal', 's')
errorbar(AxialPositionMM0, BeamWidth0, BeamWidth0U, 's', 'Color', 'Magenta')
plot(AxialPositionMM0, BeamWidth0,'marker','square', 'MarkerFaceColor', 'black', 'linestyle','none')
plot(x0, y0, 'Color', 'red')
%axis([(x0(1)-8) (x0(end)+8) 0.42 1.49])
grid on
box on
title('Shearing Interferometer Fringe Angle: 0°')
xlabel('Axial Position (mm)')
ylabel('Beam Width (mm)')
hold off

nexttile
hold on
errorbar(AxialPositionMM10, BeamWidth10, AxialPositionU, 'horizontal', 's')
errorbar(AxialPositionMM10, BeamWidth10, BeamWidth10U, 's', 'Color', 'Magenta')
plot(AxialPositionMM10, BeamWidth10,'marker','square', 'MarkerFaceColor', 'black', 'linestyle','none')
plot(x10, y10, 'Color', 'red')
%axis([(x10(1)-8) (x10(end)+8) 0.57 1.65])
grid on
box on
title('Shearing Interferometer Fringe Angle: 10°')
xlabel('Axial Position (mm)')
ylabel('Beam Width (mm)')
hold off

nexttile
hold on
errorbar(AxialPositionMM20, BeamWidth20, AxialPositionU, 'horizontal', 's')
errorbar(AxialPositionMM20, BeamWidth20, BeamWidth20U, 's', 'Color', 'Magenta')
plot(AxialPositionMM20, BeamWidth20,'marker','square', 'MarkerFaceColor', 'black', 'linestyle','none')
plot(x20, y20, 'Color', 'red')
%axis([(x20(1)-8) (x20(end)+8) 0.67 1.75])
grid on
box on
title('Shearing Interferometer Fringe Angle: 20°')
xlabel('Axial Position (mm)')
ylabel('Beam Width (mm)')
hold off

nexttile
hold on
errorbar(AxialPositionMM30, BeamWidth30, AxialPositionU, 'horizontal', 's')
errorbar(AxialPositionMM30, BeamWidth30, BeamWidth30U, 's', 'Color', 'Magenta')
plot(AxialPositionMM30, BeamWidth30,'marker','square', 'MarkerFaceColor', 'black', 'linestyle','none')
plot(x30, y30, 'Color', 'red')
%axis([(x30(1)-8) (x30(end)+8) 1.04 2.12])
grid on
box on
title('Shearing Interferometer Fringe Angle: 30°')
xlabel('Axial Position (mm)')
ylabel('Beam Width (mm)')
hold off

nexttile
hold on
errorbar(AxialPositionMM40, BeamWidth40, AxialPositionU, 'horizontal', 's')
errorbar(AxialPositionMM40, BeamWidth40, BeamWidth40U, 's', 'Color', 'Magenta')
plot(AxialPositionMM40, BeamWidth40,'marker','square', 'MarkerFaceColor', 'black', 'linestyle','none')
plot(x40, y40, 'Color', 'red')
%axis([(x40(1)-8) (x40(end)+8) 1.25 2.33])
grid on
box on
title('Shearing Interferometer Fringe Angle: 40°')
xlabel('Axial Position (mm)')
ylabel('Beam Width (mm)')
hold off

%exportgraphics(gcf,"figure3.png")

figure;
%figure('Position', [813 39 1013 672]);
tiledlayout(3,3)
sgtitle('Laser Beam Profile Using Linear Regression Slopes')

nexttile
hold on
box on
plot(longx_40, longy_40, 'Color', 'red')
plot(longx_40, -longy_40, 'Color', 'red')
fill([longx_40, fliplr(longx_40)], [-longy_40, fliplr(longy_40)], 'r', 'FaceAlpha', 0.5, 'EdgeColor', 'none');
xline(80, 'Color', '#808080')
xline(400, 'Color', '#808080')
%axis([0 3000 -8 8])
title('Shearing Interferometer Fringe Angle: -40°')
xlabel('Axial Position (mm)')
ylabel('Beam Width (mm)')
hold off

nexttile
hold on
box on
plot(longx_30, longy_30, 'Color', 'red')
plot(longx_30, -longy_30, 'Color', 'red')
fill([longx_30, fliplr(longx_30)], [-longy_30, fliplr(longy_30)], 'r', 'FaceAlpha', 0.5, 'EdgeColor', 'none');
xline(80, 'Color', '#808080')
xline(400, 'Color', '#808080')
%axis([0 3000 -8 8])
title('Shearing Interferometer Fringe Angle: -30°')
xlabel('Axial Position (mm)')
ylabel('Beam Width (mm)')
hold off

nexttile
hold on
box on
plot(longx_20, longy_20, 'Color', 'red')
plot(longx_20, -longy_20, 'Color', 'red')
fill([longx_20, fliplr(longx_20)], [-longy_20, fliplr(longy_20)], 'r', 'FaceAlpha', 0.5, 'EdgeColor', 'none');
xline(80, 'Color', '#808080')
xline(400, 'Color', '#808080')
%axis([0 3000 -8 8])
title('Shearing Interferometer Fringe Angle: -20°')
xlabel('Axial Position (mm)')
ylabel('Beam Width (mm)')
hold off

nexttile
hold on
box on
plot(longx_10, longy_10, 'Color', 'red')
plot(longx_10, -longy_10, 'Color', 'red')
fill([longx_10, fliplr(longx_10)], [-longy_10, fliplr(longy_10)], 'r', 'FaceAlpha', 0.5, 'EdgeColor', 'none');
xline(80, 'Color', '#808080')
xline(400, 'Color', '#808080')
%axis([0 3000 -8 8])
title('Shearing Interferometer Fringe Angle: -10°')
xlabel('Axial Position (mm)')
ylabel('Beam Width (mm)')
hold off

nexttile
hold on
box on
plot(longx0, longy0, 'Color', 'red')
plot(longx0, -longy0, 'Color', 'red')
fill([longx0, fliplr(longx0)], [-longy0, fliplr(longy0)], 'r', 'FaceAlpha', 0.5, 'EdgeColor', 'none');
xline(80, 'Color', '#808080')
xline(400, 'Color', '#808080')
%axis([0 3000 -8 8])
title('Shearing Interferometer Fringe Angle: 0°')
xlabel('Axial Position (mm)')
ylabel('Beam Width (mm)')
hold off

nexttile
hold on
box on
plot(longx10, longy10, 'Color', 'red')
plot(longx10, -longy10, 'Color', 'red')
fill([longx10, fliplr(longx10)], [-longy10, fliplr(longy10)], 'r', 'FaceAlpha', 0.5, 'EdgeColor', 'none');
xline(80, 'Color', '#808080')
xline(400, 'Color', '#808080')
%axis([0 3000 -8 8])
title('Shearing Interferometer Fringe Angle: 10°')
xlabel('Axial Position (mm)')
ylabel('Beam Width (mm)')
hold off

nexttile
hold on
box on
plot(longx20, longy20, 'Color', 'red')
plot(longx20, -longy20, 'Color', 'red')
fill([longx20, fliplr(longx20)], [-longy20, fliplr(longy20)], 'r', 'FaceAlpha', 0.5, 'EdgeColor', 'none');
xline(80, 'Color', '#808080')
xline(400, 'Color', '#808080')
%axis([0 3000 -8 8])
title('Shearing Interferometer Fringe Angle: 20°')
xlabel('Axial Position (mm)')
ylabel('Beam Width (mm)')
hold off

nexttile
hold on
box on
plot(longx30, longy30, 'Color', 'red')
plot(longx30, -longy30, 'Color', 'red')
fill([longx30, fliplr(longx30)], [-longy30, fliplr(longy30)], 'r', 'FaceAlpha', 0.5, 'EdgeColor', 'none');
xline(80, 'Color', '#808080')
xline(400, 'Color', '#808080')
%axis([0 3000 -8 8])
title('Shearing Interferometer Fringe Angle: 30°')
xlabel('Axial Position (mm)')
ylabel('Beam Width (mm)')
hold off

nexttile
hold on
box on
plot(longx40, longy40, 'Color', 'red')
plot(longx40, -longy40, 'Color', 'red')
fill([longx40, fliplr(longx40)], [-longy40, fliplr(longy40)], 'r', 'FaceAlpha', 0.5, 'EdgeColor', 'none');
xline(80, 'Color', '#808080')
xline(400, 'Color', '#808080')
%axis([0 3000 -8 8])
title('Shearing Interferometer Fringe Angle: 40°')
xlabel('Axial Position (mm)')
ylabel('Beam Width (mm)')
hold off

%exportgraphics(gcf,"figure4.png")