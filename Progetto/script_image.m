%%

clear all;
close all;

%Loads data for calibration
load('BaslerOttica12.mat');
load("BaslerOttica12.mat");

%% Old images

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
 
image15 = imread('C:\Users\utente\Desktop\Unibs\Unibs\Terzo anno\Primo semestre\Sistemi di visione\foto_bottoni\Foto_nuove\Foto_per_incertezza\img_1.bmp'); %OK
image16 = imread('C:\Users\utente\Desktop\Unibs\Unibs\Terzo anno\Primo semestre\Sistemi di visione\foto_bottoni\Foto_nuove\Foto_per_incertezza\img_2.bmp'); %OK
image17 = imread('C:\Users\utente\Desktop\Unibs\Unibs\Terzo anno\Primo semestre\Sistemi di visione\foto_bottoni\Foto_nuove\Foto_per_incertezza\img_3.bmp'); %OK
image18 = imread('C:\Users\utente\Desktop\Unibs\Unibs\Terzo anno\Primo semestre\Sistemi di visione\foto_bottoni\Foto_nuove\Foto_per_incertezza\img_4.bmp'); %OK
image19 = imread('C:\Users\utente\Desktop\Unibs\Unibs\Terzo anno\Primo semestre\Sistemi di visione\foto_bottoni\Foto_nuove\Foto_per_incertezza\img_5.bmp'); %OK
image20 = imread('C:\Users\utente\Desktop\Unibs\Unibs\Terzo anno\Primo semestre\Sistemi di visione\foto_bottoni\Foto_nuove\Foto_per_incertezza\img_6.bmp'); %OK
image21 = imread('C:\Users\utente\Desktop\Unibs\Unibs\Terzo anno\Primo semestre\Sistemi di visione\foto_bottoni\Foto_nuove\Foto_per_incertezza\img_7.bmp'); %OK
image22 = imread('C:\Users\utente\Desktop\Unibs\Unibs\Terzo anno\Primo semestre\Sistemi di visione\foto_bottoni\Foto_nuove\Foto_per_incertezza\img_8.bmp'); %OK
image23 = imread('C:\Users\utente\Desktop\Unibs\Unibs\Terzo anno\Primo semestre\Sistemi di visione\foto_bottoni\foto_nuove\Foto_per_incertezza\img_9.bmp'); %OK
image24 = imread('C:\Users\utente\Desktop\Unibs\Unibs\Terzo anno\Primo semestre\Sistemi di visione\foto_bottoni\foto_nuove\Foto_per_incertezza\img_10.bmp'); %OK
image25 = imread('C:\Users\utente\Desktop\Unibs\Unibs\Terzo anno\Primo semestre\Sistemi di visione\foto_bottoni\foto_nuove\Foto_per_incertezza\img_11.bmp');
image26 = imread('C:\Users\utente\Desktop\Unibs\Unibs\Terzo anno\Primo semestre\Sistemi di visione\foto_bottoni\foto_nuove\Foto_per_incertezza\img_12.bmp');
image27 = imread('C:\Users\utente\Desktop\Unibs\Unibs\Terzo anno\Primo semestre\Sistemi di visione\foto_bottoni\foto_nuove\Foto_per_incertezza\img_13.bmp'); %NO, no holes
image28 = imread('C:\Users\utente\Desktop\Unibs\Unibs\Terzo anno\Primo semestre\Sistemi di visione\foto_bottoni\foto_nuove\Foto_per_incertezza\img_14.bmp'); %NO, no holes
image29 = imread('C:\Users\utente\Desktop\Unibs\Unibs\Terzo anno\Primo semestre\Sistemi di visione\foto_bottoni\foto_nuove\Foto_per_incertezza\img_15.bmp'); %NO, no holes
image30 = imread('C:\Users\utente\Desktop\Unibs\Unibs\Terzo anno\Primo semestre\Sistemi di visione\foto_bottoni\foto_nuove\Foto_per_incertezza\img_16.bmp'); %NO, no holes
image31 = imread('C:\Users\utente\Desktop\Unibs\Unibs\Terzo anno\Primo semestre\Sistemi di visione\foto_bottoni\foto_nuove\Foto_per_incertezza\img_17.bmp'); %SNI
image32 = imread('C:\Users\utente\Desktop\Unibs\Unibs\Terzo anno\Primo semestre\Sistemi di visione\foto_bottoni\foto_nuove\Foto_per_incertezza\img_18.bmp'); 
image33 = imread('C:\Users\utente\Desktop\Unibs\Unibs\Terzo anno\Primo semestre\Sistemi di visione\foto_bottoni\foto_nuove\Foto_per_incertezza\img_19.bmp');
image34 = imread('C:\Users\utente\Desktop\Unibs\Unibs\Terzo anno\Primo semestre\Sistemi di visione\foto_bottoni\foto_nuove\Foto_per_incertezza\img_20.bmp'); %SNI
image35 = imread('C:\Users\utente\Desktop\Unibs\Unibs\Terzo anno\Primo semestre\Sistemi di visione\foto_bottoni\foto_nuove\Foto_per_incertezza\img_21.bmp');
image36 = imread('C:\Users\utente\Desktop\Unibs\Unibs\Terzo anno\Primo semestre\Sistemi di visione\foto_bottoni\foto_nuove\Foto_per_incertezza\img_22.bmp');
image37 = imread('C:\Users\utente\Desktop\Unibs\Unibs\Terzo anno\Primo semestre\Sistemi di visione\foto_bottoni\foto_nuove\Foto_per_incertezza\img_23.bmp');
image38 = imread('C:\Users\utente\Desktop\Unibs\Unibs\Terzo anno\Primo semestre\Sistemi di visione\foto_bottoni\foto_nuove\Foto_per_incertezza\img_24.bmp');
image39 = imread('C:\Users\utente\Desktop\Unibs\Unibs\Terzo anno\Primo semestre\Sistemi di visione\foto_bottoni\foto_nuove\Foto_per_incertezza\img_25.bmp');
%% More color buttons
pink_image = imread('C:\Users\utente\Desktop\Unibs\Unibs\Terzo anno\Primo semestre\Sistemi di visione\Foto_Bottoni\Foto_nuove\Bottone_rosa.bmp');
pink_red_image = imread('C:\Users\utente\Desktop\Unibs\Unibs\Terzo anno\Primo semestre\Sistemi di visione\foto_bottoni\Foto_nuove\Bottone_rosa_rosso.bmp');
blue_image = imread('C:\Users\utente\Desktop\Unibs\Unibs\Terzo anno\Primo semestre\Sistemi di visione\foto_bottoni\Foto_nuove\Bottone_blu.bmp');
blue2 = imread('C:\Users\utente\Desktop\Unibs\Unibs\Terzo anno\Primo semestre\Sistemi di visione\foto_bottoni\Foto_nuove\blu_2.bmp');
red_image = imread('C:\Users\utente\Desktop\Unibs\Unibs\Terzo anno\Primo semestre\Sistemi di visione\foto_bottoni\Foto_nuove\Bottone_rosso.bmp');
amarillo_image = imread('C:\Users\utente\Desktop\Unibs\Unibs\Terzo anno\Primo semestre\Sistemi di visione\foto_bottoni\Foto_nuove\Bottone_amarillo.bmp');

