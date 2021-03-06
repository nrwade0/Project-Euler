%{
  Project Euler problem 20 Factorial digit sum

    n! means n � (n ? 1) � ... � 3 � 2 � 1

    For example, 10! = 10 � 9 � ... � 3 � 2 � 1 = 3628800,
    and the sum of the digits in the number 10! is
    3 + 6 + 2 + 8 + 8 + 0 + 0 = 27.

    Find the sum of the digits in the number 100!
%}

% requires symbolic toolbox to represent factorial(n > 20)
format long g

n = 100;

sum(char(factorial(sym(n))) - '0')
