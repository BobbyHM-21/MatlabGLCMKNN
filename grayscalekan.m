function grayscale = grayscalekan(image)
gambar = image;

grayscale = uint8(zeros(size(gambar,1),size(gambar,2)));
for i=1:size(gambar,1)
    for j = 1:size(gambar,2)
        grayscale(i,j) =0.2989*gambar(i,j,1)+0.5870*gambar(i,j,2)+0.1140*gambar(i,j,3);
    end
end
end

