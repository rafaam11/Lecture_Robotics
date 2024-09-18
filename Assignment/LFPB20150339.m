% '기계시스템공학과 205150339 김진민 로봇공학 궤적생성 과제 - LFPB'

t0 = 0;
tf = 4;
q0 = -5;
qf = 80;
dq0 = 0;
dqf = 0;
aa = 30;
vv = 25;           % 조건으로 주어진 값

ta = vv/aa;
tb = tf - ta;
lqal = 0.5*ta*vv;
qa = q0 + lqal;
qb = qf - lqal;      % 계산을 통해 알 수 있는 값

k = (qa - q0) / (ta^2);   
a = (qb-qa)/(tb-ta);
b = qa - a*ta;
c = (qb-qf)/(tb-tf)^2;
d = dqf + aa*tf;       % 그래프를 그리기 위한 변수 묶음들

t = t0:0.001:tf;       % 시간 범위 설정

y1 = k.*t.^2 + q0;
y2 = a.*t +b;
y3 = c*(t-tf).^2 + qf;  % y1~y3 : theta 함수값
y4 = aa.*t;
y5 = vv;
y6 = -aa.*t + d;        % y4~y6 : angular velocity 함수값
y7 = aa;
y8 = 0;
y9 = -aa;               % y7~y9 : angular accerlation 함수값

q = (y1).*((t>=t0)-(t>=ta)) + (y2).*((t>=ta)-(t>=tb)) + (y3).*((t>=tb)-(t>tf));
subplot(131), plot(t,q);
title('Theta');
xlabel('Time(s)');
ylabel('Theta');
grid on;   % theta 그래프

qq = (y4).*((t>=t0)-(t>=ta)) + (y5).*((t>=ta)-(t>=tb)) + (y6).*((t>=tb)-(t>tf));
subplot(132), plot(t,qq);
title('Angular vel.');
xlabel('Time(s)');
ylabel('Angular vel.');
grid on;   % angular velocity 그래프

qqq = (y7).*((t>=t0)-(t>=ta)) + (y8).*((t>=ta)-(t>=tb)) + (y9).*((t>=tb)-(t>tf));
subplot(133), plot(t,qqq);
title('Angular acc.');
xlabel('Time(s)');
ylabel('Angular acc.');
grid on;   % angular accerlation 그래프
