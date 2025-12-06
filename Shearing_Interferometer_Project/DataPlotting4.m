clc; clear; close all;

Data=readtable('Data4.xlsx','sheet','Data4');
Data=Data(1:9, :);

Angle=Data.Angle;
DivergenceHalfAngle1=Data.DivergenceHalfAngle1;
DivergenceHalfAngle2=Data.DivergenceHalfAngle2;

AxialPositionMM=Data.AxialPositionMM;

XM2=Data.XM2;

BeamWidth_40=Data.BeamWidth_40;
BeamWidth_30=Data.BeamWidth_30;
BeamWidth_20=Data.BeamWidth_20;
BeamWidth_10=Data.BeamWidth_10;
BeamWidth0=Data.BeamWidth0;
BeamWidth10=Data.BeamWidth10;
BeamWidth20=Data.BeamWidth20;
BeamWidth30=Data.BeamWidth30;
BeamWidth40=Data.BeamWidth40;

AxialPositionU=0.5;
AngleU=1;
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

SlopeM1=Data.SlopeM1;

Slope_40_1=SlopeM1(1);
Slope_30_1=SlopeM1(2);
Slope_20_1=SlopeM1(3);
Slope_10_1=SlopeM1(4);
Slope0_1=SlopeM1(5);
Slope10_1=SlopeM1(6);
Slope20_1=SlopeM1(7);
Slope30_1=SlopeM1(8);
Slope40_1=SlopeM1(9);

SlopeUM1=Data.SlopeUM1;

Slope_40U_1=SlopeUM1(1);
Slope_30U_1=SlopeUM1(2);
Slope_20U_1=SlopeUM1(3);
Slope_10U_1=SlopeUM1(4);
Slope0_1U=SlopeUM1(5);
Slope10U_1=SlopeUM1(6);
Slope20U_1=SlopeUM1(7);
Slope30U_1=SlopeUM1(8);
Slope40U_1=SlopeUM1(9);

SlopeM2=Data.SlopeM2;

Slope_40_2=SlopeM2(1);
Slope_20_2=SlopeM2(2);
Slope0_2=SlopeM2(3);
Slope20_2=SlopeM2(4);
Slope40_2=SlopeM2(5);

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
x1=AxialPositionMM(1)-c:1:AxialPositionMM(3)+c;

longx=0:1500:3000;

longy_40_1=Slope_40_1.*longx+YInt_40;
longy_30_1=Slope_30_1.*longx+YInt_30;
longy_20_1=Slope_20_1.*longx+YInt_20;
longy_10_1=Slope_10_1.*longx+YInt_10;
longy0_1=Slope0_1.*longx+YInt0;
longy10_1=Slope10_1.*longx+YInt10;
longy20_1=Slope20_1.*longx+YInt20;
longy30_1=Slope30_1.*longx+YInt30;
longy40_1=Slope40_1.*longx+YInt40;

yMax1=32;
yMax2=20;

y_40_1=Slope_40_1*x1+YInt_40;
y_30_1=Slope_30_1*x1+YInt_30;
y_20_1=Slope_20_1*x1+YInt_20;
y_10_1=Slope_10_1*x1+YInt_10;
y0_1=Slope0_1*x1+YInt0;
y10_1=Slope10_1*x1+YInt10;
y20_1=Slope20_1*x1+YInt20;
y30_1=Slope30_1*x1+YInt30;
y40_1=Slope40_1*x1+YInt40;

longy_40_2=Slope_40_2.*longx;
longy_20_2=Slope_20_2.*longx;
longy0_2=Slope0_2.*longx;
longy20_2=Slope20_2.*longx;
longy40_2=Slope40_2.*longx;

y_40_2=Slope_40_2*x1;
y_20_2=Slope_20_2*x1;
y0_2=Slope0_2*x1;
y20_2=Slope20_2*x1;
y40_2=Slope40_2*x1;

% Figure 1 Method 1 Linear Fit 
p1_1=polyfit(Angle, DivergenceHalfAngle1, 1);
x2_1=-44:1:44;
y1_fit_1L=p1_1(1)*x2_1+p1_1(2);

