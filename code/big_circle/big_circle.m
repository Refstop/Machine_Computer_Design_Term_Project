clc; clear all; close all;

sample=200;
p=[ [-1115, -365, 500, 0, 0, 0, 0];
    [0, 0, 1600, 0, 0, 0, 0];
    [0, 0, 180, 1, 0, pi/2, 1420];
    [0, 0, 180, 1, pi/2, 0, 1420];
    [0, 0, 180, 1, 0, pi/2, 1420];
    [0, 0, 180, 1, pi/2, 0, 1420];
    [-1115, -365, 500, 0, 0, 0, 0];
    ];

[x, y, z] = gen_plan(p, sample);
[th1, th2, th3] = inv_ki(x, y, z);
th1(2*sample+1:3*sample)=linspace(0,90,sample);

subplot(2,2,1);
plot3(x,y,z, 'ko')
title('x-y-z space');
xlabel('x'); ylabel('y'); zlabel('z');
grid on
subplot(2,2,2);
plot(x,y, 'ko')
title('x-y plane');
xlabel('x'); ylabel('y');
grid on
subplot(2,2,3);
plot(y,z, 'ko')
title('y-z plane');
xlabel('y'); ylabel('z');
grid on
subplot(2,2,4);
plot(x,z, 'ko')
title('x-z plane');
xlabel('x'); ylabel('z');
grid on
sgt = sgtitle('big circle','Color','red')
sgt.FontSize = 20;

dt=0.01; Lt=length(th1)*dt-dt;
t = [0:dt:length(th1)*dt-dt]';
M1 = [t th1'];
M2 = [t th2'];
M3 = [t th3'];

dlmwrite('M1_BL.txt', M1, 'precision', '%.4f')
dlmwrite('M2_BL.txt', M2, 'precision', '%.4f')
dlmwrite('M3_BL.txt', M3, 'precision', '%.4f')