function [n,w,xi,N,dNdxi]=C3D10
%====================== No. integration points =============================
%
%   Defines the number of integration points:be used for
%   each element type
%

n = 4;
ncoord=3;  
nodes=10;
%
%====================== INTEGRATION POINTS ==================================
%
%   Defines positions of integration points
%

 xi(1,1) = 0.58541020;
         xi(2,1) = 0.13819660;
         xi(3,1) = xi(2,1);
         xi(1,2) = xi(2,1);
         xi(2,2) = xi(1,1);
         xi(3,2) = xi(2,1);
         xi(1,3) = xi(2,1);
         xi(2,3) = xi(2,1);
         xi(3,3) = xi(1,1);
         xi(1,4) = xi(2,1);
         xi(2,4) = xi(2,1);
         xi(3,4) = xi(2,1);
         
         w = [1./24.,1./24.,1./24.,1./24.];
%
%================= SHAPE FUNCTIONS ==================================
%
%        Nij: Shape functions of the Int Point i [4x4] Ni [4x1]

N=zeros(n,n);
for i1=1:n
xi4 = 1.-xi(i1,1)-xi(i1,2)-xi(i1,3);
       N(i1,1) = (2.*xi(i1,1)-1.)*xi(i1,1);
       N(i1,2) = (2.*xi(i1,2)-1.)*xi(i1,2);
       N(i1,3) = (2.*xi(i1,3)-1.)*xi(i1,3);
       N(i1,4) = (2.*xi4-1.)*xi4;
       N(i1,5) = 4.*xi(i1,1)*xi(i1,2);
       N(i1,6) = 4.*xi(i1,2)*xi(i1,3);
       N(i1,7) = 4.*xi(i1,3)*xi(i1,1);
       N(i1,8) = 4.*xi(i1,1)*xi4;
       N(i1,9) = 4.*xi(i1,2)*xi4;
       N(i1,10) = 4.*xi(i1,3)*xi4;
end
%
%================= SHAPE FUNCTION DERIVATIVES ======================
%
%        Nij,r: Dev of shape functions of the Int Point i [4x8]
%        [2*i-1 2*i] => dNi,r [4x2]
dNdxi = zeros(ncoord*n,nodes);
for i1=1:n
       xi4 = 1.-xi(i1,1)-xi(i1,2)-xi(i1,3);
       dNdxi(i1*3-2,1) = (4.*xi(i1,1)-1.);
       dNdxi(i1*3-1,2) = (4.*xi(i1,2)-1.);
       dNdxi(i1*3,3) = (4.*xi(i1,3)-1.);
       dNdxi(i1*3-2,4) = -(4.*xi4-1.);
       dNdxi(i1*3-1,4) = -(4.*xi4-1.);
       dNdxi(i1*2,4) = -(4.*xi4-1.);
       dNdxi(i1*3-2,5) = 4.*xi(i1,2);
       dNdxi(i1*3-1,5) = 4.*xi(i1,1);
       dNdxi(i1*3-1,6) = 4.*xi(i1,3);
       dNdxi(i1*3,6) = 4.*xi(i1,2);
       dNdxi(i1*3-2,7) = 4.*xi(i1,3);
       dNdxi(i1*3,7) = 4.*xi(i1,1); 
       dNdxi(i1*3-2,8) = 4.*(xi4-xi(i1,1));
       dNdxi(i1*3-1,8) = -4.*xi(i1,1);
       dNdxi(i1*3,8) = -4.*xi(v1);
       dNdxi(i1*3-2,9) = -4.*xi(i1,2);
       dNdxi(i1*3-1,9) = 4.*(xi4-xi(i1,2));
       dNdxi(i1*3,9) = -4.*xi(i1,2);
       dNdxi(i1*3-2,10) = -4.*xi(i1,3)*xi4;
       dNdxi(i1*3-1,10) = -4.*xi(i1,3);
       dNdxi(i1*3,10) = 4.*(xi4-xi(i1,3));
end
end
%