% Figure 1 Method 2 Linear Fit 
p1_2=polyfit(XM2(1:5), DivergenceHalfAngle2(1:5), 1);
x2_2=0:0.01:0.08;
y1_fit_2L=p1_2(1)*x2_2+p1_2(2);

% Figure 2 Method 1 Fits
x2_transformed_1=sign(Angle).*abs(Angle).^(1/4);
p2_1=polyfit(x2_transformed_1, DivergenceHalfAngle1, 1);
x2_l1=-3:1:3;
x2_q1=-50:0.1:50;
y2_fit_l1=p2_1(1)*x2_l1+p2_1(2);
y2_fit_q1=p2_1(1)*sign(x2_q1).*abs(x2_q1).^(1/4)+p2_1(2);

% Figure 2 Method 2 Fits
x2_transformed_2=sign(XM2).*abs(XM2).^(1/4);
p2_2=polyfit(x2_transformed_2(1:5), DivergenceHalfAngle2(1:5), 1);
x2_l2=0.2:0.05:0.6;
x2_q2=0:0.0005:0.1;
y2_fit_l2=p2_2(1)*x2_l2+p2_2(2);
y2_fit_q2=p2_2(1)*sign(x2_q2).*abs(x2_q2).^(1/4)+p2_2(2);

figure;
tiledlayout(1,2)
sgtitle('Divergence Half-Angle Data')
theme('light')

nexttile;
hold on
errorbar(Angle, DivergenceHalfAngle1, AngleU, 'horizontal', 's', 'Color', 'Magenta')
errorbar(Angle, DivergenceHalfAngle1, DivergenceHalfAngleU, 's', 'Color', 'Magenta')
plot(Angle, DivergenceHalfAngle1,'marker','square', 'MarkerFaceColor', 'black', 'linestyle','none')
plot(x2_1, y1_fit_1L, 'Color', 'Red')
axis([-45 45 -4 11])
grid on
box on
title('Method 1')
xlabel('Shearing Interferometer Fringe Angle')
ylabel('Divergence Half-Angle (mrad)')
xline(0, 'Color', '#808080')
yline(0, 'Color', '#808080')
hold off

nexttile;
hold on
plot(XM2, DivergenceHalfAngle2,'marker','square', 'MarkerFaceColor', 'black', 'linestyle','none')
plot(x2_2, y1_fit_2L, 'Color', 'Red')
%axis([-0.005 0.08])
grid on
box on
title('Method 2')
xlabel('Shearing Interferometer Fringe Angle')
ylabel('Divergence Half-Angle (mrad)')
%xline(0, 'Color', '#808080')
%yline(0, 'Color', '#808080')
hold off

%exportgraphics(gcf,"figure1.png")

figure;
tiledlayout(2,2)
sgtitle('Divergence Half-Angle Regression')
theme('light')

nexttile;
hold on
errorbar(x2_transformed_1, DivergenceHalfAngle1, nthroot(AngleU, 4), 'horizontal', 's', 'Color', 'Magenta')
errorbar(x2_transformed_1, DivergenceHalfAngle1, DivergenceHalfAngleU, 's', 'Color', 'Magenta')
plot(x2_transformed_1, DivergenceHalfAngle1,'marker','square', 'MarkerFaceColor', 'black', 'linestyle','none')
plot(x2_l1, y2_fit_l1, 'Color', 'red')
%axis([-5 5 -1.05 2.15])
grid on
title('Method 1 Linear Regression')
xlabel('Shearing Interferometer Fringe Angle ∜(°)')
ylabel('Divergence Half-Angle (mrad)')
xline(0, 'Color', '#808080')
yline(0, 'Color', '#808080')
hold off

