## HOMEWORK #07
## DYNAMIC SYSTEMS

## ISAAC AYALA

##CLEAR WORKSPACE
close all
clear all
clc

##LOAD DATA FROM .MAT FILE
load('DyImpulseResp01.mat');

## DATA EXPLANATION
## t_f Sampling time for each data measurement
## y Measured output for the impulse response of the system
## u Measure input for the impulse response of the system

## THE IMPULSE REPONSE Y OF THE SYSTEM IS USED AS h(m) FOR THE CONVOLUTION

n_max = size(y,2);

for m = 1:

