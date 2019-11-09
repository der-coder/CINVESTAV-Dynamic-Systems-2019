## HOMEWORK #08
## DYNAMIC SYSTEMS

## RC CIRCUIT 
## OUTPUT FUNCTION FROM MEASURED DATA

## ISAAC AYALA

## THIS .M FILE IS ONLY TESTED FOR OCTAVE!

## CLEAR WORKSPACE
close all
clear all
clc

pkg load optim
##THE optim PACKAGE IS REQUIRED FOR CURVE FITTING

## LOAD DATA FROM .MAT FILE
load('DyImpulseResp01.mat');

## u Measured input for the impulse response of the system
Ts = t_f;
## t_f Sampling time for each data measurement
h = y;
## y Measured output for the impulse response of the system

C = 4.7e-6;
R = 50e3;
## RESISTOR AND CAPACITOR VALUES FOR V_MAX
h0 = 1/(R*C);
h(1) = h0;
Ts(1) = 0;

n = size(h,2);
stepResponse = [];
stepResponse(1,:) = [0,0];

temp = 0;

for m = 1:n
## THE IMPULSE RESPONSE Y OF THE SYSTEM IS USED AS h(m) FOR THE CONVOLUTION  
  temp = temp + h(m);
  stepResponse(m,:) = [m,temp*Ts(m)];
endfor

## CURVE FITTING 
 leasqrfunc = @(x, p) p(1) + p(2)*exp (-p(3) * x);
 pin = [0.8;-0.6;0.06];
 [f, p] = leasqr(stepResponse(:,1),stepResponse(:,2),pin,leasqrfunc);
 
##  f CONTAINS ALL OUTPUT VALUES OF THE FUNCTION FOR THE TIME INTERVAL
## p CONTAINS THE VALUES FOR THE CONTSTANTS IN THE PROPOSED CURVE A+B*exp(-C*m)
 
 d = stepResponse(:,1);
 
## PLOT VALUES

plt = figure(1,"position",get(0,"screensize"));
plot(d,stepResponse(:,2),'-+','LineWidth',2,d,f,"k","LineWidth",3)
title('Step Response of a physical RC system from measured data','fontsize',26);
xlabel('Index m','fontsize',20);
ylabel('Output Response : [V]','fontsize',20);
set(legend({'x[m]',"f(m)=0.8340 -0.8239 * exp(-0.0788*m)"},"location","south"),"fontsize",20)
legend boxoff
set(gcf, 'Color', [1 1 1])

## COMMENT OUT THE FOLLOWING LINE TO PRINT THE PLOT
##print("myfile.png","-S1080,720")

