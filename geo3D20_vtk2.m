%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Getting geometry from abaqus to export it to ensight
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%% LOADING FILES OF NODES AND ELEM %%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%% WRITING HEADING FOR VTK FILE

	% printing heading to file
f=fopen(fullfile('paraview','3D20_Paraview.vtk'),'w');
fprintf(f,'# vtk DataFile Version 1.0\n');
fprintf(f,'ECM-CELL DIFFUSION-MECHANICS\n');
fprintf(f,'ASCII\n');
fprintf(f,'\n');
fprintf(f,'DATASET UNSTRUCTURED_GRID\n');
fprintf(f,'%s %8i %s\n','POINTS', length(X) ,'float');

%%%%%%%%%%%%%%%%%%%%%% WRITING COORDINATES OF NODES %%%%%%%%%%%%%%%%%%%%%%%%%

	% printing coordinates
for i1=1:length(X)
    fprintf(f,'%14.8E  %14.8E %14.8E\n',X(i1,2:4));
end
fprintf(f,'\n');

%%%%%%%%%%%%%%%%%%%%%% WRITING CONNECTIVITY OF NODES %%%%%%%%%%%%%%%%%%%%%%%%%

fprintf(f,'%s %8i %16i\n','CELLS', length(T) , length(T)*21);
for i1=1:length(T)     
  fprintf(f,'%4i %10i  %10i  %10i  %10i  %10i  %10i  %10i  %10i  %10i  %10i  %10i  %10i  %10i  %10i  %10i  %10i  %10i  %10i  %10i  %10i\n',20,T(i1,2)-1,T(i1,3)-1,T(i1,4)-1,T(i1,5)-1,T(i1,6)-1,T(i1,7)-1,T(i1,8)-1,T(i1,9)-1,T(i1,10)-1,T(i1,11)-1,T(i1,12)-1,T(i1,13)-1,T(i1,14)-1,T(i1,15)-1,T(i1,16)-1,T(i1,17)-1,T(i1,18)-1,T(i1,19)-1,T(i1,20)-1,T(i1,21)-1);
end
fprintf(f,'\n');
fprintf(f,'%s %8i\n','CELL_TYPES', length(T));
for i1=1:length(T)
  fprintf(f,'%4i\n',25);
end
fprintf(f,'\n');          

%%%%%%%%%%%%%%%%%%%%%% WRITING VARIABLES %%%%%%%%%%%%%%%%%%%%%%%%%
fprintf(f,'%s %8i\n','POINT_DATA', length(X));
fprintf(f,'SCALARS Ux float\n');
fprintf(f,'LOOKUP_TABLE default\n');
for i1=1:length(X)
  fprintf(f,'%14.8E\n', Temp(i1));
end

fclose(f)
