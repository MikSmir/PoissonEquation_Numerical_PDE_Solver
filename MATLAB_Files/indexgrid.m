function [sqgrid]=indexgrid(n)
% Mikhail Smirnov, MATH 330 Assignment 4

% Function's purpose is to generate a grid of indices (i,j) that each span 
% from 1 to (n+1)^2

i = 1:(n+1);
j = 1:(n+1);
% Generates grid where X varies the rows by x and Y varies the columns by Y
[I,J] = ndgrid(i,j);

% The vectorization is done by I=I(:) and J=J(:). Since I and J are
% matrices after using ndgrid, using I(:) and J(:) will transform I and J
% back into vectors that compound all of the columns into just one vector
I = I(:);
J = J(:);



k = (1:(n+1)^2)'; % This is a column of indices for the grid

% Generates a grid with all i and j combinations, along with an index, k
% It is a (n+1)^2 x 3 matrix. (First column is i, second columns is j, and
% third column is k)
sqgrid = [I J k];

