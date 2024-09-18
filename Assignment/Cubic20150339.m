% '���ý��۰��а� 205150339 ������ �κ����� �������� ���� - Cubic'

tstart = 0;
tfinal = 4;
theta0 = -5;
thetaf = 80;
thetad0 = 0;
thetadf = 0;               % �������� �־��� ��

T = tfinal - tstart;
a0 = theta0;
a1 = thetad0;
a2 = (-3 * (theta0 - thetaf) - (2 * thetad0+thetadf )*T)/ T ^ 2;
a3 = (2 * (theta0 - thetaf) + (thetad0+thetadf )*T)/ T ^ 3;
                          % ������� �� �� �ִ� ��
                          
t = tstart:0.1:tfinal;    % �ð� ���� ����

y1 = a0 + a1.*t + a2.*t.^2 + a3.*t.^3;  % y1 : theta �Լ���
y2 = a1 + 2*a2.*t + 3*a3.*t.^2;         % y2 : angular velocity �Լ���
y3 = 2*a2 + 6*a3.*t;                    % y3 : angular accerlation �Լ���

subplot(131), plot(t,y1);
title('Theta');
xlabel('Time(s)');
ylabel('Theta');
grid on                      % theta �׷���

subplot(132), plot(t,y2);
title('Angular vel.');
xlabel('Time(s)');
ylabel('Angular vel.');
grid on                      % angular velocity �׷���

subplot(133), plot(t,y3);
title('Angular acc.');
xlabel('Time(s)');
ylabel('Angular acc.');
grid on                      % angular accerlation �׷���

