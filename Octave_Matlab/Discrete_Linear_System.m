% 2019-09-13

% Signals and Systems - Introduction to Discrete Time Sampling
% Time Resp. linear system #0

% System parameters
k = 1.5; % Spring constant
b = 0.5; % Damper constant
x_0 = 0.5; % Initial position
F = 2; % Constant force

% Simulation setup
t_max= 5;
T_s = 0.01; % Sampling time
n_max = t_max / T_s; % Sampling index max value
t_x = linspace(0, t_max, n_max); % Sampling indices - array starts from t_x(1)

% System equations
x_n = (x_0 - F/k) * exp(-k*t_x/b) + F/k; % Function of the system

% Plots
%figure(10)
% plot(t_x,x_n)
%xlabel('Time : [sec]')
%ylabel('x(t) : [m]')
%grid on

%figure(11)
% stairs(x_n)
%xlabel('Sampling-time index : n')
%ylabel('x(n) : [m]')
%grid on

% --------------------

% Discrete-time system (Zero Order Hold)
% x-->x_d
% F-->F_d

x_d(1)=x_0;

for n=1:n_max-1
  F_d(n)=F;
  x_d(n+1) = x_d(n) + (T_s/b) * (F_d(n) - k*x_d(n));
end

figure(20)
% stairs(x_d)
n_t=0:n_max-1; % Sampling index
t_n = T_s * n_t; % Real-time
plot(t_n,x_d)
% plot(t_n,x_d,'b',t_x,x_n,'r')
 xlabel('Real Time of discrete-system : [sec]')
 ylabel('x(n-->t) : [m]')
 grid on
% legend('x_{Disc}','x-{Cont}')