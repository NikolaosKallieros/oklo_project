% +------------------------------------------------------+
% |            5D Data Visualization Example             |
% |              with MATLAB Implementation              | 
% |                                                      |
% | Author: M.Sc. Eng. Hristo Zhivomirov        12/13/14 | 
% +------------------------------------------------------+

% Note: In this Matlab script one demonstrates an example for data
% visualization in five dimensions (3 independent + 2 dependent variables).
% The independent variables are X, Y and Z, while the dependent ones are
% given with the marker color and size.

clear, clc, close all

%% prepare the test data (3 independent and 2 dependent variables)
% form the axes
x = 1:3;    % first dimension independent variable  (must be set by the user)
y = 1:3;    % second dimension independent variable (must be set by the user)    
z = 1:3;    % third dimension independent variable  (must be set by the user)
[X, Y, Z] = meshgrid(x, y, z);

% form the first data matrix - it is the fourth dimension (must be set by the user)
% Note: the data could be imported from a file or could be generated via equation.           
Data1 = 10*rand(length(x), length(y), length(z));

% form the second data matrix - it is the fifth dimension (must be set by the user)
% Note: the data could be imported from a file or could be generated via equation.           
Data2 = 50*rand(length(x), length(y), length(z));

%% organize the visualization
% visualize the fourth dimension via the marker color
C = Data1(:);

% visualize the fifth dimension via the marker size
S = 30*Data2(:);

%% plot the data
figure(1) 
hScatter = scatter3(X(:), Y(:), Z(:), S(:), C(:), 'filled');
grid3(x, y, z)
colormap jet
set(gca, 'FontName', 'Times New Roman', 'FontSize', 14)
xlabel('X')
ylabel('Y')
zlabel('Z')
title('\itData1, Data2 = \it{f}\rm\bf(\itX, Y, Z\rm\bf)')

% set the colorbar
hClbr = colorbar;
caxis([0 ceil(max(Data1(:)))])
set(hClbr, 'FontName', 'Times New Roman', 'FontSize', 14)
ylabel(hClbr, 'Value of the Data1')
