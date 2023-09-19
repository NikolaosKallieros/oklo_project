clear;clc;close all;
%% create hexagonal pattern 
x_original = 1:1:10;
y_original = 1:1:10;
%%
x1 = [1 1.4 5 4 6 6.6];
figure 
subplot(1,2,1)
hold on 
histogram(power_dist, 60)
for i=1:length(x1)
xline(x1(i),"--","color","r");
end
xlabel("power")
ylabel("discrete distribution")
title("BOC")
subplot(1,2,2)
power_dist1 = power_dist + 1 + (2-1).*rand(131,1); 
histogram(power_dist1, 30)

xlabel("power")
ylabel("discrete distribution")
title("EOC")