function [data_out] = get_data(sim_data)

data_out(1) = sim_data.cold.data(end);
data_out(2) = sim_data.flow.data(end);
data_out(3) = sim_data.flow_air.data(end);
data_out(4) = sim_data.hot.data(end);
data_out(5) = sim_data.hot_air.data(end);
data_out(6) = sim_data.power.data(end);
end

