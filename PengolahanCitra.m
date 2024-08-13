clc; clear; close all; warning off all;

% memanggil menu "browse file"
[nama_file,nama_folder] = uigetfile('*.*');

% jika ada nama file yang dipilih maka akan mengeksekusi perintah di bawa
if ~isequal(nama_file,0)
    % membaca file citra rgb
    Img = im2double(imread(fullfile(nama_folder,nama_file)));
   
    Img_gray = rgb2gray(Img);
% %     bw = imbinarize(Img_gray,.4);
%       bw = imcomplement(Img_gray);
%       bw = imfill(bw,'holes');
%      bw = bwareaopen(bw,100);

   glcm = graycomatrix(Img_gray); 
%     glcm = graycomatrix(bw);
    stats = graycoprops(glcm,'Contrast Correlation Energy Homogeneity');
    Contrast = stats.Contrast ; 
    Correlation = stats.Correlation;
    Energy = stats.Energy;
    Homogeneity = stats.Homogeneity;
    
    features = [Contrast, Correlation, Energy ,Homogeneity]
 
 % menyusun variabel ciri_uji
    ciri_uji = [Contrast, Correlation, Energy ,Homogeneity];
 
 % memanggil model k-nn hasil pelatihan
    load Mdl
    
% membaca kelas keluaran hasil pengujian
    hasil_uji = predict(Mdl,ciri_uji);

% menampilkan citra asli dan kelas keluaran hasil pengujian
    figure, imshow(Img)
    title({['Nama File : ',nama_file],['Kelas Keluaran: ',hasil_uji{1}]})
else
    % jika ada nama file yang dipilih maka akan kembali
    return
end
    
    