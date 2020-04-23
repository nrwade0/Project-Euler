%{
   Project Euler problem 45 - Triangular, pentagonal, and hexagonal
   
    Triangle, pentagonal, and hexagonal numbers are generated by the 
     following formulae:

     Triangle	 	Tn=n(n+1)/2     	1, 3, 6, 10, 15, ...
     Pentagonal	 	Pn=n(3n?1)/2	 	1, 5, 12, 22, 35, ...
     Hexagonal	 	Hn=n(2n?1)      	1, 6, 15, 28, 45, ...

    It can be verified that T285 = P165 = H143 = 40755.

    Find the next triangle number that is also pentagonal and hexagonal.
%}

clear all
tic

% Set up arrays to store the three different numbers
n_max = 100000;
Tri = zeros(1,n_max);
Pen = zeros(1,n_max);
Hex = zeros(1,n_max);

% calculate the 'n' triangle, pentagonal, and hexagonal number
for n = 1:n_max
    Tri(1,n) = n*(n+1)/2;
    Pen(1,n) = n*(3*n-1)/2;
    Hex(1,n) = n*(2*n-1);
end

% Print the shared values using intersect()
fprintf('Shared value = %d.\n', intersect(intersect(Tri,Pen),Hex))
toc

