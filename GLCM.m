function [fiturGLCM] = GLCM(image)

if(min(min(image))== 0)
    image = image + 1;
end

imagereal=image;
imageGLCM = imagereal;
% imageGLCM = grayscalekan(imagereal);

imageGLCM0=padarray(imageGLCM, [1 0],1,'post');
imageGLCM90=padarray(imageGLCM, [0 1],1,'post');

[baris, kolom] = size(imageGLCM);
[baris1, kolom1] = size(imageGLCM0);
[baris2, kolom2] = size(imageGLCM90);
maxGrey = max(max(imageGLCM));

G0 = zeros(maxGrey,maxGrey);
G45 = zeros(maxGrey,maxGrey);
G90 = zeros(maxGrey,maxGrey);
G135 = zeros(maxGrey,maxGrey);

for k =1:baris1-1
    for i=1:kolom1-1
    temp0 = imageGLCM0(k:k+1,i:i+1);
    G0(temp0(1,1),temp0(1,2))=G0(temp0(1,1),temp0(1,2))+1;
    end
end

for m=1:baris2-1
    for n=1:kolom2-1
        temp90 = imageGLCM90(m:m+1,n:n+1);
        G90(temp90(2,1),temp90(1,1))=G90(temp90(2,1),temp90(1,1))+1;
    end
end
for i =1:baris-1
    for j=1:kolom-1
        temp1 = imageGLCM(i:i+1,j:j+1);
        G45(temp1(2,1),temp1(1,2))=G45(temp1(2,1),temp1(1,2))+1;
        G135(temp1(2,2),temp1(1,1))=G135(temp1(2,2),temp1(1,1))+1;
    end
end

fiturGLCM = zeros(1,20);

G0transpose = transpose(G0);
G45transpose = transpose(G45);
G90transpose = transpose(G90);
G135transpose = transpose(G135);

G0simetris = G0 + G0transpose;
G45simetris = G45 + G45transpose;
G90simetris = G90 + G90transpose;
G135simetris = G135 + G135transpose;

    fiturGLCM(1,1) = Contras(G0simetris);
    fiturGLCM(1,2) = Contras(G45simetris);
    fiturGLCM(1,3) = Contras(G90simetris);
    fiturGLCM(1,4) = Contras(G135simetris);
    
    fiturGLCM(1,5) = entropy(G0simetris);
    fiturGLCM(1,6) = entropy(G45simetris);
    fiturGLCM(1,7) = entropy(G90simetris);
    fiturGLCM(1,8) = entropy(G135simetris);
    
    fiturGLCM(1,9) = energy(G0simetris);
    fiturGLCM(1,10) = energy(G45simetris);
    fiturGLCM(1,11) = energy(G90simetris);
    fiturGLCM(1,12) = energy(G135simetris);
    
    fiturGLCM(1,13) = Correlation(G0simetris);
    fiturGLCM(1,14) = Correlation(G45simetris);
    fiturGLCM(1,15) = Correlation(G90simetris);
    fiturGLCM(1,16) = Correlation(G135simetris);
    
    fiturGLCM(1,17) = homogenity(G0simetris);
    fiturGLCM(1,18) = homogenity(G45simetris);
    fiturGLCM(1,19) = homogenity(G90simetris);
    fiturGLCM(1,20) = homogenity(G135simetris);
