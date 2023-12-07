function [mask] = segmentation(image,channels)

    % It returns channels+1 layers with values between 0 and 255, and
    % distinguishes lighter and darker objects
    thresh = multithresh(image,channels); 
    labels = imquantize(image,thresh);

    mask = (labels == 1);
    for i = 2:(channels+1)
        mask(:,:,i) = (labels==i);
    end

end


%% Remove

    

    %c = label2rgb(labels); Eventually for showing the layers
    
    %Definizione mask
%     mask1 = (labels == 1);
%     mask2 = (labels == 2);
%     mask3 = (labels == 3);
%     
%     %Creazione immagini
%     masked_image1 = bright_image .* uint8(mask1);
%     masked_image2 = bright_image .* uint8(mask2);
%     masked_image3 = bright_image .* uint8(mask3);

%     masked_image = [];
%     for i = 1:(channels+1)
%         masked_image = [masked_image;image .* uint8(mask(i))];
%     end