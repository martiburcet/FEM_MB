function [n,w,xi,N,dNdxi]=C2D4
%====================== ELEMENT INFORMATION =================================
%
%           n=number of integration points of the element
%           ncoord= numper of coordinates of the element (2D or 3D)
%           nodes=number of nodes of the element

n = 4;
ncoord=2;  
nodes=4;
%
%====================== INTEGRATION POINTS ==================================
%
%   Defines positions of integration points
%

         xi(1,1) = -0.5773502692;
         xi(1,2) = xi(1,1);
         xi(2,1) = -xi(1,1);
         xi(2,2) = xi(1,1);
         xi(3,1) = xi(1,1);
         xi(3,2) = -xi(1,1);
         xi(4,1) = -xi(1,1);
         xi(4,2) = -xi(1,1);



         w = [1.,1.,1.,1.];
%
%================= SHAPE FUNCTIONS ==================================
%

N=zeros(n,nodes);
for i1=1:n
       N(i1,1) = 0.25*(1.-xi(i1,1))*(1.-xi(i1,2));
       N(i1,2) = 0.25*(1.+xi(i1,1))*(1.-xi(i1,2));
       N(i1,3) = 0.25*(1.+xi(i1,1))*(1.+xi(i1,2));
       N(i1,4) = 0.25*(1.-xi(i1,1))*(1.+xi(i1,2));
end
%
%================= SHAPE FUNCTION DERIVATIVES ======================
%

dNdxi = zeros(n*ncoord,nodes);
for i1=1:n
       dNdxi(i1*2-1,1) = -0.25*(1.-xi(i1,2));
       dNdxi(i1*2,1) = -0.25*(1.-xi(i1,1));
       dNdxi(i1*2-1,2) = 0.25*(1.-xi(i1,2));
       dNdxi(i1*2,2) = -0.25*(1.+xi(i1,1));
       dNdxi(i1*2-1,3) = 0.25*(1.+xi(i1,2));
       dNdxi(i1*2,3) = 0.25*(1.+xi(i1,1));
       dNdxi(i1*2-1,4) = -0.25*(1.+xi(i1,2));
       dNdxi(i1*2,4) = 0.25*(1.-xi(i1,1));
end
end
%
