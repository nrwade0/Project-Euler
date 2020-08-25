%{
   Project Euler problem 96 - Su Doku

    The 6K text file, sudoku.txt (right click and Save Link/Target As...),
     contains fifty different Su Doku puzzles ranging in difficulty, but 
     all with unique solutions (the first puzzle in the file is the example
     above).

    By solving all fifty puzzles find the sum of the 3-digit numbers found
     in the top left corner of each solution grid; for example, 483 is the 
     3-digit number found in the top left corner of the solution grid 
     above.
%}


fid = fopen('../data/p96_sudoku.txt');
dat = textscan(fid,'%s');
fclose(fid);

dat{1}{1:10}


