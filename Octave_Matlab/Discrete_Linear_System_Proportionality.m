% 2019-09-13

% Signals and Systems - Introduction to Discrete Time Sampling

% Superposition principle

% System parameters
k = 1.5; % Spring constant
b = 0.5; % Damper constant
x_0 = 0.5; % Initial position

F = 3; % Forcees F = F1 + F2

a = 2;

% Simulation setup
t_max= 5;
T_s = 0.01; % Sampling time
n_max = t_max / T_s; % Sampling index max value
x_d(1)=x_0; % Adjustment because arrays in octave/matlab start from 1
xa_d(1)=x_0*a;

% System equations
x_n = (x_0 - F/k) * exp(-k*t_x/b) + F/k; % Function of the system continuous time

% Discretization of the system
% Iterate over the discretised equation via Euler's method of integration

for n=1:n_max-1
  F_d(n)=F_t;
  x_d(n+1) = x_d(n) + (T_s/b) * (F_d(n) - k*x_d(n));

  Fa_d(n) = a*F;
  xa_d(n+1) = xa_d(n) + (T_s/b) * (Fa_d(n) - k*xa_d(n));
  
  
  
end

figure(40)
n_t=0:n_max-1; % Sampling index
t_n = T_s * n_t; % Real-time
plot(t_n,xt_d*a,'--r^',t_n, xa_d,'-ob')
xlabel('Real Time of discrete-system : [sec]')
ylabel('x(n-->t) : [m]')
grid on
legend('F = F','a F')