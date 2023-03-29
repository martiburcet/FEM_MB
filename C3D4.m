function [n,w,xi,N,dNdxi]=C3D4
%====================== ELEMENT INFORMATION =================================
%
%           n=number of integration points of the element
%           ncoord= numper of coordinates of the element (2D or 3D)
%           nodes=number of nodes of the element

n = 1;
ncoord=3;  
nodes=4;
%
%====================== INTEGRATION POINTS ==================================
%
%   Defines positions of integration points
%

         xi(1,1) = 0.25;
         xi(1,2) = 0.25;
         xi(1,3) = 0.25;
         
         w = 1./6.;
%
%================= SHAPE FUNCTIONS ==================================
%

N=zeros(n,nodes);
for i1=1:n
       N(i1,1) = xi(i1,1);
       N(i1,2) = xi(i1,2);
       N(i1,3) = xi(i1,3);
       N(i1,4) = 1.-xi(i1,1)-xi(i1,2)-xi(i1,3);
end
%
%================= SHAPE FUNCTION DERIVATIVES ======================
%

dNdxi = zeros(ncoord*n,nodes);
for i1=1:n
       dNdxi(i1*3-2,1) = 1.;
       dNdxi(i1*3-1,2) = 1.;
       dNdxi(i1*3,3) = 1.;
       dNdxi(i1*3-2,4) = -1.;
       dNdxi(i1*3-1,4) = -1.;
       dNdxi(i1*3,4) = -1.;
end
end
%
