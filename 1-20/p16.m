%{
 Project Euler 16 - Power digit sum

2^15 = 32768 and the sum of its digits is 3+2+7+6+8 = 26.

What is the sum of the digits of the number 2^1000?
%}

% Requires Symbolic Math Toolbox for sym()
n = sym(2^1000);
n = char(n);
sum = 0;

% sum all characters
for i = length(n)
    sum = sum + num2str(n(i));
end

% output
sum
