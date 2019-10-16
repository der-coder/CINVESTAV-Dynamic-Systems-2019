% Second Order Discrete Linear System
% Isaac Ayala 

% Discretization of the equation y'' + 2.5 y + 1 = unitStep

% Initial Conditions for state variables

x1(1) = 0;
x2(1) = -0.2;

% Simulation setup
t_max = 5;
T_s = 0.01; % Sampling time
n_max = t_max / T_s; % Sampling index max value
t_x = linspace(0,t_max,n_max);

% Numeric integration loop

for n=1:n_max - 1
  x1(n+1) = x1(n) + x2(n)*T_s;
  x2(n+1) = x2(n) - 2.5 * T_s * x1(n);
endfor

figure(1)
nt = 0:n_max - 1;
tn = T_s * nt;
plot(t_x,x1,'b')
grid on;
xlabel('Real-Time of discrete system: [sec]');
ylabel('x(n-->t): [m]');
legend('x_Discrete');