%% Setup image
layers = 2;
original_image = image39;
s = size(original_image);
if(s(1)<1944)
    original_image = fix_image(original_image);
end

%Remove for aesthetical image with bounding boxes
% calibrazione 25 quella piu' piccola di tutte
[image,~]=undistortImage(original_image,BaslerOttica12,OutputView="full");
image = setup_image(image);

% figure();
% imshow(image);

image = auto_crop(image, 100,100,1600,1600,true);
%image = auto_crop(image,200,800,1300,1500,true);

% figure();
% imshow(image);

%% Segmentation

mask = segmentation(image,layers);
%% immagine di zero - calibrazione marker piccolo (25%)

checker_image = imread('C:\Users\utente\Desktop\Unibs\Unibs\Terzo anno\Primo semestre\Sistemi di visione\Foto_Bottoni\Calibrazione\Cal2_1.bmp');
[checker_image,new_origin]=undistortImage(checker_image,BaslerOttica12,OutputView="full");

%% Processing Layers

buttons = [];
bounded_boxes_buttons = [];

for i=1:layers
    [actual_buttons_layer,bb] = processing_objects(mask(:,:,i),i,true,new_origin);
    bounded_boxes_buttons = [bounded_boxes_buttons;bb];
    if(not(isempty(actual_buttons_layer)))
        buttons = [buttons;actual_buttons_layer];
    end
    %processing_objects(mask(:,:,i),strel_rectangle,strel_rectangle2,i,true);
