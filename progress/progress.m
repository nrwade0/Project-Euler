%
% Graphically show progress for Project Euler problems
% 

% change to project euler directory
cd /Users/nick/Documents/GitHub/Project-Euler
dir

fortran_files = 1;
matlab_files = 1;
python_files = 1;

% figure frame set to max width and half the max height
set(gcf, 'Units', 'Normalized', 'OuterPosition', [0 0 1 0.5]);



if(fortran_files == 1)
    % ----- fortran files ---------
    % set new directory to fortran folder and output all .f90 files
    cd /Users/nick/Documents/GitHub/Project-Euler/Fortran
    dir **/*.f90

    plot1 = get_info('.f90', '');

    % plot data
    subplot(1,3,1)
    map = [0.2 0.1 0.5; 0.9 1 0]; % [incompleted; completed] RGB triplet
    secondary = [1 0.1 0.1]; % red grid color
    plot_data('Fortran', plot1, map, secondary)
end



if(matlab_files == 1)
    % ----- matlab files -----------
    % set new directory to fortran folder and output all .f90 files
    cd /Users/nick/Documents/GitHub/Project-Euler/MATLAB
    dir **/*.m

    plot2 = get_info('.m', 'p');

    % plot data
    subplot(1,3,2)
    map = [0.2 0.1 0.5; 0.9 1 0]; % [incompleted; completed] RGB triplet
    secondary = [1 0.1 0.1]; % red grid color
    plot_data('MATLAB', plot2, map, secondary)
end



if(python_files == 1)
    % ----- python files ------------
    % set new directory to fortran folder and output all .f90 files
    cd /Users/nick/Documents/GitHub/Project-Euler/Python
    dir **/*.py

    plot3 = get_info('.py', '');

    subplot(1,3,3)
    map = [0.2 0.1 0.5; 0.9 1 0]; % [incompleted; completed] RGB triplet
    secondary = [1 0.1 0.1]; % red grid color
    plot_data('Python', plot3, map, secondary)
end





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
end


%{
plot_data(String, 10x10 matrix, 3x2 array, 3x1 array)
  plots the data to produce the grid showing problems completed.
- String 's' is the name of the program used in the title.
- 10x10 matrix 'm' is the matrix of 1's and 0's that show completed problems.
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
    for tx = 1:10:100    % x value, bottom axis, 1-100 by 10's for numbers
        for ty = 1:10    % y value, left axis

            %  (x1,y2)----(x2,y2)
            %  |                |
            %  |       t        |
            %  |                |
            %  (x1,y1)----(x2,y1)
            % best offsets determined by trial and error
            x1 = tx/10 - 1.6;
            x2 = tx/10 + 1.4;
            y1 = ty - 0.5;
            y2 = ty + 0.5;
            
            % five lines to connect four points
            x = [x1, x2, x2, x1, x1];
            y = [y1, y1, y2, y2, y1];
            
            % plot box using 'secondary' colors
            plot(x, y, 'color', secondary, 'LineWidth', 1.5);

            % evaluate and write number in box in 'secondary' color
            str = num2str(tx + ty - 1);
            t = text(tx/10 + 0.75, ty, str);
            t.Color = secondary;
        end
    end

    % write title 's' with today's date and remove axes
    title([s ': ' date])
    hold off
    axis off
end

