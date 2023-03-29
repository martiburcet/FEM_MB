function [n,w,xi,N,dNdxi]=C2D6
%====================== ELEMENT INFORMATION =================================
%
%           n=number of integration points of the element
%           ncoord= numper of coordinates of the element (2D or 3D)
%           nodes=number of nodes of the element

n = 3;
ncoord=2;  
nodes=6;
%
%====================== INTEGRATION POINTS ==================================
%
%   Defines positions of integration points
%
         xi(1,1) = 0.6;
         xi(1,2) = 0.2;
         xi(2,1) = 0.2;
         xi(2,2) = 0.6;
         xi(3,1) = 0.2;
         xi(3,1) = 0.2;
         
         w= [1./6.,1./6.,1./6.];
%
%================= SHAPE FUNCTIONS ==================================
%

N=zeros(n,nodes);
for i1=1:n      
         xi3 = 1.-xi(i1,1)-xi(i1,2);
       N(i1,1) = (2.*xi(i1,1)-1.)*xi(i1,1);
       N(i1,2) = (2.*xi(i1,2)-1.)*xi(i1,2);
       N(i1,3) = (2.*xi3-1.)*xi3;
       N(i1,4) = 4.*xi(i1,1)*xi(i1,2);
       N(i1,5) = 4.*xi(i1,2)*xi3;
       N(i1,6) = 4.*xi3*xi(i1,1);
end
%
%================= SHAPE FUNCTION DERIVATIVES ======================
%

dNdxi = zeros(n*ncoord,nodes);
for i1=1:n
       xi3 = 1.-xi(i1,1)-xi(i1,2); 
       dNdxi(i1*2-1,1) = 4.*xi(i1,1)-1.;
       dNdxi(i1*2,2) = 4.*xi(i1,2)-1.;
       dNdxi(i1*2-1,3) = -(4.*xi3-1.);
       dNdxi(i1*2,3) = -(4.*xi3-1.);
       dNdxi(i1*2-1,4) = 4.*xi(i1,2) ;
       dNdxi(i1*2,4) = 4.*xi(i1,1) ;
       dNdxi(i1*2-1,5) =  - 4.*xi(i1,2);
       dNdxi(i1*2,5) =  4.*xi3 - 4.*xi(i1,2);
       dNdxi(i1*2-1,6) = 4.*xi3 - 4.*xi(i1,1);
       dNdxi(i1*2,6) = -4.*xi(i1,1);        
end
end