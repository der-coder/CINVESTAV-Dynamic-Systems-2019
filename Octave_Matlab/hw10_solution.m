clear all
close all 
clc

pkg load control

##num = [0.8 0.56 0.204];
##den = [1 0.7 0.24];
##
##sys = tf(num, den);
##
##figure (1)
##
####impulse(sys)
##
t = 0:0.01:20;
##
##h = 0.035*exp(-0.35*t).*sin(0.324 *t);
##
##plot(t,h,'k')



##SOLUTION IN CLASS

A = 0.204/0.24;

a = -0.35;
b = 0.34278;

l1 = -0.425;
l2 = 0.43395;

phi = atan(l1/l2);

##g = -2 * exp(a*t) .*(sin(b*t+phi)) + A;
h = -2 *a*exp(a*t).*(sin(b*t+phi)) + (-2*exp(a*t)*b.*(cos(b*t+phi)));

## CHIDENTREE

s1 = -0.35 + i * 0.342;
s2 = -0.35 - i * 0.342;

k1 = -0.425 + i * 0.434;
k2 = -0.425 - i * 0.434;

h0 = s1*k1*exp(s1*t) + s2*k2*exp(s2*t);


figure(20)
plot(t,h,'k',t,h0,'b')
legend()