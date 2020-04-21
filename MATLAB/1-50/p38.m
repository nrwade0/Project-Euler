%{
   Project Euler problem 38 - Pandigital multiples
   
    Take the number 192 and multiply it by each of 1, 2, and 3:

    192 × 1 = 192
    192 × 2 = 384
    192 × 3 = 576
    
    By concatenating each product we get the 1 to 9 pandigital, 192384576.
     We will call 192384576 the concatenated product of 192 and (1,2,3)

    The same can be achieved by starting with 9 and multiplying by 
     1, 2, 3, 4, and 5, giving the pandigital, 918273645, which is the 
     concatenated product of 9 and (1,2,3,4,5).

    What is the largest 1 to 9 pandigital 9-digit number that can be 
     formed as the concatenated product of an integer with (1, 2, ..., n)
     where n > 1?
%}
format long g
tic

% initialize max values to be shown at the end
max_pan = 0;
max_n = 0;
max_mult = 0;

% check n's up to 20000 (arbitrarily chosen number)
for n = 1:20000
    % mutlipliers to be check from 1:m
    for m = 2:9
        % initialize testing variables
        multiplier = 1:m;
        s = num2str(n*multiplier);
        s(isspace(s)) = [];
        
        % first check for length (must be == 9 for pandigital)
        if(length(s) > 9)
            break
        elseif(length(s) < 9)
            continue
        end
        
        % check for pandigitality and if it is a max number
        if(is_pandigital(s) == 1 && str2num(s) > max_pan)
            max_pan = str2num(s);
            max_n = n;
            max_mult = m;
        end
    end
end

% output results
fprintf('\nMax pandigital number = %d \n', max_pan)
fprintf('Yielded by an n = %d and the multiplier 1:%d\n', max_n, max_mult)
toc



%{
  is_pandigital(string s) function determines if the string 's' is a 1-9
pandigital number. It achieves this by filling a 1 by 9 column zero-matrix 
called 'pans' with a value of one depending on the numbers found in 
string 's'. In order to increase speed, the length of the string must be 9
in the first place.
%}
function yn = is_pandigital(str)
    % initialize variable
    pans = zeros(1,9);
    
    % ensure string length == 9 at least, otherwise not pandigital
    if(length(str) ~= 9)
        yn = 0;
    end
    
    % fill pans array
    for i = 1:length(str)
        % only services 1-9 pandigital numbers, so leave if it has a 0
        % digit OR if one of the digits has already been serviced.
        if(str(i) == '0' || pans(str2num(str(i))) == 1)
            yn = 0;
        else
            pans(str2num(str(i))) = 1;
        end
    end
    
    % if pans array has some zeros left, then throw out as non-pandigital
    if(any(pans == 0) == 1)
        yn = 0;
    else
        yn = 1;
    end
end
