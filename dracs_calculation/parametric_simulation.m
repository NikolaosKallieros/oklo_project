clear;clc;close all
%% paaremters that change are: nak height, air height, air area, nak area
hub_initialize;
% nu_1 = nu_1/15;
% k_1 = k_1/15;
% density_1 = 273./temp*10;
%%
height_list = [4 6 8 10];
nak_area_list = [1 3 5 10 12 14]*10;
air_area_list = [3 5 8 10 12 14 16]*10;
air_height_list =[6];% 6 8 10];
%% scan through values from arrays above and change geometric configuration
% perform analysis on changed model 
num = 0;
for i=1:length(height_list)
    for j=1:length(nak_area_list)
        for k=1:length(air_area_list)
            for l = 1:length(air_height_list)
                num = num + 1;
                height_final = height_list(i);
                area_nak_final = nak_area_list(j);
                area_air_final = air_area_list(k);
                height_air_final = air_height_list(l);
                model = "natural_circulation_simscape_correct";
                simout = sim(model);
                % save data to output variable 
                data_out(num,1) = sim_data.cold.data(end);
                data_out(num,2) = sim_data.flow.data(end);
                data_out(num,3) = sim_data.flow_air.data(end);
                data_out(num,4) = sim_data.hot.data(end);
                data_out(num,5) = sim_data.hot_air.data(end);
                data_out(num,6) = sim_data.power.data(end);
                data_out(num,7) = height_final;
                data_out(num,8) = area_nak_final;
                data_out(num,9) = area_air_final;
                data_out(num,10) = height_air_final;
            end
        end
    end
end
%%
figure 
scatter(1:1:num, data_out(:,6))
hold on 
yline(180000);
grid on 
xlabel("Parametric scenario number")
ylabel("DRACS steady state power removal [W]")
%% plot figure for power 
figure
id_inter = data_out(:,10) == 6;
data_inter = data_out(id_inter,:);
for i=1:7
    id_inter = data_inter(:,9) == air_area_list(i);
    data_inter2 = data_inter(id_inter,:);
    subplot(4,2,i)
    tit = "air heat exchanger = " + num2str(air_area_list(i)) + "m2";
    title(tit);
    for j=1:6
        id_inter = data_inter2(:,8) == nak_area_list(j);
        data_inter3 = data_inter2(id_inter,:);
        hold on
        plot(data_inter3(:,7), data_inter3(:,6))
        grid on
        ylabel("DRACS power [W]")
        xlabel("DRACS height")
    end
    legend("nak = 1", "nak = 3", "nak = 5", "nak = 10", "nak = 12", "nak = 14")
end