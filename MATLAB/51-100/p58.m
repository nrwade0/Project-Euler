%{
   Project Euler problem 58 - Spiral primes
    Starting with 1 and spiralling anticlockwise in the following way, a 
     square spiral with side length 7 is formed.

     37 36 35 34 33 32 31
     38 17 16 15 14 13 30
     39 18  5  4  3 12 29
     40 19  6  1  2 11 28
     41 20  7  8  9 10 27
     42 21 22 23 24 25 26
     43 44 45 46 47 48 49

    It is interesting to note that the odd squares lie along the bottom 
     right diagonal, but what is more interesting is that 8 out of the 13 
     numbers lying along both diagonals are prime; that is, a ratio of 
     8/13 ? 62%.

    If one complete new layer is wrapped around the spiral above, a square 
     spiral with side length 9 will be formed. If this process is 
     continued, what is the side length of the square spiral for which the
     ratio of primes along both diagonals first falls below 10%?
%}

% side lengths 'sl' and current corner value 'c' preset, 'd' iterator for
% plotting data and 'data matrix to plot it.'
tic
Nprimes = 3;
sl = 2;
c = 9;
d = 0;
data = zeros(13119,2);
 
while(Nprimes/(2*sl+1) > 0.10)
    sl = sl + 2;
    for i = 1:3
        c = c + sl;
        if(isprime(c) == 1)
            Nprimes = Nprimes + 1;
        end
    end
    c = c + sl;
    
    d = d + 1;
    data(d,1) = sl;
    data(d,2) = Nprimes/(2*sl+1);
end


plot(data(:,1), data(:,2), 'b-')
ylabel('% of primes on diagonal')
xlabel('Side length')
fprintf('\nSide length w/ diagonal less than 10%% primes = %d\n', sl)
toc

