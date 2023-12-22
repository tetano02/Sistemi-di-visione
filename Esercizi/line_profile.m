function [line_p] = line_profile(image, point, isHorizontal)
    %UNTITLED Summary of this function goes here
    %   Detailed explanation goes here
    %image_gray = imbinarize(im2gray(image),0.9); % from RGB to grey and binarize
    image_gray = im2gray(image);
    siz = size(image_gray);
    image_gray2=image_gray;
    siz = size(image_gray2);
    col = siz(2);
    rig = siz(1);
    if(isHorizontal)
        for j=1:col
            image_gray2(point,j) = 0;
        end
    else
        for j=1:rig
            image_gray2(j,point) = 0;
        end
    end
    figure();
    imshow(image_gray) %plot dell'immagine, inverte x e y, quindi 255 in basso e 0 in alto 
    hold on 
    if(isHorizontal)
        if(abs(point)<siz(1)) %Controllo se possibile
            plot(image_gray(point,:)) % mi muovo sull'orizzontale, fisso la riga e mi muovo sulle colonne
            line_p = image_gray(point,:); 
        end
    else
        if(abs(point)<siz(2))
            plot(image_gray(:,point)) % mi muovo sulla verticale, fisso la colonna e mi muovo sulle righe
            line_p = image_gray(:,point);
        end
    end
    title('Line Profile');
    xlabel('Pixels');
    ylabel('Light Intensity');
    axis([0 Inf 0 255]);
end