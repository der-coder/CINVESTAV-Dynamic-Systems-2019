clear
clc
close all

m = 0.5;
damper_constant = 2;
spring_constant = 1;
friction_constant = 0.01;
g = 9.81;

t_max=10;
Ts = 0.01; % Sampling time
n_max = t_max/Ts;

A = 2;
u=1;

x0=0.0;
v0 = -0.5;

x1(1) = x0;
x2(1) = v0;

xP1(1) = A*x0;
xP2(1) = A*v0;

xp1(1) = A*x0;
xp2(1) = A*v0;

friction_force = friction_constant * m * g;

for n=1:n_max-1
  if x2(n) < 0
    f(n) = -friction_force;
    else
    f(n) = friction_force;
  endif
  
  Fp(n) = A*u;
  
  F(n) = u;
  
  x1(n+1) = x1(n) + Ts*x2(n);
  x2(n+1) = -((spring_constant * Ts/m)*x1(n))+((1-(damper_constant*Ts/m))*x2(n))+((Ts/m)*(F(n)-f(n)));
  
  xP1(n+1) = A*x1(n+1);
  xP2(n+1) = A*x2(n+1);
  
  xP(n+1) = xP1(n+1);
  
  % ---- Proportionality --- % i/p=A*f(n)
  
  
  xp1(n+1) = xp1(n) + Ts*xp2(n);
  
  xp2(n+1) = -((spring_constant*Ts/m)*xp1(n))+((1-(damper_constant*Ts/m))*xp2(n))+((Ts/m)*(Fp(n)-f(n)));
  
  xp(n+1) = xp1(n+1);
  
endfor

td = Ts*(0:(n_max-1));
figure(202)
plot(td,xp,'or',td,xP,'.b')
grid on
xlabel('Time : [sec]')
ylabel('x(n:t) : [sec]')
legend('f(Ax))','Af(x)')
