%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% GOAL: DRAWING WORK OUTPUT ACCORDING TO R, AND CALCULATE THE DEVIATION FOR Ropt BETWEEN THEORY AND CURVES
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
k=1.4;
r=1:0.2:40;
R=r.^((k-1)/k);
hold on
hold all
color=['b' 'r' 'g'];
i=0;
j=0;
ylim([0 2.5])
set(gca, 'FontSize', 15, 'fontName','Times');
for etha=0.85:0.05:0.95
    i=i+1;
for t=2:1:6
    j=j+1;
Wnetout=etha*t*(1-(R.^-1))-((R-1)/etha);
w(j)=plot(r,Wnetout,color(i));
xlabel('r : pressure ratio') ;
ylabel('WnetOut/Cp.T1');
title('Net Work out according to the pressure ratio and efficiency of the components');

%calculation of the ropt given the curves
[valmax,rint]=max(Wnetout);
ropt(j)=r(rint);

end
end

%computation of the ideal work output
y=0;
for t=2:1:6
    y=y+1;
    ideal=t*(1-(R.^(-1)))-(R-1);
    idealplot(y)=plot(r,ideal,'black');
end;
legend([w(1), w(7), w(13), idealplot(1)],'etha=0,85', 'etha=0,90', 'etha=0,95', 'ideal cycle');

%theorique ropt
y=0;
for etha=0.85:0.05:0.95
    for t=2:1:6
    y=y+1;
    rtheo(y)=(t*etha*etha)^(k/(2*(k-1)));
    deviation(y)=(abs(rtheo(y)-ropt(y)))/(max(rtheo(y),ropt(y)));
    end;
end;
deviation
