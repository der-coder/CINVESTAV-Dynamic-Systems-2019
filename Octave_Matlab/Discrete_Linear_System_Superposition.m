% 2019-09-13

% Signals and Systems - Introduction to Discrete Time Sampling

% Superposition principle

% System parameters
k = 1.5; % Spring constant
b = 0.5; % Damper constant
x_0 = 0.5; % Initial position

F1 = 1; % Forcees F = F1 + F2
F2 = 2;
F_t = F1 + F2;

% Simulation setup
t_max= 5;
T_s = 0.01; % Sampling time
n_max = t_max / T_s; % Sampling index max value
t_x = linspace(0, t_max, n_max); % Sampling indices - array starts from t_x(1)
xt_d(1)=x_0; % Adjustment because arrays in octave/matlab start from 1
x1_d(1)=0.3*x_0;
x2_d(1)=0.7*x_0;
x12_d(1)=x_0;




% System equations
x_n = (x_0 - F/k) * exp(-k*t_x/b) + F/k; % Function of the system continuous time

% Discretization of the system
% Iterate over the discretised equation via Euler's method of integration

for n=1:n_max-1
  Ft_d(n)=F_t;
  xt_d(n+1) = xt_d(n) + (T_s/b) * (Ft_d(n) - k*xt_d(n));
  
  F1_d(n)=F1;
  x1_d(n+1) = x1_d(n) + (T_s/b) * (F1_d(n) - k*x1_d(n));
  
  F2_d(n)=F2;
  x2_d(n+1) = x2_d(n) + (T_s/b) * (F2_d(n) - k*x2_d(n));
  
  x12_d(n+1) = x1_d(n) + x2_d(n);
end

figure(30)
n_t=0:n_max-1; % Sampling index
t_n = T_s * n_t; % Real-time
plot(t_n,xt_d,'--r^',t_n, x12_d,'-ob')
xlabel('Real Time of discrete-system : [sec]')
ylabel('x(n-->t) : [m]')
grid on
legend('F = F_1 + F_2','F_1 and F_F2')