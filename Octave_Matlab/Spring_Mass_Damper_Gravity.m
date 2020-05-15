## SPRING MASS DAMPER SYSTEM WITH GRAVITY

clear all
close all
clc

pkg load control

m = 0.5;
g = 9.81;
k = 1.0;
b = 2.0;
w_n = sqrt(k/m);

a = [1+m*g];
b = [m, b, k];

sys = tf(a,b);

figure(1)
bode(sys)
