clc; clear; close all;

Data=readtable('Data3.xlsx','sheet','Data3');
Data=Data(1:5, :);

Angle=Data.Angle;
DivergenceHalfAngle1=Data.DivergenceHalfAngle1;
DivergenceHalfAngle2=Data.DivergenceHalfAngle2;

AxialPositionMM=Data.AxialPositionMM;

XM2=Data.XM2;

BeamWidth_40=Data.BeamWidth_40;
BeamWidth_20=Data.BeamWidth_20;
BeamWidth0=Data.BeamWidth0;
BeamWidth20=Data.BeamWidth20;
BeamWidth40=Data.BeamWidth40;

AxialPositionU=2;
AngleU=2;
DivergenceHalfAngleU=Data.DivergenceHalfAngleU;

BeamWidth_40U=Data.BeamWidth_40U;
BeamWidth_20U=Data.BeamWidth_20U;
BeamWidth0U=Data.BeamWidth0U;
BeamWidth20U=Data.BeamWidth20U;
BeamWidth40U=Data.BeamWidth40U;

SlopeM1=Data.SlopeM1;

Slope_40_1=SlopeM1(1);
Slope_20_1=SlopeM1(2);
Slope0_1=SlopeM1(3);
Slope20_1=SlopeM1(4);
Slope40_1=SlopeM1(5);

SlopeM2=Data.SlopeM2;

Slope_40_2=SlopeM2(1);
Slope_20_2=SlopeM2(2);
Slope0_2=SlopeM2(3);
Slope20_2=SlopeM2(4);
Slope40_2=SlopeM2(5);

YInt=Data.YInt;
YInt_40=YInt(1);
YInt_20=YInt(2);
YInt0=YInt(3);
YInt20=YInt(4);
YInt40=YInt(5);

c=15;
x_40=AxialPositionMM(3)-c:1:AxialPositionMM(1)+c;
x_20=AxialPositionMM(3)-c:1:AxialPositionMM(1)+c;
x0=AxialPositionMM(3)-c:1:AxialPositionMM(1)+c;
x20=AxialPositionMM(3)-c:1:AxialPositionMM(1)+c;
x40=AxialPositionMM(3)-c:1:AxialPositionMM(1)+c;

longx=0:1500:3000;

longy_40_1=Slope_40_1.*longx+YInt_40;
longy_20_1=Slope_20_1.*longx+YInt_20;
longy0_1=Slope0_1.*longx+YInt0;
longy20_1=Slope20_1.*longx+YInt20;
longy40_1=Slope40_1.*longx+YInt40;

y_40_1=Slope_40_1*x_40+YInt_40;
y_20_1=Slope_20_1*x_20+YInt_20;
y0_1=Slope0_1*x0+YInt0;
y20_1=Slope20_1*x20+YInt20;
y40_1=Slope40_1*x40+YInt40;

longy_40_2=Slope_40_2.*longx;
longy_20_2=Slope_20_2.*longx;
longy0_2=Slope0_2.*longx;
longy20_2=Slope20_2.*longx;
longy40_2=Slope40_2.*longx;

y_40_2=Slope_40_2*x_40;
y_20_2=Slope_20_2*x_20;
y0_2=Slope0_2*x0;
y20_2=Slope20_2*x20;
y40_2=Slope40_2*x40;

% Figure 1 Method 1 Linear Fit 
p1_1=polyfit(Angle, DivergenceHalfAngle1, 1);
x2_1=-44:1:44;
y1_fit_1L=p1_1(1)*x2_1+p1_1(2);

% Figure 1 Method 2 Linear Fit 
p1_2=polyfit(XM2, DivergenceHalfAngle2, 1);
x2_2=0.01:0.01:0.06;
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
p2_2=polyfit(x2_transformed_2, DivergenceHalfAngle2, 1);
x2_l2=0.33:0.05:0.57;
x2_q2=0.01:0.01:0.06;
y2_fit_l2=p2_2(1)*x2_l2+p2_2(2);
y2_fit_q2=p2_2(1)*sign(x2_q2).*abs(x2_q2).^(1/4)+p2_2(2);

figure;
tiledlayout(1,2)
sgtitle('Divergence Half-Angle Data')

nexttile;
hold on
errorbar(Angle, DivergenceHalfAngle1, AngleU, 'horizontal', 's', 'Color', 'Magenta')
errorbar(Angle, DivergenceHalfAngle1, DivergenceHalfAngleU, 's', 'Color', 'Magenta')
plot(Angle, DivergenceHalfAngle1,'marker','square', 'MarkerFaceColor', 'black', 'linestyle','none')
plot(x2_1, y1_fit_1L, 'Color', 'Red')
%axis([-45 45 -0.75 1.5])
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
%errorbar(Angle, DivergenceHalfAngle, AngleU, 'horizontal', 's', 'Color', 'Magenta')
%errorbar(Angle, DivergenceHalfAngle, DivergenceHalfAngleU, 's', 'Color', 'Magenta')
plot(XM2, DivergenceHalfAngle2,'marker','square', 'MarkerFaceColor', 'black', 'linestyle','none')
plot(x2_2, y1_fit_2L, 'Color', 'Red')
%%axis([-0.005 0.08 ])
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

