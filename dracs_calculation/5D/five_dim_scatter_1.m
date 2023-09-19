% +------------------------------------------------------+
% |            5D Data Visualization Example             |
% |              with MATLAB Implementation              | 
% |                                                      |
% | Author: M.Sc. Eng. Hristo Zhivomirov        12/13/14 | 
% +------------------------------------------------------+

% Note: In this Matlab script one demonstrates an example for data
% visualization in five dimensions (4 independent + 1 dependent variables).
% The independent variables are X, Y, Z and time t, while the dependent one
% is given with the marker color.

clear, clc, close all

%% prepare the test data (4 independent and 1 dependent variables)
% form the axes
x = -1:0.1:1;	% first dimension indipendent variable	(must be set by the user)
y = -1:0.1:1;	% second dimension indipendent variable	(must be set by the user)
z = -1:0.1:1;	% third dimension indipendent variable  (must be set by the user)
t = 0:0.05:1;   % fourth dimension independent variable i.e., time (must be set by the user)
[X, Y, Z] = meshgrid(x, y, z);

% form the data matrix - it is the fourth dimension (must be set by the user)
% Note: the data could be imported from a file or could be generated via equation. 
load 5D_Data

%% organize the visualization
figure(1) 
hScatter = scatter3(X(:), Y(:), Z(:), 'filled');
grid3(x, y, z)
colormap jet
set(gca, 'FontName', 'Times New Roman', 'FontSize', 14)
xlabel('X')
ylabel('Y')
zlabel('Z')

% set the colorbar
hClbr = colorbar;
caxis([0 ceil(max(Data(:)))])
set(hClbr, 'FontName', 'Times New Roman', 'FontSize', 14)
ylabel(hClbr, 'Value of the Data')

% cycle through the fourth dimension independent variable (i.e., time)
for k = 1:length(t)	
    
    % visualize the fifth dimension via the marker color
    C = reshape(Data(:, :, :, k), length(x)*length(y)*length(z), 1);  
       
    % update the plot
    set(hScatter, 'CData', C, 'SizeData', 25)  
    title(['\itData = \it{f}\rm\bf(\itX, Y, Z, t\rm\bf) \it@ t = \rm\bf' num2str(t(k))])
    drawnow
    
    % pause for a while
    pause(1)   
    
end