function [n,w,xi,N,dNdxi]=C2D8
%====================== ELEMENT INFORMATION =================================
%
%           n=number of integration points of the element
%           ncoord= numper of coordinates of the element (2D or 3D)
%           nodes=number of nodes of the element

n = 8;
ncoord=2;  
nodes=8;
%
%====================== INTEGRATION POINTS ==================================
%
%   Defines positions of integration points
%

         xi(1,1) = -0.7745966692;
         xi(1,2) = xi(1,1);
         xi(2,1) = 0.0;
         xi(2,2) = xi(1,1);
         xi(3,1) = -xi(1,1);
         xi(3,2) = xi(1,1);
         xi(4,1) = xi(1,1);
         xi(4,2) = 0.0;
         xi(5,1) = 0.0;
         xi(5,2) = 0.0;
         xi(6,1) = -xi(1,1);
         xi(6,2) = 0.0;
         xi(7,1) = xi(1,1);
         xi(7,2) = -xi(1,1);
         xi(8,1) = 0.;
         xi(8,2) = -xi(1,1);
         xi(9,1) = -xi(1,1);
         xi(9,2) = -xi(1,1);
         
        w1D = [0.555555555,0.888888888,0.55555555555];
         for j = 1:3
           for i = 1:3
             n = 3*(j-1)+i;
             w(n) = w1D(i)*w1D(j);
           end
         end    
 
%
%================= SHAPE FUNCTIONS ==================================
%


N=zeros(n,nodes);
for i1=1:n
       N(i1,1) = -0.25*(1.-xi(i1,1))*(1.-xi(i1,2))*(1.+xi(i1,1)+xi(i1,2));
       N(i1,2) = 0.25*(1.+xi(i1,1))*(1.-xi(i1,2))*(xi(i1,1)-xi(i1,2)-1.);
       N(i1,3) = 0.25*(1.+xi(i1,1))*(1.+xi(i1,2))*(xi(i1,1)+xi(i1,2)-1.);
       N(i1,4) = 0.25*(1.-xi(i1,1))*(1.+xi(i1,2))*(xi(i1,2)-xi(i1,1)-1.);
       N(i1,5) = 0.5*(1.-xi(i1,1)*xi(i1,1))*(1.-xi(i1,2));
       N(i1,6) = 0.5*(1.+xi(i1,1))*(1.-xi(i1,2)*xi(i1,2));
       N(i1,7) = 0.5*(1.-xi(i1,1)*xi(i1,1))*(1.+xi(i1,2));
       N(i1,8) = 0.5*(1.-xi(i1,1))*(1.-xi(i1,2)*xi(i1,2));
end
%
%================= SHAPE FUNCTION DERIVATIVES ======================
%

dNdxi = zeros(ncoord*n,nodes);
for i1=1:n
       dNdxi(i1*2-1,1) = 0.25*(1.-xi(i1,2))*(2.*xi(i1,1)+xi(i1,2));
       dNdxi(i1*2,1) = 0.25*(1.-xi(i1,1))*(xi(i1,1)+2.*xi(i1,2));
       dNdxi(i1*2-1,2) = 0.25*(1.-xi(i1,2))*(2.*xi(i1,1)-xi(i1,2));
       dNdxi(i1*2,2) = 0.25*(1.+xi(i1,1))*(2.*xi(i1,2)-xi(i1,1));
       dNdxi(i1*2-1,3) = 0.25*(1.+xi(i1,2))*(2.*xi(i1,1)+xi(i1,2));
       dNdxi(i1*2,3) = 0.25*(1.+xi(i1,1))*(2.*xi(i1,2)+xi(i1,1));
       dNdxi(i1*2-1,4) = 0.25*(1.+xi(i1,2))*(2.*xi(i1,1)-xi(i1,2));
       dNdxi(i1*2,4) =  0.25*(1.-xi(i1,1))*(2.*xi(i1,2)-xi(i1,1));
       dNdxi(i1*2-1,5) = -xi(i1,1)*(1.-xi(i1,2));
       dNdxi(i1*2,5) = -0.5*(1.-xi(i1,1)*xi(i1,1));
       dNdxi(i1*2-1,6) = 0.5*(1.-xi(i1,2)*xi(i1,2));
       dNdxi(i1*2,6) = -(1.+xi(i1,1))*xi(i1,2);
       dNdxi(i1*2-1,7) = -xi(i1,1)*(1.+xi(i1,2));
       dNdxi(i1*2,7) = 0.5*(1.-xi(i1,1)*xi(i1,1));
       dNdxi(i1*2-1,8) = -0.5*(1.-xi(i1,2)*xi(i1,2));
       dNdxi(i1*2,8) = -(1.-xi(i1,1))*xi(i1,2);
end
end
%
