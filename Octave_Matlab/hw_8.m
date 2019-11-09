%  HOMEWORK #07
%  DYNAMIC SYSTEMS

%  ISAAC AYALA

% CLEAR WORKSPACE
close all
clear all
clc

% LOAD DATA FROM .MAT FILE
load('DyImpulseResp01.mat');

%  u Measured input for the impulse response of the system
Ts = t_f;
%  t_f Sampling time for each data measurement
h = y;
%  y Measured output for the impulse response of the system

C = 4.7e-6;
R = 50e3;
%  RESISTOR AND CAPACITOR VALUES FOR V_MAX
h0 = 1/(R*C);
h(1) = h0;
Ts(1) = 0;

n = size(h,2);
stepResponse = [];
stepResponse(1,:) = [0,0];

temp = 0;

for m = 1:n
% ## THE IMPULSE REPONSE Y OF THE SYSTEM IS USED AS h(m) FOR THE CONVOLUTION  
  temp = temp + h(m);
  stepResponse(m,:) = [m,temp*Ts(m)];
end

% ft = fittype('a+b*exp(c*x)');

% fit(stepResponse(:,1),stepResponse(:,1),ft)

figure(1)
plot(stepResponse(:,1),stepResponse(:,2),'-+','LineWidth',2)
xlabel('Index m','fontsize',14);
ylabel('Output Response x(m)','fontsize',14);
title('Step Response of a physical RC system from measured data','fontsize',16);
set(gcf, 'Color', [1 1 1])
legend('x(m)')


