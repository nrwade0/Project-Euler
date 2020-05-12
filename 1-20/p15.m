%{ 
 Project Euler 15 - Lattice paths
 
Starting in the top left corner of a 2×2 grid, and only being able to move
 to the right and down, there are exactly 6 routes to the bottom right 
 corner.

How many such routes are there through a 20×20 grid?
%}

format long g

% lattice paths = binomial coefficient found here
%  http://mathworld.wolfram.com/LatticePath.html
% lattice paths from (0,0) to (a,b) = (a+b)chooseb
a = 20;
b = 20;

binomial = nchoosek(a+b, b)
