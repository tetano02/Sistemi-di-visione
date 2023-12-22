function [new_image] = areaopen(image)
    new_image = bwareaopen(image, 10000);
end