end

% Ishape = insertShape(im2uint8(image),'rectangle',bounded_boxes,'LineWidth',4,Color='r');
% figure()
% imshow(Ishape)

%% Processing background

[buttons,bounded_boxes_holes] = processing_holes(mask,buttons,layers,new_origin);

%% Calibration
[image_points, board_size] = detectCheckerboardPoints(checker_image);
image_points = image_points + new_origin;
% world points devono essere gli stessi dello zero usato nell'immagine
% checker image
extrinsics = estimateExtrinsics(image_points,BaslerOttica12.WorldPoints, BaslerOttica12.Intrinsics);

for i=1:length(buttons)
    %Buttons coordinates
    buttons(i).m1 = img2world2d(buttons(i).p1,extrinsics,BaslerOttica12.Intrinsics);
    buttons(i).m2 = img2world2d(buttons(i).p2,extrinsics,BaslerOttica12.Intrinsics);
    buttons(i).m3 = img2world2d(buttons(i).p3,extrinsics,BaslerOttica12.Intrinsics);

    for j=1:length(buttons(i).holes)
        buttons(i).holes(j).m1 = img2world2d(buttons(i).holes(j).p1,extrinsics,BaslerOttica12.Intrinsics);
        buttons(i).holes(j).m2 = img2world2d(buttons(i).holes(j).p2,extrinsics,BaslerOttica12.Intrinsics);
        buttons(i).holes(j).m3 = img2world2d(buttons(i).holes(j).p3,extrinsics,BaslerOttica12.Intrinsics);
    end
end

%% Diameter calculus

for i=1:length(buttons)
    %Buttons coordinates
    for j=1:length(buttons(i).holes)
        buttons(i).holes(j) = diameter_calculus_holes(buttons(i).holes(j));
    end
    buttons(i) = diameter_calculus_buttons(buttons(i));
end


buttons = pixel_test(buttons);

%% Classification types

types = [];
for i=1:length(buttons)
    type_exist = false;
    for j=1:length(types)
        diff_buttons = abs(types(j).average_button_diameter-buttons(i).button_diameter);
        delta_buttons = 0.05*types(j).average_button_diameter;
        if(types(j).color == buttons(i).color && types(j).number_holes == buttons(i).number_holes && diff_buttons<delta_buttons )
            type_exist = true;
            buttons(i).type = j;
            types(j).average_button_diameter = ((types(j).average_button_diameter * types(j).number_buttons)+buttons(i).button_diameter)/(types(j).number_buttons+1);
            types(j).average_hole_diameter = ((types(j).average_hole_diameter * types(j).number_buttons)+buttons(i).hole_diameter)/(types(j).number_buttons+1);
            types(j).number_buttons = types(j).number_buttons + 1;
        end
    end
    
    if(~type_exist)
        types = [types;Type];
        types(length(types)).color = buttons(i).color;
        types(length(types)).average_button_diameter = buttons(i).button_diameter;
        types(length(types)).average_hole_diameter = buttons(i).hole_diameter;
        types(length(types)).number_holes = buttons(i).number_holes;
        types(length(types)).number_buttons = 1;
        buttons(i).type = length(types);
    end
end

%%
original_image = plotter_function(original_image,buttons);
%%

DB1 = 11.41;
DH1 = 1.76;
DB2 = 14.85;
DH2 = 2.16;
DB3 = 17.46;
DH3 = 2.20;

D=[11.45,1.74,14.85,2.16,17.58,2.2];
deltas = [];
k = 1;
for i=1:length(types)
    deltas = [deltas;(abs(D(k)-types(i).average_button_diameter)/D(k))*100];
    deltas = [deltas;(abs(D(k+1)-types(i).average_hole_diameter)/D(k+1))*100];
    k= k + 2;
end
