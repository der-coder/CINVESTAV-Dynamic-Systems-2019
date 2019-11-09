##BODE PLOTS
##2019 - 11 -07
clear all
close all
clc

pkg load control

z = 0.5;
m = 0.5;
b = -2;
k = 1;

num = [1, z];
den = [m, b, k];

G = tf(num, den);

figure(1)
bode(G)
grid on

figure(2)
rlocus(G)

figure(3)
nyquist(G)

figure(4)
step(G)
