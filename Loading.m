 
 PB = waitbar(0,'1','Name','Menghitung Klasifikasi K-NN',... 
     'CreateCancelBtn',...
     'setappdata(gcbf,''canceling'',1)');
 setappdata(PB,'canceling',0)
 
 maxiter = 5;
for i = 1 : maxiter
     
     if getappdata(PB,'canceling')
         break
     end
     
     waitbar(i/maxiter,PB,sprintf('Menghitung %d dari %d',i,maxiter));
     
     pause(1)
     
 end
delete(PB)


%  x =0.6;
%  
%  h = waitbar(x, 'Mohon Tunggu Proses Klasifikasi...');
%  
%  pause(3)
%  
%  waitbar(x + 0.3, h , 'Sebentar lagi...');
%   
% delete(h)
