function [th1, th2, th3]=inv_ki(x, y, z)
l2 = 725; l3 = 700;
th1_r = atan2(y,x);
r = x.*cos(th1_r) + y.*sin(th1_r);
s = z-180;
d = ((r.^2 + s.^2) - (l2^2 + l3^2))./(2*l2*l3);
th3_r = atan2(-sqrt(1-(d.^2)),d);
th2_r = atan2(s,r) - atan2(l3*sin(th3_r),l2+l3*cos(th3_r));

th1 = rad2deg(th1_r);
th2 = rad2deg(th2_r);
th3 = rad2deg(th3_r);
end