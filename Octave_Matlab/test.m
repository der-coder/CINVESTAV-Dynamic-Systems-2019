clear all
close all
clc

pkg load control


t = 0.0001:0.01:20;
y= zeros(2000,1);
i = 1;

for s = 0.0001:0.01:20;
  
  num = 0.5*s^4 + 0.5*0.002*s^3+(1+0.5*0.02*0.02)*s^2 + 0.002*s+0.02*0.02;
  
  den = ((0.5*s^2+2*s+1)*(s+0.7)+0.5*s^2+1)*(s^3+(0.02*0.02)*s);
  
  y(i) = num/den;
  i=i+1;
endfor

figure(1)

plot(y)