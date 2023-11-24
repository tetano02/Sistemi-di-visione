function [buttons] = processing_objects(mask,strel1,strel2,color,print)
    %Imbinarize, needed for using bwconvhull
    image_mask = imbinarize(im2uint8(mask));
    %First erosion
    image_mask = imerode(image_mask,strel1);
    image_mask = imerode(image_mask,strel2);
    %Fill buttons
    image_mask = bwconvhull(im2uint8(image_mask),'objects');
    %Erosion after bwconvull, there might be some imperfections
    image_mask = imerode(image_mask,strel1);
    image_mask = imerode(image_mask,strel2);
    
    blobs = regionprops("table",image_mask,"BoundingBox");
    bb = table2array(blobs(:,"BoundingBox"));

    dim = size(bb);

    num_bottoni = dim(1);

    buttons = [];
    for i=1:num_bottoni
        buttons = [buttons;Button];
        buttons(i).color = color;
        buttons(i).col = bb(i,1);
        buttons(i).row = bb(i,2);
        buttons(i).width = bb(i,3);
        buttons(i).height = bb(i,4);
    end
    %If print is true, the image with bounded boxes will be showed
    if(print)
        Ishape = insertShape(im2uint8(image_mask),'rectangle',bb,'LineWidth',4);
        figure()
        imshow(Ishape)
    end
end