nexttile;
hold on
errorbar(Angle, DivergenceHalfAngle1, AngleU, 'horizontal', 's', 'Color', 'Magenta')
errorbar(Angle, DivergenceHalfAngle1, DivergenceHalfAngleU, 's', 'Color', 'Magenta')
plot(Angle, DivergenceHalfAngle1,'marker','square', 'MarkerFaceColor', 'black', 'linestyle','none')
plot(x2_q1, y2_fit_q1, 'Color', 'red')
%axis([-45 45 -1.05 2.15])
grid on
title('Method 1 Quartic Root Regression')
xlabel('Shearing Interferometer Fringe Angle (°)')
ylabel('Divergence Half-Angle (mrad)')
xline(0, 'Color', '#808080')
yline(0, 'Color', '#808080')
hold off

nexttile;
hold on
plot(x2_transformed_2, DivergenceHalfAngle2,'marker','square', 'MarkerFaceColor', 'black', 'linestyle','none')
plot(x2_l2, y2_fit_l2, 'Color', 'red')
axis([0.1 0.7 0 30])
grid on
title('Method 2 Linear Regression')
xlabel('Shearing Interferometer Fringe Angle ∜(°)')
ylabel('Divergence Half-Angle (mrad)')
xline(0, 'Color', '#808080')
yline(0, 'Color', '#808080')
hold off

nexttile;
hold on
plot(XM2, DivergenceHalfAngle2,'marker','square', 'MarkerFaceColor', 'black', 'linestyle','none')
plot(x2_q2, y2_fit_q2, 'Color', 'red')
axis([-0.005 0.105 -9 30])
grid on
title('Method 2 Quartic Root Regression')
xlabel('Difference In Fringe Angle (°)')
ylabel('Divergence Half-Angle (mrad)')
xline(0, 'Color', '#808080')
yline(0, 'Color', '#808080')
hold off

%exportgraphics(gcf,"figure2.png")

figure;
tiledlayout(3,3)
sgtitle('Slope Vizualization With Linear Regression (Method 1)')
theme('light')

nexttile
hold on
errorbar(AxialPositionMM, BeamWidth_40, AxialPositionU, 'horizontal', 's')
errorbar(AxialPositionMM, BeamWidth_40, BeamWidth_40U, 's', 'Color', 'Magenta')
plot(AxialPositionMM, BeamWidth_40,'marker','square', 'MarkerFaceColor', 'black', 'linestyle','none')
plot(x1, y_40_1, 'Color', 'red')
%%axis([(x_1(1)-8) (x_1(end)+8) 0.17 1.25])
grid on
title('Shearing Interferometer Fringe Angle: -40°')
text = sprintf('%.2e', Slope_40_1);
mantissa = extractBefore(text, 'e');
exponent = str2double(extractAfter(text, 'e'));
subtitle(['$Slope = ' mantissa '\times10^{' num2str(exponent) '}$'], 'Interpreter', 'latex');
xlabel('Axial Position (mm)')
ylabel('Beam Width (mm)')
hold off

nexttile
hold on
errorbar(AxialPositionMM, BeamWidth_30, AxialPositionU, 'horizontal', 's')
errorbar(AxialPositionMM, BeamWidth_30, BeamWidth_30U, 's', 'Color', 'Magenta')
plot(AxialPositionMM, BeamWidth_30,'marker','square', 'MarkerFaceColor', 'black', 'linestyle','none')
plot(x1, y_30_1, 'Color', 'red')
%%axis([(x_1(1)-8) (x_1(end)+8) 0.17 1.25])
grid on
title('Shearing Interferometer Fringe Angle: -30°')
xlabel('Axial Position (mm)')
ylabel('Beam Width (mm)')
hold off

nexttile
hold on
errorbar(AxialPositionMM, BeamWidth_20, AxialPositionU, 'horizontal', 's')
errorbar(AxialPositionMM, BeamWidth_20, BeamWidth_20U, 's', 'Color', 'Magenta')
plot(AxialPositionMM, BeamWidth_20,'marker','square', 'MarkerFaceColor', 'black', 'linestyle','none')
plot(x1, y_20_1, 'Color', 'red')
%%axis([(x_1(1)-8) (x_1(end)+8) 0.23 1.31])
grid on
title('Shearing Interferometer Fringe Angle: -20°')
xlabel('Axial Position (mm)')
ylabel('Beam Width (mm)')
hold off

