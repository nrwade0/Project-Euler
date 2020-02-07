%
% Graphically show progress for Project Euler problems
% 

% change to project euler directory
cd /Users/nick/Documents/GitHub/Project-Euler
dir

%{
% ----- fortran files
% set new directory to fortran folder and output all .f90 files
cd /Users/nick/Documents/GitHub/Project-Euler/Fortran
dir **/*.f90

% intialize file info and names cell array and matrix plotting data
fortran_info = dir('**/*.f90');
f_names = repmat({'blank'},length(fortran_info),1);
plot1 = zeros(10);

% for each fortran file
for f = 1:length(fortran_info)
    
    % save each name and place in f_names without '.f90'
    temp = fortran_info(f).name;
    f_names{f} = erase(temp, '.f90');
    
    % place a 1 in plotting matrix
    plot1(str2num(f_names{f})) = 1;
end

% plot data
figure(1)
transpose(plot1);
imagesc(plot1)
title(['Fortran: ' date])



% ----- matlab files
% set new directory to fortran folder and output all .f90 files
cd /Users/nick/Documents/GitHub/Project-Euler/MATLAB
dir **/*.m

% intialize file info and names cell array and matrix plotting data
matlab_info = dir('**/*.m');
m_names = repmat({'blank'},length(matlab_info),1);
plot2 = zeros(10);

% for each matlab file
for m = 1:length(matlab_info)
    
    % save each name and place in m_names without 'p##.m'
    temp = matlab_info(m).name;
    temp = strip(temp,'left','p');
    m_names{m} = erase(temp, '.m');
    
    % place a 1 in plotting matrix
    plot2(str2num(m_names{m})) = 1;
end

% plot data
figure(2)
transpose(plot2);
imagesc(plot2)
title(['MATLAB: ' date])

%}

% ----- python files
% set new directory to fortran folder and output all .f90 files
cd /Users/nick/Documents/GitHub/Project-Euler/Python
dir **/*.py

% intialize file info and names cell array and matrix plotting data
python_info = dir('**/*.py');
p_names = repmat({'blank'},length(python_info),1);
plot3 = zeros(10);

% for each python file
for p = 1:length(python_info)
    
    % save each name and place in p_names without '.py'
    temp = python_info(p).name;
    p_names{p} = erase(temp, '.py');
    
    % place a 1 in plotting matrix
    plot3(str2num(p_names{p})) = 1;
end

% plot data
figure(3)
%transpose(plot3);
map = [0.2 0.1 0.5; 0.9 1 0]; % [incompleted; completed] RGB triplet
colormap(map)
text(5,5,'TEST TEXT');
imagesc(plot3)
title(['Python: ' date])




