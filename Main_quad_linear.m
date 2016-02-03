% This program solves a convection-diffusion problem 
% in a square domain [0,1]x[0,1] using bilinear elements.
% 

clear, close all, home

global diffusion  h 

disp(' ')
disp('This program solves a diffusion equation on [0,1]x[0,1]')
disp(' ')
disp('No source term is considered');


diffusion = input('Diffusion coefficient = ');

% GEOMETRY
X= load ('nodes_2D_quad_linear.dat');
T= load ('elm_2D_quad_linear.dat');

% NUMERICAL INTEGRATION
% Number of gauss points
ngaus = 4;

% Quadrature,Shape Functions
[n,wpg,pospg,N,dNdxi] = C2D4 ;

% SYSTEM RESULTING OF DISCRETIZING THE WEAK FORM
[K,f] = CreateMatrix(X(:,2:end),T(:,2:end),pospg,wpg,N,dNdxi);

% BOUNDARY CONDITIONS 
    %Boundary Conditions where is u=1
    nodesDir1 = [1 14 75 76 77 78 79 80]';
    %Boundary Conditions where is u=0
    nodesDir0 = [4:1:12]';
    % Boundary condition matrix
    C = [nodesDir1, ones(length(nodesDir1),1);
         nodesDir0, zeros(length(nodesDir0),1)];

ndir = size(C,1);
neq  = size(f,1);
A = zeros(ndir,neq);
A(:,C(:,1)) = eye(ndir);

b = C(:,2);


% SOLUTION OF THE LINEAR SYSTEM
% Entire matrix
Ktot = [K A';A zeros(ndir,ndir)];
ftot = [f;b];

sol = Ktot\ftot;
Temp = sol(1:neq);
multip = sol(neq+1:end);

