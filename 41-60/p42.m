%{
   Project Euler problem 42 - Coded triangle numbers

    The nth term of the sequence of triangle numbers is given by, 
     tn = ½n(n+1); so the first ten triangle numbers are:

    1, 3, 6, 10, 15, 21, 28, 36, 45, 55, ...

    By converting each letter in a word to a number corresponding to its 
     alphabetical position and adding these values we form a word value. 
     For example, the word value for SKY is 19 + 11 + 25 = 55 = t10. 
     If the word value is a triangle number then we shall call the word a 
     triangle word.

    Using words.txt (right click and 'Save Link/Target As...'), a 16K text 
     file containing nearly two-thousand common English words, how many
     are triangle words?

%}

tic

% calculate the first 100 triangle numbers
scores = zeros(200,1);
for n = 1:200
    scores(n,1) = 0.5*n*(n+1);
end

% scan data document for words, using comma delimiter, then close file
cd /Users/nick/Documents/MATLAB/data
f = fopen('p42_words.txt','r');
words = textscan(f,'%q', 'Delimiter',',', 'CollectOutput',true);
fclose(f);

% names stored in a nested cell array, so we pull it out
words = words{1}(:);

% reset count
count = 0;

% for each word, calculate word score and compare to triangle score list
for i = 1:length(words)
    str = words{i};
    sum = 0;
    
    for s = 1:numel(str)
        sum = sum + (str(s) - 64);
    end
    
    if(ismember(sum, scores))
        count = count + 1;
    end
end

fprintf('The total number of triangle words is %d. \n',count)

toc

