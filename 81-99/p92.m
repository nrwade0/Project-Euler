%{
  Project Euler problem 92 Square digit chains

    A number chain is created by continuously adding the square of the
    digits in a number to form a new number until it has been seen before.

    For example,
    44 -> 32 -> 13 -> 10 -> 1 -> 1
    85 -> 89 -> 145 -> 42 -> 20 -> 4 -> 16 -> 37 -> 58 -> 89

    Therefore any chain that arrives at 1 or 89 will become stuck in an 
    endless loop. What is most amazing is that EVERY starting number will 
    eventually arrive at 1 or 89.

    How many starting numbers below ten million will arrive at 89?
%}

tic

% initialize the count of chains leading to 89
count_89s = 0;

% load pre-saved array of chains to 1 or 89 below max sqsum (9^2*7 = 567)
cd /Users/nick/Documents/MATLAB/data
load('p92_chains','chains')

for i = 1:1e7
    
    % keeps track of where algorithm is
    if(mod(i,1e6) == 0)
        disp(i/1e6)
    end
    
    % calculate first sum of squared digits
    ss = sqsum(i);
    
    % determines the chain of 89 or 1 by repeatedly running sqsum function
    %  this will always be below 567
    while(ss ~= 89 && ss ~= 1)
        ss = sqsum(ss);
        
        % when the current ss is found in an 89 chain, just set it to ss
        % and leave the while loop
        if(chains(ss,1) == 1)
            count_89s = count_89s + 1;
            break
        end
        % do it similarly for a 1 chain
        if(chains(ss,1) == 2)
            break
        end
    end
    
end


fprintf('Chains ending in 89 = %d \nChecked up to: %d \n',count_89s,i)

toc

% function to determine the sum of the digits squared in a number
function ss = sqsum(num)
    str = num2str(num)-'0';
    ss = sum(str.^2);
end


