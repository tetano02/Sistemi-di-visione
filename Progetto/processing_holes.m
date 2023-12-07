function [buttons_modified] = processing_holes(mask,buttons,strel1,strel2,layers)

    image_mask = imbinarize(im2uint8(mask(:,:,layers+1)));

    %Erosion after imlocalbrighten
    image_mask = imerode(image_mask,strel1);
    image_mask = imerode(image_mask,strel2);

    for i=1:length(buttons)
        image_mask_cut = auto_crop(image_mask,buttons(i).row,buttons(i).col,buttons(i).width,buttons(i).height,false);
        
        blobs = regionprops("table",image_mask_cut,"Circularity","Area","BoundingBox");
        % Removes 0 area blobs
        blobs = blobs(blobs.Area ~= 0, :);
        % Saves only the blobs with circularity over 0.9
        blobs = blobs(blobs.Circularity>0.85, :); %Circularity smaller than the buttons. We can do it because the holes are less accurate but more isolated (with autocrop on the button)
        blobs = blobs(blobs.Circularity<1.1, :); % Small circle disturbs have often some strange and high values
    
        bb2 = table2array(blobs(:,"Circularity"));
        bb3 = table2array(blobs(:,"BoundingBox"));
        
        dim = size(bb3);
        buttons(i).number_holes = dim(1);
        
        for k=1:buttons(i).number_holes
            buttons(i).holes = [buttons(i).holes;Hole];
            buttons(i).holes(k).col = bb3(k,1);
            buttons(i).holes(k).row = bb3(k,2);
            buttons(i).holes(k).width = bb3(k,3);
            buttons(i).holes(k).height = bb3(k,4);
        end
        Ishape = insertShape(im2uint8(image_mask_cut),'rectangle',bb3,'LineWidth',4);
        figure()
        imshow(Ishape)
    end

    buttons_modified = buttons;

end