clc
close all
clear all

pkg load control

num1 = [0.5 0.0001 1.0002 0.0002 0.0004];

den1 = [0.5 2.35 2.4002 0.70094 0.00096 0.00028 0];

sys1 = tf(num1, den1)

num2 = [0.5 2.35 2.9 0.7 1];

den2 = [0.5 2.35 2.4 0.7 0 0];

sys2 = tf(num2, den2)

sys3 = sys1/sys2