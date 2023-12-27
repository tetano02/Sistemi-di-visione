function [buttons_modified,bounded_boxes_holes] = processing_holes(mask,buttons,layers, new_origin)

    image_mask = imbinarize(im2uint8(mask(:,:,layers+1)));

    image_mask = erosion(image_mask);
    image_mask = areaopen(image_mask,false);
    
    bounded_boxes_holes = [];
    for i=1:length(buttons)
        width = buttons(i).p3(1)-buttons(i).p1(1);
        height = buttons(i).p2(2)-buttons(i).p1(2);
        image_mask_cut = auto_crop(image_mask,buttons(i).p1(2),buttons(i).p1(1),width,height,false);
        
        blobs = regionprops("table",image_mask_cut,"Circularity","Area","BoundingBox");
        % Removes 0 area blobs
        blobs = blobs(blobs.Area ~= 0, :);
        % Saves only the blobs with circularity over 0.9
        blobs = blobs(blobs.Circularity>0.85, :); %Circularity smaller than the buttons. We can do it because the holes are less accurate but more isolated (with autocrop on the button)
        blobs = blobs(blobs.Circularity<1.1, :); % Small circle disturbs have often some strange and high values
    
        bb = table2array(blobs(:,"BoundingBox"));
        bb = bb + [new_origin,0,0];
        bounded_boxes_holes = [bounded_boxes_holes;bb];

        dim = size(bb);
        buttons(i).number_holes = dim(1);
        
        for k=1:buttons(i).number_holes
            buttons(i).holes = [buttons(i).holes;Hole];
            %Point 1 high left
            buttons(i).holes(k).p1=[bb(k,1) bb(k,2)];
            %Point 2 down left
            buttons(i).holes(k).p2=[bb(k,1) bb(k,2)+bb(k,4)];
            %Point 3 high right
            buttons(i).holes(k).p3=[bb(k,1)+bb(k,3) bb(k,2)];
            buttons(i).holes(k).bb = bb(k,:);
%             buttons(i).holes(k).col = bb(k,1);
%             buttons(i).holes(k).row = bb(k,2);
%             buttons(i).holes(k).width = bb(k,3);
%             buttons(i).holes(k).height = bb(k,4);
        end
%         Ishape = insertShape(im2uint8(image_mask_cut),'rectangle',bb,'LineWidth',4);
%         figure()
%         imshow(Ishape)
    end

    buttons_modified = buttons;

end