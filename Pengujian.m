clc; clear; close all; warning off all;

% KeluaK MATANG
nama_folder = 'Data_Uji\Matang';
nama_file = dir(fullfile(nama_folder,'*.jpg'));
jumlah_file = numel(nama_file); 

ciri_matang = zeros(jumlah_file,4);
target_matang = cell(jumlah_file,1);


for n = 1:jumlah_file

    Img = im2double(imread(fullfile(nama_folder,nama_file(n).name)));
    nama_file(n).name
    Img_gray = rgb2gray(Img);
%      bw = imbinarize(Img_gray,.7);
%      bw = imcomplement(bw);
%      bw = imfill(bw,'holes');
%      bw = bwareaopen(bw,100);

     glcm = graycomatrix(Img_gray);
%     glcm = graycomatrix(bw);
    stats = graycoprops(glcm,'Contrast Correlation Energy Homogeneity');
    Contrast = stats.Contrast ; 
    Correlation = stats.Correlation;
    Energy = stats.Energy;
    Homogeneity = stats.Homogeneity;
    
    features = [Contrast, Correlation, Energy ,Homogeneity]
    
    ciri_matang(n,1)=Contrast;
    ciri_matang(n,2)=Correlation;
    ciri_matang(n,3)=Energy;
    ciri_matang(n,4)=Homogeneity;
    
    target_matang{n}='Keluak Matang';
    
end

% Keluak Setengah Matang 

nama_folder = 'Data_Uji\Setengah_Matang';
nama_file = dir(fullfile(nama_folder,'*.jpg'));
jumlah_file = numel(nama_file); 

ciri_Smatang = zeros(jumlah_file,4);
target_Smatang = cell(jumlah_file,1);


for n = 1:jumlah_file

    Img = im2double(imread(fullfile(nama_folder,nama_file(n).name)));
    nama_file(n).name
    Img_gray = rgb2gray(Img);
%      bw = imbinarize(Img_gray,.7);
%      bw = imcomplement(bw);
%      bw = imfill(bw,'holes');
%      bw = bwareaopen(bw,100);

     glcm = graycomatrix(Img_gray);
%      glcm = graycomatrix(bw);
    stats = graycoprops(glcm,'Contrast Correlation Energy Homogeneity');
    Contrast = stats.Contrast ; 
    Correlation = stats.Correlation;
    Energy = stats.Energy;
    Homogeneity = stats.Homogeneity;
    
    features = [Contrast, Correlation, Energy ,Homogeneity]
    
    ciri_Smatang(n,1)=Contrast;
    ciri_Smatang(n,2)=Correlation;
    ciri_Smatang(n,3)=Energy;
    ciri_Smatang(n,4)=Homogeneity;
    
    target_Smatang{n}='Keluak Setengah Matang';
    
end
    % Keluak Mentah 

nama_folder = 'Data_Uji\Mentah';
nama_file = dir(fullfile(nama_folder,'*.jpg'));
jumlah_file = numel(nama_file); 

ciri_mentah = zeros(jumlah_file,4);
target_mentah = cell(jumlah_file,1);


for n = 1:jumlah_file

    Img = im2double(imread(fullfile(nama_folder,nama_file(n).name)));
    nama_file(n).name
    Img_gray = rgb2gray(Img);
%      bw = imbinarize(Img_gray,.7);
%      bw = imcomplement(bw);
%      bw = imfill(bw,'holes');
% %     bw = bwareaopen(bw,100);

    glcm = graycomatrix(Img_gray); 
%     glcm = graycomatrix(bw);
    stats = graycoprops(glcm,'Contrast Correlation Energy Homogeneity');
    Contrast = stats.Contrast ; 
    Correlation = stats.Correlation;
    Energy = stats.Energy;
    Homogeneity = stats.Homogeneity;
    
    features = [Contrast, Correlation, Energy ,Homogeneity]
    
    ciri_mentah(n,1)=Contrast;
    ciri_mentah(n,2)=Correlation;
    ciri_mentah(n,3)=Energy;
    ciri_mentah(n,4)=Homogeneity;
    
    target_mentah{n}='Keluak Mentah';
    
end

% menyusun variabel ciri_uji dan targer_uji
ciri_uji = [ciri_matang;ciri_Smatang;ciri_mentah];
target_uji = [target_matang;target_Smatang;target_mentah];

% memanggil model k-nn hasil pelatihan
load Mdl

% membaca kelas keluaran hasil pengujian
hasil_uji = predict(Mdl,ciri_uji);

% menghitung akurasi pengujian
jumlah_benar = 0; 
jumlah_data = size(ciri_uji,1);
for k = 1:jumlah_data
    
    if isequal(hasil_uji{k},target_uji{k})
        jumlah_benar = jumlah_benar+1;
    end
end
akurasi_pengujian = jumlah_benar/jumlah_data*100

