clear;
clc;
close all;


data = load('30degL.dat');
t = data(:,1);
theta = 180*data(:,2)/pi;
phi = 180*data(:,3)/pi;
clear data;
N = length(t);



% Determine sample rate and Nyquist frequency.
dt = mean(diff(t));
fs = 1/dt;
fn = fs/2;

phi_d = zeros([N,1]);
theta_d = zeros([N,1]);

phi_dd = zeros([N,1]);
theta_dd = zeros([N,1]);


%Calculate Rates
for j = 2:N-1
    phi_d(j) = mean(phi(j+1) - phi(j-1))/(t(j+1) - t(j-1));
    theta_d(j) = mean(theta(j+1) - theta(j-1))/(t(j+1) - t(j-1));
end

phi_d(1) = phi_d(2);
phi_d(N) = phi_d(N - 1);
theta_d(1) = theta_d(2);
theta_d(N) = theta_d(N - 1);

%Calculate Rates
for j = 2:N-1
    phi_dd(j) = mean(phi_d(j+1) - phi_d(j-1))/(t(j+1) - t(j-1));
    theta_dd(j) = mean(theta_d(j+1) - theta_d(j-1))/(t(j+1) - t(j-1));
end

phi_dd(1) = phi_dd(2);
phi_dd(N) = phi_dd(N - 1);
theta_dd(1) = theta_dd(2);
theta_dd(N) = theta_dd(N - 1);

% Filter data with a using a 3rd order Butterworth filter with a cutoff
% frequency of 10 Hz.
fc = 10;
[B,A] = butter(3,fc/fn);
phi_f = filtfilt(B,A,phi);
theta_f = filtfilt(B,A,theta);
phi_d_f = filtfilt(B,A,phi_d);
theta_d_f = filtfilt(B,A,theta_d);
phi_dd_f = filtfilt(B,A,phi_dd);
theta_dd_f = filtfilt(B,A,theta_dd);

for j = 1:N
    phi_calc(j) = 1.2*sin(8*t(j));
    
    if t(j) > 3
        phi_calc(j) = 0;
    end
end

figure(1); clf;
plot(t, phi_d_f, t, phi_f);
legend('phidot(t)', 'phi(t)');
hold on
plot(t, phi_calc, 'r')

%pause;

figure(2); clf;
subplot(2,1,1)
plot(phi_d_f, phi_dd_f);
legend('phiddot(phidot)')
subplot(2,1,2);
plot(phi_f, phi_dd_f);
legend('phiddot(phi)');

figure(3); clf;
plot(t, theta_d_f, t, theta_f);
legend('thetadot(t)', 'theta(t)');

figure(4); clf;
subplot(2,1,1);
plot(theta_d_f, theta_dd_f);
legend('thetaddot(thetadot)');

subplot(2,1,2);
plot(theta_f, theta_dd_f);
legend('thetaddot(theta)');
grid on
hold on

P = polyfit(theta_f, theta_dd_f, 1)
plot(theta_f, P(1)*theta_f + P(2),'g*')

comp2 = .0165;
I2xx = 1.7983745e-03*comp2;
m2 = .115567*comp2;
h2 = .090938791;
g = 9.81;

for i = 1:N
    
    Q1(i) = I2xx*theta_dd_f(i) + (1/2)*h2*m2*g*sind(theta_f(i));
    
end

figure(5); clf;
plot(theta_f, Q1, 'r');
legend('Q1');
xlabel('theta');
ylabel('Q1');
grid on;
hold on;
Q = polyfit(theta_f, Q1', 1)
plot(theta, Q(1)*theta + Q(2))


figure(6); clf;
plot(theta_d_f, phi_d_f)
Qt = polyfit(phi_d_f,theta_d_f, 1)
hold on
plot(t,1.5*sin(t))

%plot(theta_d_f, Qt(1)*theta_d_f + Q(2))

% 
% 
% % Plot initial data.
% figure(1);
% plot(t,phi,'k',t,theta,'r');
% xlabel('t (s)');
% ylabel('Angle (deg)');
% legend('\phi (measured)','\theta (measured)');
% 
% num = 34;
% 
% % Select response start time by clicking on the plot.
% Pos = ginput(num);
% 
% % Plot initial data.
% figure(1);
% plot(t, phi_d, t, theta_d);
% xlabel('t (s)');
% ylabel('Angle (deg)');
% legend('\phi (measured)','\theta (measured)');
% 
% % Select response start time by clicking on the plot.
% S = ginput(num);
% 
% for i = 1:num
%     Pos(i,3) = abs(Pos(i,2));
%     S(i,3) = abs(S(i,2));
% end  
