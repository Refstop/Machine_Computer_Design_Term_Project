function [r_x, r_y, r_z] = readymotion(set, len, sample)
r_p1=[-691, 0, 911];
r_x1=linspace(set(1), r_p1(1), sample);
r_y1=linspace(set(2), r_p1(2), sample);
r_z1=linspace(set(3), r_p1(3), sample);
r_x2=linspace(r_p1(1), r_p1(1), len-2*sample);
r_y2=linspace(r_p1(2), r_p1(2), len-2*sample);
r_z2=linspace(r_p1(3), r_p1(3), len-2*sample);
r_x3=linspace(r_p1(1), set(1), sample);
r_y3=linspace(r_p1(2), set(2), sample);
r_z3=linspace(r_p1(3), set(3), sample);

r_x = [r_x1 r_x2 r_x3];
r_y = [r_y1 r_y2 r_y3];
r_z = [r_z1 r_z2 r_z3];
end
