% This program solves a convection-diffusion problem in the domain proposed in HM1
% 

clear, close all, home

global diffusion  

disp(' ')
disp('This program solves a diffusion equation on the HM-1s geometry')
disp(' ')
disp('No source term is considered')
disp(' ')
disp('Diffusion coefficient = 1');



diffusion = 1;

% GEOMETRY

% nodes=input('Enter nodes matrix name: ','s');
% elements=input('Enter elements matrix: ','s');

%Examples: uncommenting the lines below you could run the examples 
%provided to test the code in a frindly interfacetest. 

disp('Select geometry type:');
disp('Linear triangle [1]');
disp('Linear quadrilateral [2}');
disp('Quadratic triangle [3]');
disp('Quadratic quadrilateral [4]');
disp('Linear tetrahedral [5]');
disp('Linear hexahedral [6]');
disp('Quadratic tetrahedral [7]');
disp('Quadratic hexahedral [8]');

problem = input('Number: ');
if problem == 1
    nodes = 'nodes_2D_tri_linear.dat';
    elements ='elem_2D_tri_linear.dat';
elseif problem ==2
    nodes = 'nodes_2D_quad_linear.dat';
    elements ='elem_2D_quad_linear.dat';
elseif problem ==3
    nodes = 'nodes_2D_tri_quad.dat';
    elements ='elem_2D_tri_quad.dat';
elseif problem ==4
    nodes = 'nodes_2D_quad_quad.dat';
    elements ='elem_2D_quad_quad.dat';
elseif problem ==5
    nodes = 'nodes_3D_tri_linear.dat';
    elements ='elem_3D_tri_linear.dat';
elseif problem ==6
    nodes = 'nodes_3D_quad_linear.dat';
    elements ='elem_3D_quad_linear.dat';
elseif problem ==7
    nodes = 'nodes_3D_tri_quad.dat';
    elements ='elem_3D_tri_quad.dat';
elseif problem ==8
    nodes = 'nodes_3D_quad_quad.dat';
    elements ='elem_3D_quad_quad.dat';
end
tic
X= load (fullfile('nodes',nodes));
T= load (fullfile('elements',elements));

[nXi,nXy]=size(X);
[nTi,nTy]=size(T);


%ELEMENT TYPE FUNCTIONS & LOAD BOUNDARY CONDITIONS

if nXy==3                     % 2D element
    if nTy==4 
        [n,wpg,pospg,N,dNdxi] = C2D3;  %triangular linear
        load(fullfile('groups','group_2D_tri_linear'));
    elseif nTy==5
        [n,wpg,pospg,N,dNdxi] = C2D4;  %quad linear
        load(fullfile('groups','group_2D_tri_linear'));
    elseif nTy==7
        [n,wpg,pospg,N,dNdxi] =C2D6;    %triangular quadratic
        load(fullfile('groups','group_2D_tri_quad'));
    elseif nTy==9
        [n,wpg,pospg,N,dNdxi] =C2D8;    %quad quadratic
        load(fullfile('groups','group_2D_quad_quad'));
    end

elseif nXy==4                   % 3D element
   
    if nTy==5  
        [n,wpg,pospg,N,dNdxi] =C3D4;     %tetrahedral linear
         load(fullfile('groups','group_3D_tri_linear'));
    elseif nTy==9
        [n,wpg,pospg,N,dNdxi] =C3D8;    %hexahedral linear
         load(fullfile('groups','group_3D_quad_linear'));                  
    elseif nTy==11
        [n,wpg,pospg,N,dNdxi] =C3D10;   %tetrahedral quadratic
        load(fullfile('groups','group_3D_tri_quad'));
    elseif nTy==21
        [n,wpg,pospg,N,dNdxi] =C3D20;    %hexhedral quadratic
        load(fullfile('groups','group_3D_quad_quad'));
    end
end
    
    
% SYSTEM RESULTING OF DISCRETIZING THE WEAK FORM
[K,f] = CreateMatrix(X(:,2:end),T(:,2:end),pospg,wpg,N,dNdxi);

% BOUNDARY CONDITIONS

    % INLET: nodes on which solution is u=1
nodesDir1 = (nodes_inlet)';

    % OUTLET: nodes on which solution is u=0
nodesDir0 = (nodes_outlet)';

    % Boundary condition matrix
C = [nodesDir1,ones(length(nodesDir1),1); nodesDir0,zeros(length(nodesDir0),1)];

ndir = size(C,1);
neq = size(f,1);
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

% POSTPROCESS
   if nXy==3         % 2D element
    if nTy==4    
        geo2D3_vtk2;    %triangular linear
    elseif nTy==5
        geo2D4_vtk2;     %quad linear
    elseif nTy==7
        geo2D6_vtk2;    %triangular quadratic
    elseif nTy==9
        geo2D8_vtk2;     %quad quadratic
    end

elseif nXy==4         % 3D element
    if nTy==5      
        geo3D4_vtk2;    %tetrahedral linear
        f;
    elseif nTy==9
        geo3D8_vtk2;    %hexahedral linear
    elseif nTy==11
        geo3D10_vtk2;   %tetrahedral quadratic
    elseif nTy==21
        geo3D20_vtk2;   %hexhedral quadratic
    end
   end
   toc