nexttile
hold on
errorbar(AxialPositionMM, BeamWidth_10, AxialPositionU, 'horizontal', 's')
errorbar(AxialPositionMM, BeamWidth_10, BeamWidth_10U, 's', 'Color', 'Magenta')
plot(AxialPositionMM, BeamWidth_10,'marker','square', 'MarkerFaceColor', 'black', 'linestyle','none')
plot(x1, y_10_1, 'Color', 'red')
%%axis([(x_1(1)-8) (x_1(end)+8) 0.17 1.25])
grid on
title('Shearing Interferometer Fringe Angle: -10°')
xlabel('Axial Position (mm)')
ylabel('Beam Width (mm)')
hold off

nexttile
hold on
errorbar(AxialPositionMM, BeamWidth0, AxialPositionU, 'horizontal', 's')
errorbar(AxialPositionMM, BeamWidth0, BeamWidth0U, 's', 'Color', 'Magenta')
plot(AxialPositionMM, BeamWidth0,'marker','square', 'MarkerFaceColor', 'black', 'linestyle','none')
plot(x1, y0_1, 'Color', 'red')
%%axis([(x1(1)-8) (x1(end)+8) 0.42 1.49])
grid on
title('Shearing Interferometer Fringe Angle: 0°')
xlabel('Axial Position (mm)')
ylabel('Beam Width (mm)')
hold off

nexttile
hold on
errorbar(AxialPositionMM, BeamWidth10, AxialPositionU, 'horizontal', 's')
errorbar(AxialPositionMM, BeamWidth10, BeamWidth10U, 's', 'Color', 'Magenta')
plot(AxialPositionMM, BeamWidth10,'marker','square', 'MarkerFaceColor', 'black', 'linestyle','none')
plot(x1, y10_1, 'Color', 'red')
%%axis([(x1(1)-8) (x1(end)+8) 0.67 1.75])
grid on
title('Shearing Interferometer Fringe Angle: 10°')
xlabel('Axial Position (mm)')
ylabel('Beam Width (mm)')
hold off

nexttile
hold on
errorbar(AxialPositionMM, BeamWidth20, AxialPositionU, 'horizontal', 's')
errorbar(AxialPositionMM, BeamWidth20, BeamWidth20U, 's', 'Color', 'Magenta')
plot(AxialPositionMM, BeamWidth20,'marker','square', 'MarkerFaceColor', 'black', 'linestyle','none')
plot(x1, y20_1, 'Color', 'red')
%%axis([(x1(1)-8) (x1(end)+8) 0.67 1.75])
grid on
title('Shearing Interferometer Fringe Angle: 20°')
xlabel('Axial Position (mm)')
ylabel('Beam Width (mm)')
hold off

nexttile
hold on
errorbar(AxialPositionMM, BeamWidth30, AxialPositionU, 'horizontal', 's')
errorbar(AxialPositionMM, BeamWidth30, BeamWidth30U, 's', 'Color', 'Magenta')
plot(AxialPositionMM, BeamWidth30,'marker','square', 'MarkerFaceColor', 'black', 'linestyle','none')
plot(x1, y30_1, 'Color', 'red')
%%axis([(x1(1)-8) (x1(end)+8) 0.67 1.75])
grid on
title('Shearing Interferometer Fringe Angle: 30°')
xlabel('Axial Position (mm)')
ylabel('Beam Width (mm)')
hold off

nexttile
hold on
errorbar(AxialPositionMM, BeamWidth40, AxialPositionU, 'horizontal', 's')
errorbar(AxialPositionMM, BeamWidth40, BeamWidth40U, 's', 'Color', 'Magenta')
plot(AxialPositionMM, BeamWidth40,'marker','square', 'MarkerFaceColor', 'black', 'linestyle','none')
plot(x1, y40_1, 'Color', 'red')
%axis([(x1(1)-8) (x1(end)+8) 1.25 2.33])
grid on
title('Shearing Interferometer Fringe Angle: 40°')
xlabel('Axial Position (mm)')
ylabel('Beam Width (mm)')
hold off

