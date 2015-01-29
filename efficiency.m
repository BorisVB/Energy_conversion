%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% GOAL:  DRAWING THERMAL EFFICIENCY AND CALCULATE THE DEVIATION FOR Ropt BETWEEN THEORY AND CURVES
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%initial parameters
k=1.4;
r=1:0.2:50;
R=r.^((k-1)/k);
color=['b' 'r' 'g'];
i=0;
j=0;
ylim([0 0.8])
xlim([1 50])
set(gca, 'FontSize', 15, 'fontName','Times');
hold on

%calculation of the thermal efficiencies in the different cases
for etha=0.85:0.05:0.95
    i=i+1;
for t=2:1:6 
    j=j+1;
thermaleff=(etha*t*(1-(R.^-1))-((R-1)/etha)).*((t-1-((R-1)/etha)).^-1);
for l=1:1:length(r)
    if thermaleff(l)<0
        for p=l:1:length(r)
            thermaleff(p)=0;
        end
        break
    end
end

%computation of optimal pressure ratio according the plot
[valmax,rint]=max(thermaleff);
ropt(j)=r(rint);

%plotting
w(j)=plot(r,thermaleff,color(i));
xlabel('r : pressure ratio') ;
ylabel('Thermal Efficiency');
title('Thermal Efficiencies evolution according to the pressure ratio and the efficiency of the components');
end
end
%computation of the ideal cycle efficiency
ideal=1-(R.^(-1));
idealplot=plot(r,ideal,'black');

legend([w(1), w(7), w(13), idealplot],'etha=0,85', 'etha=0,90', 'etha=0,95', 'ideal cycle');

%computation of the theoretical optimal ratio
z=0;
for etha=0.85:0.05:0.95
    for t=2:1:6 
    z=z+1;
    A=(1/etha)-(1/(t*etha))-1;
    B=2;
    C=(t*etha)-etha+1;
    rtheo(z)=((-B+(((B*B)+(4*A*C))^(0.5)))/(2*A))^(k/(k-1));
    end
end

%comparison theoretical ratio and ratio from plotting
for i=1:1:length(rtheo)
DeltaRelative(i)=abs(rtheo(i)-ropt(i))/max(rtheo(i),ropt(i));
end
%print relative deviation
DeltaRelative

