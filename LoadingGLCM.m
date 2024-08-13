 
 PB = waitbar(0,'1','Name','Ekstraksi Fitur GLCM');
 setappdata(PB,'canceling',0)
 
 maxiter = 5;
for i = 1 : maxiter
     
     if getappdata(PB,'canceling')
         break
     end
     
     waitbar(i/maxiter,PB,sprintf('Mengekstrak Ciri %d dari %d',i,maxiter));
     
     pause(1)
     
 end
delete(PB)