%exportgraphics(gcf,"figure3.png")

figure;
tiledlayout(2,3)
sgtitle('Slope Vizualization With Linear Regression (Method 2)')
theme('light')

nexttile
hold on
plot(x1, y_40_2, 'Color', 'red')
%axis([(x1(1)-8) (x1(end)+8) 0.17 1.25])
grid on
title('Shearing Interferometer Fringe Angle: -40°')
xlabel('Axial Position (mm)')
ylabel('Beam Width (mm)')
hold off

nexttile
hold on

plot(x1, y_20_2, 'Color', 'red')
%axis([(x1(1)-8) (x1(end)+8) 0.23 1.31])
grid on
title('Shearing Interferometer Fringe Angle: -20°')
xlabel('Axial Position (mm)')
ylabel('Beam Width (mm)')
hold off

nexttile
hold on
plot(x1, y0_2, 'Color', 'red')
%axis([(x1(1)-8) (x1(end)+8) 0.42 1.49])
grid on
title('Shearing Interferometer Fringe Angle: 0°')
xlabel('Axial Position (mm)')
ylabel('Beam Width (mm)')
hold off

nexttile
hold on
plot(x1, y20_2, 'Color', 'red')
%axis([(x1(1)-8) (x1(end)+8) 0.67 1.75])
grid on
title('Shearing Interferometer Fringe Angle: 20°')
xlabel('Axial Position (mm)')
ylabel('Beam Width (mm)')
hold off

nexttile
hold on
plot(x1, y40_2, 'Color', 'red')
%axis([(x1(1)-8) (x1(end)+8) 1.25 2.33])
grid on
title('Shearing Interferometer Fringe Angle: 40°')
xlabel('Axial Position (mm)')
ylabel('Beam Width (mm)')
hold off

%exportgraphics(gcf,"figure4.png")

figure;
tiledlayout(3,3)
sgtitle('Laser Beam Profile Using Linear Regression Slopes (Method 1)')
theme('light')

nexttile
hold on
plot(longx, longy_40_1, 'Color', 'red')
plot(longx, -longy_40_1, 'Color', 'red')
fill([longx, fliplr(longx)], [-longy_40_1, fliplr(longy_40_1)], 'r', 'FaceAlpha', 0.5, 'EdgeColor', 'none');
xline(AxialPositionMM(1), 'LineStyle', '--', 'Color', 'black')
xline(AxialPositionMM(2), 'LineStyle', '--', 'Color', 'black')
xline(AxialPositionMM(3), 'LineStyle', '--', 'Color', 'black')
axis([0 3000 -yMax1 yMax1])
grid on
title('Shearing Interferometer Fringe Angle: -40°')
xlabel('Axial Position (mm)')
ylabel('Beam Width (mm)')
hold off

nexttile
hold on
plot(longx, longy_30_1, 'Color', 'red')
plot(longx, -longy_30_1, 'Color', 'red')
fill([longx, fliplr(longx)], [-longy_30_1, fliplr(longy_30_1)], 'r', 'FaceAlpha', 0.5, 'EdgeColor', 'none');
xline(AxialPositionMM(1), 'LineStyle', '--', 'Color', 'black')
xline(AxialPositionMM(2), 'LineStyle', '--', 'Color', 'black')
xline(AxialPositionMM(3), 'LineStyle', '--', 'Color', 'black')
axis([0 3000 -yMax1 yMax1])
grid on
title('Shearing Interferometer Fringe Angle: -30°')
xlabel('Axial Position (mm)')
ylabel('Beam Width (mm)')
hold off

