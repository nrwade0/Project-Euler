% 
% 
% 

cd /Users/nick/Documents/GitHub/Project-Euler/1-20

clc 
clear all


% ----- get 1-20 files -----------
% set new directory to MATLAB folder and output all .m files
fprintf('\n ----------- MATLAB ----------- \n')
dir **/*.m %print their names

prefix = 'p';
ext = '.m';

% intialize file 'info', cell array 'names', and matrix plotting data
info = dir(['**/*' ext]);
names = repmat({'blank'},length(info),1);
plot = zeros(1,20);


% for each file
for var = 1:length(info)

    % save each name and place in names without 'ext'
    temp = info(var).name;
    % remove prefix if it exists (most likely 'p' in matlab)
    if(isletter(prefix))
        temp = strip(temp, 'left', prefix);
    end
    names{var} = erase(temp, ext);
    
    tic
    fprintf('  Now timing: %s ', [prefix names{var} ext])
    dead = evalc(['run(''' [prefix names{var} ext] ''')']);
    clearvars -except prefix ext info names plot var temp
    t = toc;
    fprintf('  ... %f seconds \n', t)
    plot(str2num(names{var})) = t;
    
end

% output total runtime
fprintf('Total runtime: %f seconds\n', sum(plot))

% tranpose for plotting
plot = transpose(plot);

% plot using a bar graph
bar(plot)
title(['p1-20.m: ' date])
xlabel('Problem number')
xticks(1:20)
%xticklabels({'1','-2\pi','-\pi','0','\pi','2\pi','3\pi'})
ylabel('Runtime (seconds)')
fprintf('Successfully plotted\n')
