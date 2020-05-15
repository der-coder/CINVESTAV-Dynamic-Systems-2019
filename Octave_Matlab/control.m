%% Exercise prior to exam

clear all
close all
clc

pkg load control

G = tf([0,0,1],[0.5, 2, 1]);

C = tf([0.5, 0, 1],[0,1,0.7]);

D = tf([0,0,0.1*0.02],[1,0,(0.02*0.02)]);

R = tf([0,1],[1,0]);

Y = (G * C *(R + D))/(1+G*C);

H = ((G*C)/(1+G*C)) + ((G*C*D)/(R*(1+G*C)));


figure(1)

step(Y/R,50);

Yz = (G * C) /(1+G*C);

Yr = (G * C *(R))/(1+G*C);

Yd = (G * C *(D))/(1+G*C);

Yt = Yr/R + Yd/D +Yz;

figure(2)

step(Yt);