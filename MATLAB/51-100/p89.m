%{
   Project Euler problem 89 - Roman numerals
   
    For a number written in Roman numerals to be considered valid there are
     basic rules which must be followed. Even though the rules allow some
     numbers to be expressed in more than one way there is always a "best"
     way of writing a particular number.

    For example, it would appear that there are at least six ways of
     writing the number sixteen:

    IIIIIIIIIIIIIIII
    VIIIIIIIIIII
    VVIIIIII
    XIIIIII
    VVVI
    XVI

    However, according to the rules only XIIIIII and XVI are valid, and
     the last example is considered to be the most efficient, as it uses
     the least number of numerals.

    The 11K text file, roman.txt (right click and 
     'Save Link/Target As...'), contains one thousand numbers written in 
     valid, but not necessarily minimal, Roman numerals; see About... 
     Roman Numerals for the definitive rules for this problem.

    Find the number of characters saved by writing each of these in their
     minimal form.

    Note: You can assume that all the Roman numerals in the file contain
     no more than four consecutive identical units.
%}

% open romans file location
tic
cd /Users/nick/Documents/GitHub/Project-Euler/MATLAB/51-100
f = fopen('data/p89_roman.txt','r');
romans = textscan(f,'%s', 'Delimiter','\n');
fclose(f);

% take out of nested for-loop and initialize counting variables
romans = romans{1}(:);
sum_after = 0;
sum_before = 0;

% for each roman numeral...
for i = 1:length(romans)
    str = romans{i};
    
    % count the numerals before change
    sum_before = sum_before + length(str);
    
    % shorten any possible ones
    str = regexprep(str,'IIII|XXXX|LXXXX|VIIII|CCCC|DCCCC', 'AA');
    
    % count the numerals after change
    sum_after = sum_after + length(str);
end

% Print the difference
fprintf('Difference in characters: %d \n', sum_before-sum_after)
toc