nexttile;
hold on
errorbar(x2_transformed_1, DivergenceHalfAngle1, nthroot(AngleU, 4), 'horizontal', 's', 'Color', 'Magenta')
errorbar(x2_transformed_1, DivergenceHalfAngle1, DivergenceHalfAngleU, 's', 'Color', 'Magenta')
plot(x2_transformed_1, DivergenceHalfAngle1,'marker','square', 'MarkerFaceColor', 'black', 'linestyle','none')
plot(x2_l1, y2_fit_l1, 'Color', 'red')
%%axis([-5 5 -1.05 2.15])
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
%%axis([-45 45 -1.05 2.15])
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
%axis([0.15 0.55 0.7 4])
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
%%axis([-45 45 -1.05 2.15])
grid on
title('Method 2 Quartic Root Regression')
xlabel('Difference In Fringe Angle (°)')
ylabel('Divergence Half-Angle (mrad)')
xline(0, 'Color', '#808080')
yline(0, 'Color', '#808080')
hold off

%exportgraphics(gcf,"figure2.png")

figure;
tiledlayout(2,3)
sgtitle('Slope Vizualization With Linear Regression (Method 1)')

nexttile
hold on
errorbar(AxialPositionMM, BeamWidth_40, AxialPositionU, 'horizontal', 's')
errorbar(AxialPositionMM, BeamWidth_40, BeamWidth_40U, 's', 'Color', 'Magenta')
plot(AxialPositionMM, BeamWidth_40,'marker','square', 'MarkerFaceColor', 'black', 'linestyle','none')
plot(x_40, y_40_1, 'Color', 'red')
%%axis([(x_40(1)-8) (x_40(end)+8) 0.17 1.25])
grid on
title('Shearing Interferometer Fringe Angle: -40°')
xlabel('Axial Position (mm)')
ylabel('Beam Width (mm)')
hold off

nexttile
hold on
errorbar(AxialPositionMM, BeamWidth_20, AxialPositionU, 'horizontal', 's')
errorbar(AxialPositionMM, BeamWidth_20, BeamWidth_20U, 's', 'Color', 'Magenta')
plot(AxialPositionMM, BeamWidth_20,'marker','square', 'MarkerFaceColor', 'black', 'linestyle','none')
plot(x_20, y_20_1, 'Color', 'red')
%%axis([(x_20(1)-8) (x_20(end)+8) 0.23 1.31])
grid on
title('Shearing Interferometer Fringe Angle: -20°')
xlabel('Axial Position (mm)')
ylabel('Beam Width (mm)')
hold off

nexttile
hold on
errorbar(AxialPositionMM, BeamWidth0, AxialPositionU, 'horizontal', 's')
errorbar(AxialPositionMM, BeamWidth0, BeamWidth0U, 's', 'Color', 'Magenta')
plot(AxialPositionMM, BeamWidth0,'marker','square', 'MarkerFaceColor', 'black', 'linestyle','none')
plot(x0, y0_1, 'Color', 'red')
%%axis([(x0(1)-8) (x0(end)+8) 0.42 1.49])
grid on
title('Shearing Interferometer Fringe Angle: 0°')
xlabel('Axial Position (mm)')
ylabel('Beam Width (mm)')
hold off

nexttile
hold on
errorbar(AxialPositionMM, BeamWidth20, AxialPositionU, 'horizontal', 's')
errorbar(AxialPositionMM, BeamWidth20, BeamWidth20U, 's', 'Color', 'Magenta')
plot(AxialPositionMM, BeamWidth20,'marker','square', 'MarkerFaceColor', 'black', 'linestyle','none')
plot(x20, y20_1, 'Color', 'red')
%%axis([(x20(1)-8) (x20(end)+8) 0.67 1.75])
grid on
title('Shearing Interferometer Fringe Angle: 20°')
xlabel('Axial Position (mm)')
ylabel('Beam Width (mm)')
hold off

nexttile
hold on
errorbar(AxialPositionMM, BeamWidth40, AxialPositionU, 'horizontal', 's')
errorbar(AxialPositionMM, BeamWidth40, BeamWidth40U, 's', 'Color', 'Magenta')
plot(AxialPositionMM, BeamWidth40,'marker','square', 'MarkerFaceColor', 'black', 'linestyle','none')
plot(x40, y40_1, 'Color', 'red')
%%axis([(x40(1)-8) (x40(end)+8) 1.25 2.33])
grid on
title('Shearing Interferometer Fringe Angle: 40°')
xlabel('Axial Position (mm)')
ylabel('Beam Width (mm)')
hold off

%exportgraphics(gcf,"figure3.png")

