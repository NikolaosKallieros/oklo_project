clear;clc;close all
%% paaremters that change are: nak height, air height, air area, nak area
hub_initialize;
%%
height_list = [4 6 8 10];
nak_area_list = [6 12 18 20];
air_area_list = [6 12 18 20];
air_height_list = [6 8];% 6 8 10];
%%
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
%%
figure
id_inter = data_out(:,10) == 6;
data_inter = data_out(id_inter,:);
for i=1:4
id_inter = data_inter(:,9) == air_area_list(i);
data_inter2 = data_inter(id_inter,:);
id_inter = data_inter2(:,8) == 18;
data_inter3 = data_inter2(id_inter,:);
hold on  
scatter(data_inter3(:,7), data_inter3(:,6))
end