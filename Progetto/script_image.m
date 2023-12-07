%%

clear all;
clc
close all;

%% Old images

image_eva = imread('C:\Users\utente\Pictures\Saved Pictures\eva01.jpg');
image_test = imread('C:\Users\utente\Downloads\Test_image.bmp');
image_button = imread('C:\Users\utente\Desktop\Unibs\Unibs\Terzo anno\Primo semestre\Sistemi di visione\Foto_Bottoni\Foto_vecchie\Foto_luce.bmp');
image_button_allineated = imread('C:\Users\utente\Desktop\Unibs\Unibs\Terzo anno\Primo semestre\Sistemi di visione\Foto_Bottoni\Foto_vecchie\allineati.bmp');
image_button_allineated_cut = imread('C:\Users\utente\Desktop\Unibs\Unibs\Terzo anno\Primo semestre\Sistemi di visione\Foto_Bottoni\Foto_vecchie\allineati_tagliato.bmp');
crop = imread('C:\Users\utente\Desktop\Unibs\Unibs\Terzo anno\Primo semestre\Sistemi di visione\Foto_Bottoni\Foto_vecchie\allineati_crop.bmp');
im2 = imread('C:\Users\utente\Desktop\Unibs\Unibs\Terzo anno\Primo semestre\Sistemi di visione\Foto_Bottoni\Foto_vecchie\Image__2023-10-26__12-13-20.bmp');
im3= imread('C:\Users\utente\Desktop\Unibs\Unibs\Terzo anno\Primo semestre\Sistemi di visione\Foto_Bottoni\Foto_vecchie\Image__2023-10-26__12-10-39.bmp');
butoni = imread('C:\Users\utente\Desktop\Unibs\Unibs\Terzo anno\Primo semestre\Sistemi di visione\Foto_Bottoni\Foto_vecchie\butoni.bmp');
single_button = imread('C:\Users\utente\Desktop\Unibs\Unibs\Terzo anno\Primo semestre\Sistemi di visione\Foto_Bottoni\Foto_vecchie\Image__2023-10-26__11-04-57.bmp');
concava = imread('C:\Users\utente\Desktop\Unibs\Unibs\Terzo anno\Primo semestre\Sistemi di visione\Foto_Bottoni\Foto_vecchie\prova_immagine_concava.bmp');
convessa_cut= imread('C:\Users\utente\Desktop\Unibs\Unibs\Terzo anno\Primo semestre\Sistemi di visione\Foto_Bottoni\Foto_vecchie\taglio_foto_convessi.bmp');
crop = imread('C:\Users\utente\Desktop\Unibs\Unibs\Terzo anno\Primo semestre\Sistemi di visione\Foto_Bottoni\Foto_vecchie\allineati_crop.bmp');
taglio_foto_convessi = imread('C:\Users\utente\Desktop\Unibs\Unibs\Terzo anno\Primo semestre\Sistemi di visione\Foto_Bottoni\Foto_vecchie\taglio_foto_convessi.bmp');
taglio_foto_convessi_senza_bordi = imread('C:\Users\utente\Desktop\Unibs\Unibs\Terzo anno\Primo semestre\Sistemi di visione\Foto_Bottoni\Foto_vecchie\taglio_foto_convessi_senza_bordi.bmp');
%[max_intensity, min_intensity, mean_intensity, standard_deviation, num_dots,dots_size, white_space] = image_analysis(image_button_allineated,300,true);


%% New images

image1 = imread('C:\Users\utente\Desktop\Unibs\Unibs\Terzo anno\Primo semestre\Sistemi di visione\Foto_Bottoni\Foto_nuove\Bottoni_1.bmp'); %Out of margin
image2 = imread('C:\Users\utente\Desktop\Unibs\Unibs\Terzo anno\Primo semestre\Sistemi di visione\Foto_Bottoni\Foto_nuove\Bottoni_2.bmp'); %Ok
image3 = imread('C:\Users\utente\Desktop\Unibs\Unibs\Terzo anno\Primo semestre\Sistemi di visione\Foto_Bottoni\Foto_nuove\Bottoni_3.bmp'); %OK with circularity<1.1
image4 = imread('C:\Users\utente\Desktop\Unibs\Unibs\Terzo anno\Primo semestre\Sistemi di visione\Foto_Bottoni\Foto_nuove\Bottoni_4.bmp'); %OK
image5 = imread('C:\Users\utente\Desktop\Unibs\Unibs\Terzo anno\Primo semestre\Sistemi di visione\Foto_Bottoni\Foto_nuove\Bottoni_5.bmp'); %OK
image6 = imread('C:\Users\utente\Desktop\Unibs\Unibs\Terzo anno\Primo semestre\Sistemi di visione\Foto_Bottoni\Foto_nuove\Bottoni_6.bmp'); %OK with circularity holes>0.85
image7 = imread('C:\Users\utente\Desktop\Unibs\Unibs\Terzo anno\Primo semestre\Sistemi di visione\Foto_Bottoni\Foto_nuove\Bottoni_7.bmp'); %OK
image8 = imread('C:\Users\utente\Desktop\Unibs\Unibs\Terzo anno\Primo semestre\Sistemi di visione\Foto_Bottoni\Foto_nuove\Bottoni_8.bmp'); %OK
image9 = imread('C:\Users\utente\Desktop\Unibs\Unibs\Terzo anno\Primo semestre\Sistemi di visione\Foto_Bottoni\Foto_nuove\Foto1.bmp'); %Bad quality
image10 = imread('C:\Users\utente\Desktop\Unibs\Unibs\Terzo anno\Primo semestre\Sistemi di visione\Foto_Bottoni\Foto_nuove\Foto2.bmp'); %Bad holes processing
image11 = imread('C:\Users\utente\Desktop\Unibs\Unibs\Terzo anno\Primo semestre\Sistemi di visione\Foto_bottoni\Foto_nuove\Foto3.bmp'); %OK
image12 = imread('C:\Users\utente\Desktop\Unibs\Unibs\Terzo anno\Primo semestre\Sistemi di visione\foto_bottoni\Foto_nuove\Foto4_attaccati.bmp'); %Not works with two buttons so close
image13 = imread('C:\Users\utente\Desktop\Unibs\Unibs\Terzo anno\Primo semestre\Sistemi di visione\foto_bottoni\Foto_nuove\Foto5.bmp'); %OK
image14 = imread('C:\Users\utente\Desktop\Unibs\Unibs\Terzo anno\Primo semestre\Sistemi di visione\foto_bottoni\Foto_nuove\Foto6.bmp'); %OK

%% Setup image
layers = 2;
image = setup_image(image10);

figure();
imshow(image);

image = auto_crop(image, 100,100,1600,1600,true);
%image = auto_crop(image,200,800,1300,1500,true);

figure();
imshow(image);

%% Segmentation

mask = segmentation(image,layers);

%% Strel creation

%Bigger disturbs
strel_rectangle = strel('rectangle',[5 5]);

%Smaller disturbs
strel_rectangle2 = strel('rectangle',[2 2]);

%% Processing Layers

buttons = [];
for i=1:layers
    buttons = [buttons;processing_objects(mask(:,:,i),i,true)];
    %processing_objects(mask(:,:,i),strel_rectangle,strel_rectangle2,i,true);
end

%% Processing background

buttons = processing_holes(mask,buttons,strel_rectangle,strel_rectangle2,layers);

for j=1:length(buttons)
    buttons(j)
end


%% Classification types
