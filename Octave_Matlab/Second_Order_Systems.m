% 2019-10-18
% AUTHOR: ISAAC AYALA LOZANO
% TOPIC: 2ND ORDER SYSTEMS

close all
clear all
clc 

%  SIMULATION CONDITIONS

t_max = 20; % MAXIMUM SIMULATION TIME
Ts = 0.01; % SAMPLING TIME
N = t_max / Ts; % FIND TOTAL ITERATION STEPS
t = linspace(0,t_max, N);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 
%
%         CASE 1: b^2 > 4*m*k
%       REAL NON-REPEATED ROOTS
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

b = 2;
k = 1;
m = 0.5;

s1 = (-b + sqrt((b^2)-4*m*k))/(2*m);
s2 = (-b - sqrt((b^2)-4*m*k))/(2*m);

c1 = -s2/(s2-s1);
c2 = s1/((s2-s1)*k);

A = 1;

% TIME DOMAIN
x1 = c1*exp(s1*t) + c2*exp(s2*t) + A;

figure(1)
plot(t,x1)
xlabel("Time: [sec.]")
ylabel("x(t): [m]")
title("Case #1")

% FREQUENCY DOMAIN

xs1 = [1];  % SYSTEM OUTPUT
us1 = [m b k]; % SYSTEM INPUT
gs1 = tf(xs1, us1); % TRANSFER FUNCTION

figure(11)
step(gs1) 


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 
%
%         CASE 2: b^2 = 4 mk
%           REPEATED ROOTS
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

b = 2;
k = 1;
m = 1;

s = (-b + sqrt((b^2)-4*m*k))/(2*m);

c1 = -1;
c2 = s;
A = 1;

% TIME DOMAIN
x2 = c1*exp(s1*t) + c2*t.*exp(s2*t) + A;

figure(2)
plot(t,x2)
xlabel("Time: [sec.]")
ylabel("x(t): [m]")
title("Case #2")

% FREQUENCY DOMAIN

xs1 = [1];  % SYSTEM OUTPUT
us1 = [m b k]; % SYSTEM INPUT
gs2 = tf(xs1, us1); % TRANSFER FUNCTION

figure(12)
step(gs2,t_max) 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 
%
%         CASE 3: b^2 < 4 mk
%     COMPLEX NUMBERS IN ROOTS
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

b = 2;
k = 1;
m = 2;

s1 = (-b + sqrt((b^2)-4*m*k))/(2*m);
s2 = (-b - sqrt((b^2)-4*m*k))/(2*m);

c1 = s1;
c2 = s2;
A = 1;

% TIME DOMAIN
x3 = c1*exp(s1*t) + c2*exp(s2*t) + A;

figure(3)
plot(t,x3)
xlabel("Time: [sec.]")
ylabel("x(t): [m]")
title("Case #3")

% FREQUENCY DOMAIN

xs1 = [1];  % SYSTEM OUTPUT
us1 = [m b k]; % SYSTEM INPUT
gs3 = tf(xs1, us1); % TRANSFER FUNCTION

figure(13)
step(gs3,t_max) 


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 
%
%         CASE 4: b = 0
%     NO DAMPING IN THE SYSTEM
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

b = 0;
k = 1;
m = 2;

s1 = (-b + sqrt((b^2)-4*m*k))/(2*m);
s2 = (-b - sqrt((b^2)-4*m*k))/(2*m);

c1 = -0.5;
c2 = -0.5;
A = 1;

% TIME DOMAIN
x4 = c1*exp(s1*t) + c2*exp(s2*t) + A;

figure(4)
plot(t,x4)
xlabel("Time: [sec.]")
ylabel("x(t): [m]")
title("Case #4")

% FREQUENCY DOMAIN

xs1 = [1];  % SYSTEM OUTPUT
us1 = [m b k]; % SYSTEM INPUT
gs4 = tf(xs1, us1); % TRANSFER FUNCTION

figure(14)
step(gs4,t_max) 