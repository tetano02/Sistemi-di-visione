function [new_image] = plotter_function(image,buttons)
%     Ishape = insertShape(image,'rectangle',bb_buttons,'LineWidth',5,Color='r');
%     Ishape = insertShape(Ishape,'rectangle',bb_holes,'LineWidth',5,Color='blue');
%     figure()
%     imshow(Ishape)
    %colors = ['r';'g';'b';'c';'m';'y';'k';'w'];
    colors = ['r','g','c','m','y','k','w'];
    new_image = image;
    for i=1:length(buttons)
        color = colors(buttons(i).type);
        new_image = insertShape(new_image,'rectangle',buttons(i).bb,'LineWidth',5,'Color',color);
        for j=1:length(buttons(i).holes)
            new_image = insertShape(new_image,'rectangle',buttons(i).holes(j).bb,'LineWidth',5,'Color',color);
        end
    end
    figure()
    imshow(new_image)
end