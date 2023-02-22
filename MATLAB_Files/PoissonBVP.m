% Mikhail Smirnov, MATH 330 Assignment 4
% Solves both Poisson's Equation Boundary Value Problems with varying 
% degrees of n. (10,20,40)

% Testing indexgrid for n = 5
[sqgrid]=indexgrid(5)

% Boundary Conditions
D = @(x) 100*x;
U = @(x) 100*x^2;
L = @(y) 0;
R = @(y) 100;

% Homogenous RHS
Q1 =  @(x,y) 0;

% Nonhomogeous RHS
Q2 = @(x,y)6400*sin(4*pi*x)*cos(4*pi*y);



%%%%%%%%%%%%%%%%%%%%%%% PLOTTING %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Homogenous Poisson's Equation solution with n=10
[Tsq] = Laplace_square(10, D, U, L, R, Q1);
n = 10;
dx = 1/n;
dy = 1/n;
dxgrid = 0:dx:1;
dygrid = 0:dy:1;
[X,Y] = ndgrid(dxgrid, dygrid);
figure(1)
surf(X,Y, Tsq)
xlabel('x')
ylabel('y')
title('Homogenous Solution For Poisson''s Equation for $n = 10$','Interpreter','LaTex','Fontname','Times')

% Homogenous Poisson's Equation solution with n=20
[Tsq] = Laplace_square(20, D, U, L, R, Q1);
n = 20;
dx = 1/n;
dy = 1/n;
dxgrid = 0:dx:1;
dygrid = 0:dy:1;
[X,Y] = ndgrid(dxgrid, dygrid);
figure(2)
surf(X,Y, Tsq)
xlabel('x')
ylabel('y')
title('Homogenous Solution For Poisson''s Equation for $n = 20$','Interpreter','LaTex','Fontname','Times')

% Homogenous Poisson's Equation solution with n=40
[Tsq] = Laplace_square(40, D, U, L, R, Q1);
n = 40;
dx = 1/n;
dy = 1/n;
dxgrid = 0:dx:1;
dygrid = 0:dy:1;
[X,Y] = ndgrid(dxgrid, dygrid);
figure(3)
surf(X,Y, Tsq)
xlabel('x')
ylabel('y')
title('Homogenous Solution For Poisson''s Equation for $n = 40$','Interpreter','LaTex','Fontname','Times')



% Non-homogenous Poisson's Equation solution with n=10
[Tsq] = Laplace_square(10, D, U, L, R, Q2);
n = 10;
dx = 1/n;
dy = 1/n;
dxgrid = 0:dx:1;
dygrid = 0:dy:1;
[X,Y] = ndgrid(dxgrid, dygrid);
figure(4)
surf(X,Y, Tsq)
xlabel('x')
ylabel('y')
title('Non-homogenous Solution For Poisson''s Equation for $n = 10$','Interpreter','LaTex','Fontname','Times')

% Non-homogenous Poisson's Equation solution with n=20
[Tsq] = Laplace_square(20, D, U, L, R, Q2);
n = 20;
dx = 1/n;
dy = 1/n;
dxgrid = 0:dx:1;
dygrid = 0:dy:1;
[X,Y] = ndgrid(dxgrid, dygrid);
figure(5)
surf(X,Y, Tsq)
xlabel('x')
ylabel('y')
title('Non-homogenous Solution For Poisson''s Equation for $n = 20$','Interpreter','LaTex','Fontname','Times')

% Non-homogenous Poisson's Equation solution with n=40
[Tsq] = Laplace_square(40, D, U, L, R, Q2);
n = 40;
dx = 1/n;
dy = 1/n;
dxgrid = 0:dx:1;
dygrid = 0:dy:1;
[X,Y] = ndgrid(dxgrid, dygrid);
figure(6)
surf(X,Y, Tsq)
xlabel('x')
ylabel('y')
title('Non-homogenous Solution For Poisson''s Equation for $n = 40$','Interpreter','LaTex','Fontname','Times')
