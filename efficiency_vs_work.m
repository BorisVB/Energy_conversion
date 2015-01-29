%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% GOAL:  PLOTING THE THERMAL EFFICIENCY VS. WORK OUPUT FOR DIFFERENT RATIO OF TEMPERATURE (R)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
k=1.4;
r=2:0.1:20;
t=2:1:6;
R=r.^((k-1)/k);
hold on
hold all
xlim([0 1.5])
ylim([0 0.45])
set(gca, 'FontSize', 15, 'fontName','Times');
etha=0.85;
i=0;
for t=2:1:6;
    i=i+1;
Wnetout=etha*t*(1-(R.^-1))-((R-1)/etha);
thermaleff=(etha*t*(1-(R.^-1))-((R-1)/etha)).*((t-R).^-1);
w(i)=plot(Wnetout,thermaleff,'*');
xlabel('normalized work output : W/CpT1') ;
ylabel('thermal efficiency');
title('Thermal efficiency according to the work output with efficiency=0,85');
end

legend([w(1) w(2) w(3) w(4) w(5)],'t=2', 't=3', 't=4', 't=5', 't=6');