nexttile
hold on
plot(longx, longy_20_1, 'Color', 'red')
plot(longx, -longy_20_1, 'Color', 'red')
fill([longx, fliplr(longx)], [-longy_20_1, fliplr(longy_20_1)], 'r', 'FaceAlpha', 0.5, 'EdgeColor', 'none');
xline(AxialPositionMM(1), 'LineStyle', '--', 'Color', 'black')
xline(AxialPositionMM(2), 'LineStyle', '--', 'Color', 'black')
xline(AxialPositionMM(3), 'LineStyle', '--', 'Color', 'black')
axis([0 3000 -yMax1 yMax1])
grid on
title('Shearing Interferometer Fringe Angle: -20°')
xlabel('Axial Position (mm)')
ylabel('Beam Width (mm)')
hold off

nexttile
hold on
plot(longx, longy_10_1, 'Color', 'red')
plot(longx, -longy_10_1, 'Color', 'red')
fill([longx, fliplr(longx)], [-longy_10_1, fliplr(longy_10_1)], 'r', 'FaceAlpha', 0.5, 'EdgeColor', 'none');
xline(AxialPositionMM(1), 'LineStyle', '--', 'Color', 'black')
xline(AxialPositionMM(2), 'LineStyle', '--', 'Color', 'black')
xline(AxialPositionMM(3), 'LineStyle', '--', 'Color', 'black')
axis([0 3000 -yMax1 yMax1])
grid on
title('Shearing Interferometer Fringe Angle: -10°')
xlabel('Axial Position (mm)')
ylabel('Beam Width (mm)')
hold off

nexttile
hold on
plot(longx, longy0_1, 'Color', 'red')
plot(longx, -longy0_1, 'Color', 'red')
fill([longx, fliplr(longx)], [-longy0_1, fliplr(longy0_1)], 'r', 'FaceAlpha', 0.5, 'EdgeColor', 'none');
xline(AxialPositionMM(1), 'LineStyle', '--', 'Color', 'black')
xline(AxialPositionMM(2), 'LineStyle', '--', 'Color', 'black')
xline(AxialPositionMM(3), 'LineStyle', '--', 'Color', 'black')
axis([0 3000 -yMax1 yMax1])
grid on
title('Shearing Interferometer Fringe Angle: 0°')
xlabel('Axial Position (mm)')
ylabel('Beam Width (mm)')
hold off

nexttile
hold on
plot(longx, longy10_1, 'Color', 'red')
plot(longx, -longy10_1, 'Color', 'red')
fill([longx, fliplr(longx)], [-longy10_1, fliplr(longy10_1)], 'r', 'FaceAlpha', 0.5, 'EdgeColor', 'none');
xline(AxialPositionMM(1), 'LineStyle', '--', 'Color', 'black')
xline(AxialPositionMM(2), 'LineStyle', '--', 'Color', 'black')
xline(AxialPositionMM(3), 'LineStyle', '--', 'Color', 'black')
axis([0 3000 -yMax1 yMax1])
grid on
title('Shearing Interferometer Fringe Angle: 10°')
xlabel('Axial Position (mm)')
ylabel('Beam Width (mm)')
hold off

nexttile
hold on
plot(longx, longy20_1, 'Color', 'red')
plot(longx, -longy20_1, 'Color', 'red')
fill([longx, fliplr(longx)], [-longy20_1, fliplr(longy20_1)], 'r', 'FaceAlpha', 0.5, 'EdgeColor', 'none');
xline(AxialPositionMM(1), 'LineStyle', '--', 'Color', 'black')
xline(AxialPositionMM(2), 'LineStyle', '--', 'Color', 'black')
xline(AxialPositionMM(3), 'LineStyle', '--', 'Color', 'black')
axis([0 3000 -yMax1 yMax1])
grid on
title('Shearing Interferometer Fringe Angle: 20°')
xlabel('Axial Position (mm)')
ylabel('Beam Width (mm)')
hold off

