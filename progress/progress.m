%
% Graphically show progress for Project Euler problems
% 

% change to MATLAB Drive directory
cd /Users/nick/Documents/MATLAB
clc
clear all


% ----- MATLAB files -----------
% set new directory to MATLAB folder and output all .m files
fprintf('\n ----------- MATLAB ----------- \n')
dir **/*.m

plot1 = get_info('.m', 'p');

% plot data
map = [0.2 0.1 0.5; 0.9 1 0]; % [incompleted; completed] RGB triplet
secondary = [1 0.1 0.1]; % red grid color
plot_data('Project Euler Progress', plot1, map, secondary)



%{
get_info(String)
  gets information from a folder and produces a 10x10 grid of 1's and 0's 
representing the completion of files.
- String 'ext' is the desired extension of files sought
- String 'prefix' is a required prefix removal before the number
%}
function plot = get_info(ext, prefix)
    % intialize file 'info', cell array 'names', and matrix plotting data
    info = dir(['**/*' ext]);
    names = repmat({'blank'},length(info),1);
    plot = zeros(10);

    % for each file
    for i = 1:length(info)
    
        % save each name and place in names without 'ext'
        temp = info(i).name;
        % remove prefix if it exists (most likely 'p' in matlab)
        if(isletter(prefix))
            temp = strip(temp, 'left', prefix);
        end
        names{i} = erase(temp, ext);

        % place a 1 in plotting matrix on that file
        plot(str2num(names{i})) = 1;
    end
    
    % tranpose for drawing
    plot = transpose(plot);
end



%{
plot_data(String, 10x10 matrix, 3x2 array, 3x1 array)
  plots the data to produce the grid showing problems completed.
- String 's' is the name of the program used in the title.
- 10x10 matrix 'm' is the matrix of 1s and 0s that show completed problems.
- 2x3 array 'map' defines RGB triplet used as color schemes
- 1x3 array 'secondary' defines RGB triplet used as number and grid color
%}
function plot_data(s, m, map, secondary)
    
    % define color map from argument 'map'
    colormap(map);
    % draw scaledimage based on the matrix 'm'
    imagesc(m);
    
    % draw boxes and numbers on the grid
    hold on
    for ty = 1:10:100    % x value, bottom axis, 1-100 by 10's for numbers
        for tx = 1:10    % y value, left axis

            %  (x1,y2)----(x2,y2)
            %  |                |
            %  |       t        |
            %  |                |
            %  (x1,y1)----(x2,y1)
            % best offsets determined by trial and error
            x1 = tx - 1.5;
            x2 = tx + 1.5;
            y1 = ty/10 - 1.6;
            y2 = ty/10 + 1.4;
            
            % five lines to connect four points
            x = [x1, x2, x2, x1, x1];
            y = [y1, y1, y2, y2, y1];
            
            % plot box using 'secondary' colors
            plot(x, y, 'color', secondary, 'LineWidth', 1.5);

            % evaluate and write number in box in 'secondary' color
            str = num2str(tx + ty - 1);
            t = text(tx-0.15, ty/10 + 0.85, str);
            t.Color = secondary;
        end
    end

    % write title 's' with today's date and remove axes
    title([s ': ' date])
    hold off
    axis off
end


