function [n,w,xi,N,dNdxi]=C3D8
%====================== ELEMENT INFORMATION =================================
%
%           n=number of integration points of the element
%           ncoord= numper of coordinates of the element (2D or 3D)
%           nodes=number of nodes of the element

n = 8;
ncoord=3;  
nodes=8;
%
%====================== INTEGRATION POINTS ==================================
%
%   Defines positions of integration points
%

 x1D = [-0.5773502692,0.5773502692];
         for k = 1:2
           for j = 1:2 
             for i = 1:2
               n = 4*(k-1) + 2*(j-1) + i;
               xi(n,1) = x1D(i);
               xi(n,2) = x1D(j);
               xi(n,3) = x1D(k);
             end
           end
         end
         
         w = [1.,1.,1.,1.,1.,1.,1.,1.];
%
%================= SHAPE FUNCTIONS ==================================
%

N=zeros(n,nodes);
for i1=1:n
       N(i1,1) = (1.-xi(i1,1))*(1.-xi(i1,2))*(1.-xi(i1,3))/8.;
       N(i1,2) = (1.+xi(i1,1))*(1.-xi(i1,2))*(1.-xi(i1,3))/8.;
       N(i1,3) = (1.+xi(i1,1))*(1.+xi(i1,2))*(1.-xi(i1,3))/8.;
       N(i1,4) = (1.-xi(i1,1))*(1.+xi(i1,2))*(1.-xi(i1,3))/8.;
       N(i1,5) = (1.-xi(i1,1))*(1.-xi(i1,2))*(1.+xi(i1,3))/8.;
       N(i1,6) = (1.+xi(i1,1))*(1.-xi(i1,2))*(1.+xi(i1,3))/8.;
       N(i1,7) = (1.+xi(i1,1))*(1.+xi(i1,2))*(1.+xi(i1,3))/8.;
       N(i1,8) = (1.-xi(i1,1))*(1.+xi(i1,2))*(1.+xi(i1,3))/8.;
end
%
%================= SHAPE FUNCTION DERIVATIVES ======================
%

dNdxi = zeros(ncoord*n,nodes);
for i1=1:n
       dNdxi(i1*3-2,1) = -(1.-xi(i1,2))*(1.-xi(i1,3))/8.;
       dNdxi(i1*3-1,1) = -(1.-xi(i1,1))*(1.-xi(i1,3))/8.;
       dNdxi(i1*3,1) = -(1.-xi(i1,1))*(1.-xi(i1,2))/8.;
       dNdxi(i1*3-2,2) = (1.-xi(i1,2))*(1.-xi(i1,3))/8.;
       dNdxi(i1*3-1,2) = -(1.+xi(i1,1))*(1.-xi(i1,3))/8.;
       dNdxi(i1*3,2) = -(1.+xi(i1,1))*(1.-xi(i1,2))/8.;
       dNdxi(i1*3-2,3) = (1.+xi(i1,2))*(1.-xi(i1,3))/8.;
       dNdxi(i1*3-1,3) = (1.+xi(i1,1))*(1.-xi(i1,3))/8.;
       dNdxi(i1*3,3) = -(1.+xi(i1,1))*(1.+xi(i1,2))/8.;
       dNdxi(i1*3-2,4) = -(1.+xi(i1,2))*(1.-xi(i1,3))/8.;
       dNdxi(i1*3-1,4) = (1.-xi(i1,1))*(1.-xi(i1,3))/8.;
       dNdxi(i1*3,4) = -(1.-xi(i1,1))*(1.+xi(i1,2))/8.;
       dNdxi(i1*3-2,5) = -(1.-xi(i1,2))*(1.+xi(i1,3))/8.;
       dNdxi(i1*3-1,5) = -(1.-xi(i1,1))*(1.+xi(i1,3))/8.;
       dNdxi(i1*3,5) = (1.-xi(i1,1))*(1.-xi(i1,2))/8.;
       dNdxi(i1*3-2,6) = (1.-xi(i1,2))*(1.+xi(i1,3))/8.;
       dNdxi(i1*3-1,6) = -(1.+xi(i1,1))*(1.+xi(i1,3))/8.;
       dNdxi(i1*3,6) = (1.+xi(i1,1))*(1.-xi(i1,2))/8.;
       dNdxi(i1*3-2,7) = (1.+xi(i1,2))*(1.+xi(i1,3))/8.;
       dNdxi(i1*3-1,7) = (1.+xi(i1,1))*(1.+xi(i1,3))/8.;
       dNdxi(i1*3,7) = (1.+xi(i1,1))*(1.+xi(i1,2))/8.;
       dNdxi(i1*3-2,8) = -(1.+xi(i1,2))*(1.+xi(i1,3))/8.;
       dNdxi(i1*3-1,8) = (1.-xi(i1,1))*(1.+xi(i1,3))/8.;
       dNdxi(i1*3,8) = (1.-xi(i1,1))*(1.+xi(i1,2))/8.;
end
end
%
