%Hw 3 #5
%Walter Coe

clear; clc;

global m g k R 

m = .75;
g = 9.81;
k = 25;
R = 1;

tFinal = 1.83;
stepSize = .01;

t = 0:stepSize:tFinal;

thetao = 5;
omegao = 0;

so = 0;
sdoto = 0;

initCond = [so, sdoto];

[t, y] = ode45('hw3_5_solve', t, initCond);

s = y(:,1);
sDot = y(:,2);

%thetaC = zeros(length(t));
thetaC = -5*cos(t) + thetao;

omega = 5*sin(t);
omegaDot = 5*cos(t);

for i = 1:length(t)
    
   N(i) = sqrt((m*(R*omega(i)^2 -  omegaDot(i)*s(i) - 2*omega(i)*sDot(i)))^2 + (m*g)^2);
    
end


figure(1); clf;



subplot(4,1,1);
plot(thetaC, s)
xlabel('theta (rad)')
ylabel('s (m)')

subplot(4,1,2);
plot(thetaC, N)
xlabel('theta (rad)')
ylabel('Normal (N)')

subplot(4,1,3);
plot(t, s)
xlabel('time (s)')
ylabel('s (m)')

subplot(4,1,4);
plot(t,N)
xlabel('time (s)')
ylabel('Normal (N)')


figure(2);clf;
plot(t, thetaC, t, omega, t, 2*pi);
legend('Theta Analytical');
xlabel('time (sec)');
ylabel('theta (rads)');

disp(['The absolute maximum of s in the first ' num2str(max(thetaC/pi),3) '*pi radians is ' num2str(max(abs(s)),3) ' meters.']);
disp(['The absolute maximum normal force in the first ' num2str(max(thetaC/pi),3) '*pi radians is ' num2str(max(abs(N)),3) ' newtons.']);