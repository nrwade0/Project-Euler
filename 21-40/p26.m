%{
   Project Euler problem 26 - Reciprocal cycles

    A unit fraction contains 1 in the numerator. The decimal representation
     of the unit fractions with denominators 2 to 10 are given:

     1/2	= 	0.5
     1/3	= 	0.(3)
     1/4	= 	0.25
     1/5	= 	0.2
     1/6	= 	0.1(6)
     1/7	= 	0.(142857)
     1/8	= 	0.125
     1/9	= 	0.(1)
     1/10	= 	0.1

    Where 0.1(6) means 0.166666..., and has a 1-digit recurring cycle. 
     It can be seen that 1/7 has a 6-digit recurring cycle.

    Find the value of d < 1000 for which 1/d contains the longest 
     recurring cycle in its decimal fraction part.
%}

tic
% save highest sequence length in 'seqLen'
seqLen = 0;
 
for d = 1000:-1:0
    
    % stop the search once d <= the longest recurring cycle found
    if(seqLen >= d)
        break;
    end
    
    % indexing variables
    foundRemainders = zeros(d,1);
    value = 1;
    position = 0;
    
    % Store remainders and find next remainder, when possible
    while(foundRemainders(value+1,1) == 0 && value ~= 0)
        foundRemainders(value+1,1) = position;
        value = value*10;
        value = rem(value,d);
        position = position + 1;
    end
    
    % reset sequence length
    if(position - foundRemainders(value+1,1) > seqLen)
        seqLen = position - foundRemainders(value+1,1);
    end
    
end

% print answer
fprintf('Highest repeating decimal sequence: 1/%d = %d.\n', d, seqLen)
toc
