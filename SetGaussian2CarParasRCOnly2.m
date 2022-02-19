%JInseng Vanderkloot 101031534
%Modified File 

Coupled = 1;
%Wheather the meterial is conducting 
TwoCarriers = 1;
%only n-type concentration 
RC = 1;
%Adds a time to inject 

nx = 201;
l = 1e-6;

x =linspace(0,l,nx);
dx = x(2)-x(1);
xm = x(1:nx-1) + 0.5*dx;

    %Original
%Nd = 1e16 * 1e6; % Const. 1/cm3 (100 cm/m)^3

    %Linear
%Nd = linspace(1e16 * 1e6,20e16 * 1e6,nx);

%This is shown by the n distribution in the material. The elctrons are 
% linear over the material space.The volatge also show the charge from the 
% density of the electrons in the area.

    %Exponential 
Nd = logspace(16,17,nx)* 1e6;

%This is the attempt to have a exponential doping gradient ND. The doping
%can be seen by the n-type plot and the p-plot tried to adjust to oppose
%this doping as it should. The volatge adjusts to compensate for the doping


NetDoping = ones(1,nx).*Nd; % doping

x0 = l/2;
nw = l/20;
%npDisturbance = 1e16*1e6*exp(-((x-x0)/nw).^2);
npDisturbance =0; %No Disturbance - No extra added holes and 
% the p material shape plot now can properly be opposite linearly to the
% n doping which is expected.  
LVbc = 0;
RVbc = 0;

TStop = 14200000*1e-18;
PlDelt = 100000*1e-18;

% PlotYAxis = {[-1e-15 2e-15] [-2e-9 2e-9] [-1.5e-12 1.5e-12]...
%     [1e22 2e22] [0 1e22] [0 20e43]...
%     [-20e33 15e33] [-2.5e34 2e34] [-1.1e8 1.1e8] ...
%     [-1e8 1e8] [-10e-3 10e-3] [0 2e22]};

doPlotImage = 0;
PlotFile = 'Gau2CarRC.gif';