figure;
tiledlayout(2,3)
sgtitle('Slope Vizualization With Linear Regression (Method 2)')

nexttile
hold on
plot(x_40, y_40_2, 'Color', 'red')
%%axis([(x_40(1)-8) (x_40(end)+8) 0.17 1.25])
grid on
title('Shearing Interferometer Fringe Angle: -40°')
xlabel('Axial Position (mm)')
ylabel('Beam Width (mm)')
hold off

nexttile
hold on

plot(x_20, y_20_2, 'Color', 'red')
%%axis([(x_20(1)-8) (x_20(end)+8) 0.23 1.31])
grid on
title('Shearing Interferometer Fringe Angle: -20°')
xlabel('Axial Position (mm)')
ylabel('Beam Width (mm)')
hold off

nexttile
hold on
plot(x0, y0_2, 'Color', 'red')
%%axis([(x0(1)-8) (x0(end)+8) 0.42 1.49])
grid on
title('Shearing Interferometer Fringe Angle: 0°')
xlabel('Axial Position (mm)')
ylabel('Beam Width (mm)')
hold off

nexttile
hold on
plot(x20, y20_2, 'Color', 'red')
%%axis([(x20(1)-8) (x20(end)+8) 0.67 1.75])
grid on
title('Shearing Interferometer Fringe Angle: 20°')
xlabel('Axial Position (mm)')
ylabel('Beam Width (mm)')
hold off

nexttile
hold on
plot(x40, y40_2, 'Color', 'red')
%axis([(x40(1)-8) (x40(end)+8) 1.25 2.33])
grid on
title('Shearing Interferometer Fringe Angle: 40°')
xlabel('Axial Position (mm)')
ylabel('Beam Width (mm)')
hold off

%exportgraphics(gcf,"figure4.png")

figure;
tiledlayout(2,3)
sgtitle('Laser Beam Profile Using Linear Regression Slopes (Method 1)')

nexttile
hold on
plot(longx, longy_40_1, 'Color', 'red')
plot(longx, -longy_40_1, 'Color', 'red')
fill([longx, fliplr(longx)], [-longy_40_1, fliplr(longy_40_1)], 'r', 'FaceAlpha', 0.5, 'EdgeColor', 'none');
axis([0 3000 -10 10])
grid on
title('Shearing Interferometer Fringe Angle: -40°')
xlabel('Axial Position (mm)')
ylabel('Beam Width (mm)')
hold off

nexttile
hold on
plot(longx, longy_20_1, 'Color', 'red')
plot(longx, -longy_20_1, 'Color', 'red')
fill([longx, fliplr(longx)], [-longy_20_1, fliplr(longy_20_1)], 'r', 'FaceAlpha', 0.5, 'EdgeColor', 'none');
axis([0 3000 -10 10])
grid on
title('Shearing Interferometer Fringe Angle: -20°')
xlabel('Axial Position (mm)')
ylabel('Beam Width (mm)')
hold off

nexttile
hold on
plot(longx, longy0_1, 'Color', 'red')
plot(longx, -longy0_1, 'Color', 'red')
fill([longx, fliplr(longx)], [-longy0_1, fliplr(longy0_1)], 'r', 'FaceAlpha', 0.5, 'EdgeColor', 'none');
axis([0 3000 -10 10])
grid on
title('Shearing Interferometer Fringe Angle: 0°')
xlabel('Axial Position (mm)')
ylabel('Beam Width (mm)')
hold off

nexttile
hold on
plot(longx, longy20_1, 'Color', 'red')
plot(longx, -longy20_1, 'Color', 'red')
fill([longx, fliplr(longx)], [-longy20_1, fliplr(longy20_1)], 'r', 'FaceAlpha', 0.5, 'EdgeColor', 'none');
axis([0 3000 -10 10])
grid on
title('Shearing Interferometer Fringe Angle: 20°')
xlabel('Axial Position (mm)')
ylabel('Beam Width (mm)')
hold off

nexttile
hold on
plot(longx, longy40_1, 'Color', 'red')
plot(longx, -longy40_1, 'Color', 'red')
fill([longx, fliplr(longx)], [-longy40_1, fliplr(longy40_1)], 'r', 'FaceAlpha', 0.5, 'EdgeColor', 'none');
axis([0 3000 -10 10])
grid on
title('Shearing Interferometer Fringe Angle: 40°')
xlabel('Axial Position (mm)')
ylabel('Beam Width (mm)')
hold off

%exportgraphics(gcf,"figure5.png")

figure;
tiledlayout(2,3)
sgtitle('Laser Beam Profile Using Linear Regression Slopes (Method 2)')

nexttile
hold on
plot(longx, longy_40_2, 'Color', 'red')
plot(longx, -longy_40_2, 'Color', 'red')
fill([longx, fliplr(longx)], [-longy_40_2, fliplr(longy_40_2)], 'r', 'FaceAlpha', 0.5, 'EdgeColor', 'none');
axis([0 3000 -3000 3000])
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