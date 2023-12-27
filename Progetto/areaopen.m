function [new_image] = areaopen(image,isbutton)
    if(isbutton)
        new_image = bwareaopen(image, 10000);
    else
        new_image = bwareaopen(image, 500);
    end
end