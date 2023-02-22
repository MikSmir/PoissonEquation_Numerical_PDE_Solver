function [Tsq] = Laplace_square(n, Down, Up, Left, Right, Q)
% Mikhail Smirnov, MATH 330 Assignment 4
% This function solves Poisson's Equation given the amount of points on the
% grid, n, the boundary conditions Down,Up,Left,Right, and the right hand 
% side, Q. It solves the system of equations LT=Q with Gaussian Elimination

% D, U, L, R, and Q must be function handles

% n is size of points
% D, U, L, & R are all functions of one parameter (boundaries)
% Q is a function of two parameters (what the eqn equals to)

% For i, j = 1, we have the boundary conditions, and for i,j = (n+1)
% So the equation itself varies from 2 to n.
dx = 1/n;
dy = dx;

% Creates the 5 diagonals for the L matrix
% The column size is subtracted accordingly to have matching dimensions
% when adding them all together.
vec1 = -4.*ones(1,(n-1)^2); % L(k,k)
vec2 = ones(1,(n-1)^2 - 1); % L(k,k+1)
vec3 = ones(1,(n-1)^2 - 1); % L(k,k-1)
vec4 = ones(1,(n-1)^2 - 3); % L(k,k+n-1)
vec5 = ones(1,(n-1)^2 - 3); % L(k,k-n+1)

% Adds each of the diagonals up to form the pentadiagonal matrix, L,
% of size (n-1)^2 * (n-1)^2
L = diag(vec1) + diag(vec2,1) + diag(vec3,-1) + diag(vec4, 3) + diag(vec5, -3);


% Generates the grid from indexgrid for without boundary conditions
% n-2 is done to subtract the beginning and end BC's
[sqgrid]=indexgrid(n-2);

% The right hand side vector is initialized without BC's
B = zeros(1, (n-1)^2)';

% For each row of B, evaluate Q(x,y)
% The parameters are multiplied by dx and dy to discretize the points
for k =1:length(B)
    B(k)=(1/n)^2 * Q(dx*sqgrid(k,1),dy*sqgrid(k,2));
end


% Boundary conditions will have to be implemented by subtracting them
% from the right hand side of the equations.

%L(y) boundary condition from 1 to (n-1)
for indexn = 1:n-1
    B(indexn) = B(indexn) - Left((indexn + 1)*dy);
end


%R(y) boundary condition from (n-1)^2-(n-2) to (n-1)^2
indexRy = 2;
for indexn = ((n-1)^2 - (n-2)):(n-1)^2
   B(indexn) =  B(indexn) - (1/n) * Right(indexRy * dy);
   indexRy = indexRy + 1;
end

% Additional Up and Down Boundary Conditions
% at top of matrix
B(1) = B(1) - Down(2*dx);
B(3) = B(3) - Up(2*dx);
% at bottom of matrix
B((n-1)^2) = B((n-1)^2) - Up(n*dx);
B((n-1)^2-2) = B((n-1)^2-2) - Down(n*dx);
B((n-1)^2-3) = B((n-1)^2-3) - Up((n-1)*dx);

 
% Returns solution using Gaussian Elimination 
% size (n-1)^2 x 1
T=L\B;



% Reshapes the T vector to be a matrix of size (n-1) by (n-1)
T = reshape(T, [(n-1),(n-1)]);

% Initializes matrix Tsq which will include boundary conditions
% size (n-1) x (n+1)
Tsq = zeros(n+1);

% Stores the T matrix into Tsq, where the first and last rows
% and the first and last columns are zero.
Tsq(2:n, 2:n) = T(:,:);


% Fills up first and last rows/columns with their respective boundary
% conditions
for i=1:n+1
    Tsq(1,i) = Down(i * dx); 
    Tsq(n+1,i) = Up(i * dx);
    Tsq(i, 1) = Left(i * dy);
    Tsq(i,n+1)= Right(i * dy);
end


end

