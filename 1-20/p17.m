%{
   Project Euler problem 17 - Number letter counts

    If the numbers 1 to 5 are written out in words: one, two, three, four, 
     five, then there are 3 + 3 + 5 + 4 + 4 = 19 letters used in total.

    If all the numbers from 1 to 1000 (one thousand) inclusive were written
     out in words, how many letters would be used?


    NOTE: Do not count spaces or hyphens. For example, 342 (three hundred 
     and forty-two) contains 23 letters and 115 (one hundred and fifteen) 
     contains 20 letters. The use of "and" when writing out numbers is in 
     compliance with British usage.
%}

tic

count = 0;

for n = 1:1000
    i = 1;
    N = num2str(n) - '0';
    
    %% LENGTH FOUR NUMBER
    if(length(N) == 4)
        count = count + 3 + 8;
    end
    
    
    %% LENGTH THREE NUMBER
    if(length(N) == 3)
        % HUNDREDS
        if(N(i) == 1 || N(i) == 2 || N(i) == 6)  % 3 length
            count = count + 3 + 7 + 3; % number + hundred + and
        elseif(N(i) == 4 || N(i) == 5 || N(i) == 9) % 4 length
            count = count + 4 + 7 + 3; % number + hundred + and
        elseif(N(i) == 3 || N(i) == 7 || N(i) == 8) % 5 length
            count = count + 5 + 7 + 3; % number + hundred + and
        end


        i = i + 1;


        % TEENS PLACE
        if(N(i) == 1)
            if(N(i+1) == 1 || N(i+1) == 2) % 6 length
                count = count + 6; % number
            elseif(N(i+1) == 5 || N(i+1) == 6) % 7 length
                count = count + 7; % number
            elseif(N(i+1) == 3 || N(i+1) == 4 || N(i+1) == 8 || N(i+1) == 9) % 8 length
                count = count + 8; % number
            elseif(N(i+1) == 7) % 9 length
                count = count + 9; % number
            end
            continue
        elseif(N(i) == 4 || N(i) == 5 || N(i) == 6) % 5 length
            count = count + 5; % number
        elseif(N(i) == 2 || N(i) == 3 || N(i) == 8 || N(i) == 9)% 6 len
            count = count + 6;
        elseif(N(i) == 7) % 7 length
            count = count + 7;
        end


        i = i + 1;

        % ONES PLACE
        if(N(i) == 1 || N(i) == 2 || N(i) == 6)  % 3 length
            count = count + 3; % just number
        elseif(N(i) == 4 || N(i) == 5 || N(i) == 9) % 4 length
            count = count + 4; % just number
        elseif(N(i) == 3 || N(i) == 7 || N(i) == 8) % 5 length
            count = count + 5; % just number
        end

    end
    
    
    
    %% LENGTH TWO NUMBER
    if(length(N) == 2)
        % TEENS PLACE
        if(N(i) == 1)
            if(N(i+1) == 1 || N(i+1) == 2) % 6 length
                count = count + 6; % number
            elseif(N(i+1) == 5 || N(i+1) == 6) % 7 length
                count = count + 7; % number
            elseif(N(i+1) == 3 || N(i+1) == 4 || N(i+1) == 8 || N(i+1) == 9) % 8 length
                count = count + 8; % number
            elseif(N(i+1) == 7) % 9 length
                count = count + 9; % number
            end
            continue
        elseif(N(i) == 4 || N(i) == 5 || N(i) == 6) % 5 length
            count = count + 5; % number
        elseif(N(i) == 2 || N(i) == 3 || N(i) == 8 || N(i) == 9)% 6 len
            count = count + 6;
        elseif(N(i) == 7) % 7 length
            count = count + 7;
        end


        i = i + 1;

        % ONES PLACE
        if(N(i) == 1 || N(i) == 2 || N(i) == 6)  % 3 length
            count = count + 3; % just number
        elseif(N(i) == 4 || N(i) == 5 || N(i) == 9) % 4 length
            count = count + 4; % just number
        elseif(N(i) == 3 || N(i) == 7 || N(i) == 8) % 5 length
            count = count + 5; % just number
        end    
    end

    %% LENGTH ONE NUMBER
    if(length(N) == 1)
        % ONES PLACE
        if(N(i) == 1 || N(i) == 2 || N(i) == 6)  % 3 length
            count = count + 3; % just number
        elseif(N(i) == 4 || N(i) == 5 || N(i) == 9) % 4 length
            count = count + 4; % just number
        elseif(N(i) == 3 || N(i) == 7 || N(i) == 8) % 5 length
            count = count + 5; % just number
        end
    end
end

%%
fprintf('Total sum of letters = %d\n', count)
toc
