function [buttons,bb] = processing_objects(mask,color,print,new_origin)
    %Imbinarize, needed for using bwconvhull
    image_mask = imbinarize(im2uint8(mask));
    %First erosion
    %image_mask = erosion(image_mask);
    %Area open
    image_mask = areaopen(image_mask,true);
    %Fill buttons
    image_mask = bwconvhull(im2uint8(image_mask),'objects');
    %Erosion after bwconvull, there might be some imperfections
    %image_mask = erosion(image_mask);
    %Area open
    image_mask = areaopen(image_mask,true);

%     figure()
%     imshow(image_mask)
    
    blobs = regionprops("table",image_mask,"BoundingBox","Circularity");
    blobs = blobs(blobs.Circularity>0.9, :);
    blobs = blobs(blobs.Circularity<1.1, :); % Small circle disturbs have often some strange and high values
 
    bb = table2array(blobs(:,"BoundingBox"));
    %Shift only if it isn't empty, otherwise sum dimension error
    if(not(isempty(bb)))
        bb = bb + [new_origin,0,0];
    end

    dim = size(bb);

    num_bottoni = dim(1);

    buttons = [];
    for i=1:num_bottoni
        buttons = [buttons;Button];
        buttons(i).color = color;
        %Point 1 high left
        buttons(i).p1=[bb(i,1) bb(i,2)];
        %Point 2 down left
        buttons(i).p2=[bb(i,1) bb(i,2)+bb(i,4)];
        %Point 3 high right
        buttons(i).p3=[bb(i,1)+bb(i,3) bb(i,2)];
        buttons(i).bb = bb(i,:);
%         buttons(i).col = bb(i,1);
%         buttons(i).row = bb(i,2);
%         buttons(i).width = bb(i,3);
%         buttons(i).height = bb(i,4);
    end
end