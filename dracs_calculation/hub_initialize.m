clear;clc;close all;
%% script to initialize SIMSCAPE simulations 
%% initial temperatures 
nak_initial = 300; % K
pool_initial = 377+273; % K
%% geometry
air_height_nak = 5; % m
nak_height_nak = 5; % m
air_height_air = 5; % m
nak_area = 30; % m2
air_area = 2; % m2
nak_resistance = 0;
air_resistance = 0;
total_height = air_height_nak + nak_height_nak;
%% thermal properties 
% NaK
density_nak_temperature = 273+ [0 100 550]; % K
density_nak = [0.866 0.855 0.749]; % kg/m3
%% properties nak, Na
temp = density_nak_temperature';
density_1 = density_nak*1000;
cp_1 = [1.22 1.22 1.22];
nu_1 = [0.9 0.9 0.9]';
k_1 = [60 60 60]';
cp = 1.22; % kj/kgK
%% properties air
temp_air = 293:10:700;
density_air = 293./(temp_air);
cp_air = ones(length(temp_air),1)*1;
nu_air = ones(length(temp_air),1)*0.0015;
k_air = ones(length(temp_air),1)*0.2;

