function [n,w,xi,N,dNdxi]=C2D3
%====================== ELEMENT INFORMATION =================================
%
%           n=number of integration points of the element
%           ncoord= numper of coordinates of the element (2D or 3D)
%           nodes=number of nodes of the element

n = 1;
ncoord=2;  
nodes=3;
%
%====================== INTEGRATION POINTS ==================================
%
%   Defines positions of integration points
%
         xi(1,1) = 1./3.;
         xi(1,2) = 1./3.;
         
         w = 0.5;
%
%================= SHAPE FUNCTIONS ==================================
%

N=zeros(n,nodes);
for i1=1:n      
       N(i1,1) = xi(i1,1);
       N(i1,2) = xi(i1,2);
       N(i1,3) = 1.-xi(i1,1)-xi(i1,2); 
end
%
%================= SHAPE FUNCTION DERIVATIVES ======================
%

dNdxi = zeros(n*ncoord,nodes);
for i1=1:n
       dNdxi(i1*2-1,1) = 1.;
       dNdxi(i1*2,2) = 1.;
       dNdxi(i1*2-1,3) = -1.;
       dNdxi(i1*2,3) = -1.;  
end
end