%{
  Project Euler problem 28 Number spiral diagonals

    Starting with the number 1 and moving to the right in a clockwise
    direction a 5 by 5 spiral is formed as follows:

    21 22 23 24 25
    20  7  8  9 10
    19  6  1  2 11
    18  5  4  3 12
    17 16 15 14 13

    It can be verified that the sum of the numbers on the diagonals is 101.

    What is the sum of the numbers on the diagonals in a 1001 by 1001
    spiral formed in the same way?
%}

tic;

% spiral size 'n'
n = 1001;


%create spiral matrix
grid = spiral(n);

% determine total of diagonals
total = 0;
for i = 1:n % i is the current column
    if(i == ceil(n/2)) % dont double add the center point
        total = total + grid(i,i);
        %fprintf('column %d: %d \n', i, grid(i,i)) % print for convenience
    else
        total = total + grid(i,i) + grid(n-i+1,i);
        %fprintf('column %d: %d, %d \n', i, grid(i,i), grid(n-i+1,i))
    end
end

fprintf('Sum of diagonals: %d \n', total)

toc;