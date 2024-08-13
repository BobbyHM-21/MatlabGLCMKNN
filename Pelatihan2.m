clc; clear; close all; warning off all;

% KeluaK MATANG
nama_folder = 'Data_Latih\Matang';
nama_file = dir(fullfile(nama_folder,'*.jpg'));
jumlah_file = numel(nama_file); 

ciri_matang = zeros(jumlah_file,4);
target_matang = cell(jumlah_file,1);


for n = 1:jumlah_file

    Img = im2double(imread(fullfile(nama_folder,nama_file(n).name)));
    nama_file(n).name
    Img_gray = rgb2gray(Img);
      bw = imbinarize(Img_gray,.7);
       bw = imcomplement(bw);
       bw = imfill(bw,'holes');
       bw = bwareaopen(bw,100);

    glcm = GLCM(bw);
  
    Contrast = 
    Correlation =
    Energy = 
    Homogeneity =
    Entropy = 
    
    ciri_matang(n,1)=Contrast;
    ciri_matang(n,2)=Correlation;
    ciri_matang(n,3)=Energy;
    ciri_matang(n,4)=Homogeneity;
    
    target_matang{n}='Keluak Matang';
    
end


