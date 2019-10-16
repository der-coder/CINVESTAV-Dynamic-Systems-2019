% 2019 - 09 - 27

% DYNAMIC SYSTEMS - HOMEWORK 03

% SPRING MASS DAMPER SYSTEM WITH FRICTION

% --------------

% INITIALIZATION CONDITIONS

mass = 0.5;
spring_constant = 1;
damper_constant = 2;
friction_constant = 0.01;
gravity = 9.81;  % [m/s^2]
F = 1;

t_max = 5;
t_sampling = 0.01;

n_max = t_max / t_sampling;

% --------------

% Functions

% Discretize x -> x_d
% Discretize Force F-> F_d

x_0 = 0; % Initial position
dx_0 = -0.5; % Initial velocity

% State variables

x_1(1) = x_0;

x_2(1) = dx_0;

% Discretized function

for n = 1:n_max-1
  x_1(n+1) = (x_2(n) * t_sampling) + x_1(n);
  x_2(n+1) = t_sampling * (-(damper_constant/mass)*x_2(n)-(spring_constant/mass) * x_1(n)+ F/mass- friction_constant * gravity) + x_2(n);
  
  % x_sonia(n)= -0.74*exp(-3.414*n) + 0.75*exp(-0.586*n) + 0.99; % WRONG!
  
  x_jonatan(n)= 0.95 + 0.3733*exp(-3.414 * n) - 1.324 * exp(-0.5857 * n);
endfor

% Plotting

n_t = 0:n_max -1;

t_n = t_sampling * n_t;

plot(t_n, x_1,x_jonatan,'br')
grid on

% --------------

