% '기계시스템공학과 205150339 김진민 로봇공학 궤적생성 과제 - Cubic'

tstart = 0;
tfinal = 4;
theta0 = -5;
thetaf = 80;
thetad0 = 0;
thetadf = 0;               % 조건으로 주어진 값

T = tfinal - tstart;
a0 = theta0;
a1 = thetad0;
a2 = (-3 * (theta0 - thetaf) - (2 * thetad0+thetadf )*T)/ T ^ 2;
a3 = (2 * (theta0 - thetaf) + (thetad0+thetadf )*T)/ T ^ 3;
                          % 계산으로 알 수 있는 값
                          
t = tstart:0.1:tfinal;    % 시간 범위 설정

y1 = a0 + a1.*t + a2.*t.^2 + a3.*t.^3;  % y1 : theta 함수값
y2 = a1 + 2*a2.*t + 3*a3.*t.^2;         % y2 : angular velocity 함수값
y3 = 2*a2 + 6*a3.*t;                    % y3 : angular accerlation 함수값

subplot(131), plot(t,y1);
title('Theta');
xlabel('Time(s)');
ylabel('Theta');
grid on                      % theta 그래프

subplot(132), plot(t,y2);
title('Angular vel.');
xlabel('Time(s)');
ylabel('Angular vel.');
grid on                      % angular velocity 그래프

subplot(133), plot(t,y3);
title('Angular acc.');
xlabel('Time(s)');
ylabel('Angular acc.');
grid on                      % angular accerlation 그래프

