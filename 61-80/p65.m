%{
  Project Euler problem 65 - Convergents of e

        [NO PROMPT]

    We are only interested in the numerator, and if we investigate that we
     will rather quickly find a pattern which is consistent with given 
     continued fraction for e.
    
    2, 3, 8, 11, 19, 87, 106, 193, 1264, 1457, ...
    
     The pattern is

    n_k = a_k * n_{k-1} + n_{k-2}

    As we can also see the continued fraction forms a regular pattern where 
     every third increases by two and the rest are ones. This means we can
     write a small piece of code that will give us the numerator. 
%}

format long g


upperbound = 100;
d = 1;
n = 2;
 
for i = 2:upperbound
    temp = d;
    if(mod(i,3) == 0)
        c = 2*(i/3);
    else
        c = 1;
    end
    d = n;
    n = c * d + temp;
end

result = DigitSum(n);

fprintf('Numerator of %dth in sequence = %d /n ', upperbound, n)
fprintf('Sum of the digits of that number %d /n', result)


function s = DigitSum(n)
    s = sum(num2str(n) - '0');
end

