%{
  Project Euler problem 22 Names Scores

    Using names.txt (right click and 'Save Link/Target As...'), a 46K text 
     file containing over five-thousand first names, begin by sorting it 
     into alphabetical order. Then working out the alphabetical value for 
     each name, multiply this value by its alphabetical position in the 
     list to obtain a name score.

    For example, when the list is sorted into alphabetical order, COLIN, 
     which is worth 3 + 15 + 12 + 9 + 14 = 53, is the 938th name in the 
     list. So, COLIN would obtain a score of 938 × 53 = 49714.

    What is the total of all the name scores in the file?
%}

% Takes <1 seconds
tic

% input list of names separated by a comma 
cd /Users/nick/Documents/MATLAB/data
f = fopen('p22_names.txt','r');
names = textscan(f,'%q', 'Delimiter',',', 'CollectOutput',true);
fclose(f);

% names is stored in a nested cell array, so we pull it out and sort
%  alphabetically
names = names{1}(:);
names = sort(names);

% number of names to be scored, scores saved in 'name_score' matrix
len = length(names);
name_score = zeros(len,1);

% calculate the name score:
for i = 1:len
    % convert each to ASCII value array
    vals = double(names{i});
    
    % sum these numbers, regularizing to 64 (A=1, B=2, ...)
    name_score(i,1) = sum(vals-64)*i;
end

fprintf('Sum of name scores = %d.\n', sum(name_score(:,1)))
toc