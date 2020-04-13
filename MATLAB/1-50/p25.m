%{
  Project Euler problem 25 - 1000th digit Fibonacci number

    The Fibonacci sequence is defined by the recurrence relation:

    Fn = Fn?1 + Fn?2, where F1 = 1 and F2 = 1.
    Hence the first 12 terms will be:

    F1 = 1
    F2 = 1
    F3 = 2
    F4 = 3
    F5 = 5
    F6 = 8
    F7 = 13
    F8 = 21
    F9 = 34
    F10 = 55
    F11 = 89
    F12 = 144
    The 12th term, F12, is the first term to contain three digits.

    What is the index of the first term in the Fibonacci sequence to 
     contain 1000 digits?
%}

% Uses simple fibonacci number calculator and stops when digits of the
%  next fib number is greater than 1000. MATLAB probably requires symbolic 
%  math toolkit to solve.
format long g

a = 1;
b = 1;
fib = 2;
index = 2;

while(length(num2str(fib)) ~= 1000)
    %fprintf('a = %d // b = %d // fib = %d \n', a, b, a_and_b)
    fib = a + b;
    a = b;
    b = fib;
    index = index + 1;
end

fprintf('Index: %d', index)
