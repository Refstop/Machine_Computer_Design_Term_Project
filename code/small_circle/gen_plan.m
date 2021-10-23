function[x, y, z] = gen_plan(p, sample)
x=[]; y=[]; z=[];
for i=1:length(p(:,1))-1
    if p(i,4) == 0 
        if p(i+1,4) == 0
            px=linspace(p(i,1), p(i+1,1), sample);
            py=linspace(p(i,2), p(i+1,2), sample);
            pz=linspace(p(i,3), p(i+1,3), sample);
        elseif p(i+1,4) ~= 0
            th = linspace(p(i+1,5),p(i+1,6),sample);
            px = p(i+1,1)*ones(1,sample);
            py = p(i+1,2)+p(i+1,7)*sin(th);
            pz = p(i+1,3)+p(i+1,7)*cos(th);
        end
    elseif p(i,4) ~= 0
        if p(i+1,4) == 0
            px=linspace(p(i,1), p(i+1,1), sample);
            py=linspace(p(i,2), p(i+1,2), sample);
            pz=linspace(p(i,3)+p(i,7), p(i+1,3), sample);
        elseif p(i+1,4) ~= 0
            th = linspace(p(i,5),p(i,6),sample);
            px = p(i,1)*ones(1,sample);
            py = p(i,2)+p(i,7)*sin(th);
            pz = p(i,3)+p(i,7)*cos(th);
        end
    end
    x=[x px];
    y=[y py];
    z=[z pz];
end
end