nexttile
hold on
plot(longx, longy30_1, 'Color', 'red')
plot(longx, -longy30_1, 'Color', 'red')
fill([longx, fliplr(longx)], [-longy30_1, fliplr(longy30_1)], 'r', 'FaceAlpha', 0.5, 'EdgeColor', 'none');
xline(AxialPositionMM(1), 'LineStyle', '--', 'Color', 'black')
xline(AxialPositionMM(2), 'LineStyle', '--', 'Color', 'black')
xline(AxialPositionMM(3), 'LineStyle', '--', 'Color', 'black')
axis([0 3000 -yMax1 yMax1])
grid on
title('Shearing Interferometer Fringe Angle: 30°')
xlabel('Axial Position (mm)')
ylabel('Beam Width (mm)')
hold off

nexttile
hold on
plot(longx, longy40_1, 'Color', 'red')
plot(longx, -longy40_1, 'Color', 'red')
fill([longx, fliplr(longx)], [-longy40_1, fliplr(longy40_1)], 'r', 'FaceAlpha', 0.5, 'EdgeColor', 'none');
xline(AxialPositionMM(1), 'LineStyle', '--', 'Color', 'black')
xline(AxialPositionMM(2), 'LineStyle', '--', 'Color', 'black')
xline(AxialPositionMM(3), 'LineStyle', '--', 'Color', 'black')
axis([0 3000 -yMax1 yMax1])
grid on
title('Shearing Interferometer Fringe Angle: 40°')
xlabel('Axial Position (mm)')
ylabel('Beam Width (mm)')
hold off

%exportgraphics(gcf,"figure5.png")

figure;
tiledlayout(2,3)
sgtitle('Laser Beam Profile Using Linear Regression Slopes (Method 2)')
theme('light')

nexttile
hold on
plot(longx, longy_40_2, 'Color', 'red')
plot(longx, -longy_40_2, 'Color', 'red')
fill([longx, fliplr(longx)], [-longy_40_2, fliplr(longy_40_2)], 'r', 'FaceAlpha', 0.5, 'EdgeColor', 'none');
axis([0 3000 -30000 30000])
grid on
title('Shearing Interferometer Fringe Angle: -40°')
xlabel('Axial Position (mm)')
ylabel('Beam Width (mm)')
hold off

nexttile
hold on
plot(longx, longy_20_2, 'Color', 'red')
plot(longx, -longy_20_2, 'Color', 'red')
fill([longx, fliplr(longx)], [-longy_20_2, fliplr(longy_20_2)], 'r', 'FaceAlpha', 0.5, 'EdgeColor', 'none');
axis([0 3000 -3000 3000])
grid on
title('Shearing Interferometer Fringe Angle: -20°')
xlabel('Axial Position (mm)')
ylabel('Beam Width (mm)')
hold off

nexttile
hold on
plot(longx, longy0_2, 'Color', 'red')
plot(longx, -longy0_2, 'Color', 'red')
fill([longx, fliplr(longx)], [-longy0_2, fliplr(longy0_2)], 'r', 'FaceAlpha', 0.5, 'EdgeColor', 'none');
axis([0 3000 -3000 3000])
grid on
title('Shearing Interferometer Fringe Angle: 0°')
xlabel('Axial Position (mm)')
ylabel('Beam Width (mm)')
hold off

nexttile
hold on
plot(longx, longy20_2, 'Color', 'red')
plot(longx, -longy20_2, 'Color', 'red')
fill([longx, fliplr(longx)], [-longy20_2, fliplr(longy20_2)], 'r', 'FaceAlpha', 0.5, 'EdgeColor', 'none');
axis([0 3000 -3000 3000])
grid on
title('Shearing Interferometer Fringe Angle: 20°')
xlabel('Axial Position (mm)')
ylabel('Beam Width (mm)')
hold off

nexttile
hold on
plot(longx, longy40_2, 'Color', 'red')
plot(longx, -longy40_2, 'Color', 'red')
fill([longx, fliplr(longx)], [-longy40_2, fliplr(longy40_2)], 'r', 'FaceAlpha', 0.5, 'EdgeColor', 'none');
axis([0 3000 -3000 3000])
grid on
title('Shearing Interferometer Fringe Angle: 40°')
xlabel('Axial Position (mm)')
ylabel('Beam Width (mm)')
hold off

%exportgraphics(gcf,"figure6.png")