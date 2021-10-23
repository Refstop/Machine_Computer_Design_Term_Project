clc; clear all; close all;
sample=300;

th = linspace(0,90,200);
x1 = 1410*cosd(th);
y1 = 0*ones(1,200);
z1 = 1410*sind(th)+180;

x2 = linspace(0,-1115,sample);
y2 = linspace(0,-365,sample);
z2 = linspace(1590,500,sample);

p=[ [-1115,-365,500, 0, 0, 0, 0];
    [-950, 155, 86, 0, 0, 0, 0];
    [-950, 200,-400, 0, 0, 0, 0];
    [-950, 200, 0, 0, 0, 0, 0];
    [-1350, -200, 0, 0, 0, 0, 0];
    [-1350, -200, 400, 0, 0, 0, 0];
    [-950, 200, 400, 0, 0, 0, 0];
    [-950, 200, 800, 0, 0, 0, 0];
    [-1115,-365,500, 0, 0, 0, 0]; ];

[x, y, z] = gen_plan(p, sample);
[r_x, r_y, r_z] = readymotion(p(1,:), length(x), sample);
[th1, th2, th3] = inv_ki(x, y, z);
[r_th1, r_th2, r_th3] = inv_ki(r_x, r_y, r_z);

%% surface
figure
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
sgt = sgtitle('surface','Color','red')
sgt.FontSize = 20;

%% ready motion
figure
subplot(2,2,1);
plot3(r_x,r_y,r_z,'ko')
title('x-y-z space');
xlabel('x'); ylabel('y'); zlabel('z');
grid on
subplot(2,2,2);
plot(r_x,r_y,'ko')
title('x-y plane');
xlabel('x'); ylabel('y');
grid on
subplot(2,2,3);
plot(r_y,r_z,'ko')
title('y-z plane');
xlabel('y'); ylabel('z');
grid on
subplot(2,2,4);
plot(r_x,r_z,'ko')
title('x-z plane');
xlabel('x'); ylabel('z');
grid on
sgt = sgtitle('ready motion','Color','red')
sgt.FontSize = 20;


dt=0.01; Lt=length(th1)*dt-dt;
t = [0:dt:length(th1)*dt-dt]';
M_R1 = [t th1'];
M_R2 = [t th2'];
M_R3 = [t th3'];

M_L1 = [t r_th1'];
M_L2 = [t r_th2'];
M_L3 = [t r_th3'];

dlmwrite('M_L1.txt', M_L1, 'precision', '%.4f')
dlmwrite('M_L2.txt', M_L2, 'precision', '%.4f')
dlmwrite('M_L3.txt', M_R3, 'precision', '%.4f')
dlmwrite('M_R1.txt', M_R1, 'precision', '%.4f')
dlmwrite('M_R2.txt', M_R2, 'precision', '%.4f')
dlmwrite('M_R3.txt', M_R3, 'precision', '%.4f')

