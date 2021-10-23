clc; clear all; close all;
sample=200;

th = linspace(0,90,sample);
x1 = 1420*cosd(th);
y1_1 = 0*ones(1,50);
y1_2 = linspace(0,-100,sample-50);
y1 = [y1_1 y1_2];
z1 = 1420*sind(th)+180;   % 3초 쭉편 상태로
ins_v=[x1;y1;z1];

p=[ [1425, 0, 180, 0, 0, 0, 0];
    [1420, 0, 180, 0, 0, 0, 0];
    [0, -100, 1590, 0, 0, 0, 0];
    [-1115, -365, 500, 0, 0, 0, 0]; ]; %3초  준비자세 변신

[x, y, z]=gen_plan(p, sample);
pos=1;
x(pos*sample+1:(pos+1)*sample)=x1;
y(pos*sample+1:(pos+1)*sample)=y1;
z(pos*sample+1:(pos+1)*sample)=z1;
[th1, th2, th3]=inv_ki(x, y, z);

subplot(2,2,1);
plot3(x,y,z,'ko')
title('x-y-z space');
xlabel('x'); ylabel('y'); zlabel('z');
grid on
subplot(2,2,2);
plot(x,y,'ko')
title('x-y plane');
xlabel('x'); ylabel('y');
grid on
subplot(2,2,3);
plot(y,z,'ko')
title('y-z plane');
xlabel('y'); ylabel('z');
grid on
subplot(2,2,4);
plot(x,z,'ko')
title('x-z plane');
xlabel('x'); ylabel('z');
grid on
sgt = sgtitle('transform','Color','red')
sgt.FontSize = 20;

dt=0.01; Lt=length(th1)*dt-dt;
t = [0:dt:length(th1)*dt-dt]';
M1 = [t th1'];
M2 = [t th2'];
M3 = [t th3'];

dlmwrite('M1_TL.txt', M1, 'precision', '%.4f')
dlmwrite('M2_TL.txt', M2, 'precision', '%.4f')
dlmwrite('M3_TL.txt', M3, 'precision', '%.4f')