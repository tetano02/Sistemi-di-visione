clear all;
clc

%%

%Images 

image = imread('C:\Users\utente\Pictures\Saved Pictures\eva01.jpg');
image_test = imread('C:\Users\utente\Downloads\Test_image.bmp');
image_button = imread('C:\Users\utente\Desktop\Unibs\Unibs\Terzo anno\Primo semestre\Sistemi di visione\Foto_Bottoni\Foto_vecchie\Foto_luce.bmp');
image_button_allineated = imread('C:\Users\utente\Desktop\Unibs\Unibs\Terzo anno\Primo semestre\Sistemi di visione\Foto_Bottoni\Foto_vecchie\allineati.bmp');
image_button_allineated_cut = imread('C:\Users\utente\Desktop\Unibs\Unibs\Terzo anno\Primo semestre\Sistemi di visione\Foto_Bottoni\Foto_vecchie\allineati_tagliato.bmp');
crop = imread('C:\Users\utente\Desktop\Unibs\Unibs\Terzo anno\Primo semestre\Sistemi di visione\Foto_Bottoni\Foto_vecchie\allineati_crop.bmp');
im2 = imread('C:\Users\utente\Desktop\Unibs\Unibs\Terzo anno\Primo semestre\Sistemi di visione\Foto_Bottoni\Foto_vecchie\Image__2023-10-26__12-13-20.bmp');
im3= imread('C:\Users\utente\Desktop\Unibs\Unibs\Terzo anno\Primo semestre\Sistemi di visione\Foto_Bottoni\Foto_vecchie\Image__2023-10-26__12-10-39.bmp');
%[max_intensity, min_intensity, mean_intensity, standard_deviation, num_dots,dots_size, white_space] = image_analysis(image_button_allineated,300,true);

actual_image = image_button_allineated;
gray_image = im2gray(actual_image);

actual_crop = auto_crop(gray_image,200,800,1300,1500);
figure();
imshow(actual_crop);

figure();
imshow(gray_image);

% stretched_image = stretching(gray_image);
% figure();
% imshow(stretched_image);

% adapted_image = imlocalbrighten(gray_image);
% figure();
% imshow(adapted_image);
% 
% thresh = multithresh(im2gray(adapted_image),2); % Ti ritorna n+1 layer con valori tra 0 e 255, distingue "scuri" e "chiari"
% labels = imquantize(im2gray(adapted_image),thresh);
% c = label2rgb(labels);
% 
% figure();
% imshow(c);