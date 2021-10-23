clc; clear all; close all;

sample=200;
p=[ [-1115, -365, 500, 0, 0, 0, 0];
    [-1250, -365, 600, 0, 0, 0, 0];
    [-1250, -365, 500, 1, 0, 1.6*pi, 100];
    [-1250, -365, 500, 1, 1.6*pi, 3.2*pi, 100];
    [-1250, -365, 500, 1, 3.2*pi, 4.8*pi, 100];
    [-1250, -365, 500, 1, 4.8*pi, 6.4*pi, 100];
    [-1250, -365, 500, 1, 6.4*pi, 8*pi, 100];
    [-1115, -365, 500, 0, 0, 0, 0];
];

[x, y, z] = gen_plan(p, sample);
[th1, th2, th3] = inv_ki(x, y, z);

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
sgt = sgtitle('small circle','Color','red')
sgt.FontSize = 20;

figure
plot3(x,y,z,'ko')

dt=0.01; Lt=length(th1)*dt-dt;
t = [0:dt:length(th1)*dt-dt]';
M1 = [t th1'];
M2 = [t th2'];
M3 = [t th3'];

dlmwrite('M1.txt', M1, 'precision', '%.4f')
dlmwrite('M2.txt', M2, 'precision', '%.4f')
dlmwrite('M3.txt', M3, 'precision', '%.4f')