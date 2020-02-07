%
% Graphically show progress for Project Euler problems
% 

% change to project euler directory
cd /Users/nick/Documents/GitHub/Project-Euler
dir


% ----- fortran files
cd /Users/nick/Documents/GitHub/Project-Euler/Fortran
dir **/*.f90

fortran_info = dir('**/*.f90');
f_names = repmat({'blank'},length(fortran_info),1);

for f = 1:length(fortran_info)
    temp = fortran_info(f).name;
    f_names{f} = erase(temp, '.f90');
end

f_names

plot1 = zeros(10);
for f = 1:length(f_names)
    plot1(str2num(f_names{f})) = 1;
end


% ----- matlab files
cd /Users/nick/Documents/GitHub/Project-Euler/MATLAB
dir **/*.m

matlab_info = dir('**/*.m');
m_names = repmat({'blank'},length(matlab_info),1);

for m = 1:length(matlab_info)
    temp = matlab_info(m).name;
    temp = strip(temp,'left','p');
    m_names{m} = erase(temp, '.m');
end

m_names

plot2 = zeros(10);
for m = 1:length(m_names)
    plot2(str2num(m_names{m})) = 1;
end


% ----- python files
cd /Users/nick/Documents/GitHub/Project-Euler/Python
dir **/*.py

python_info = dir('**/*.py');
p_names = repmat({'blank'},length(python_info),1);

for p = 1:length(python_info)
    temp = python_info(p).name;
    p_names{p} = erase(temp, '.py');
end

p_names

plot3 = zeros(10);
for p = 1:length(p_names)
    plot3(str2num(p_names{p})) = 1;
end

figure(1)
transpose(plot1);
imagesc(plot1)
title(['Fortran: ' date])

figure(2)
transpose(plot2);
imagesc(plot2)
title(['MATLAB: ' date])

figure(3)
transpose(plot3);
imagesc(plot3)
title(['Python: ' date])
c


c = colorbar

c.TickLabels = {'Complete', 'Incomplete'};
c.TickLabelsMode = 'manual';
c.Ticks = [0.0, 1.0];


