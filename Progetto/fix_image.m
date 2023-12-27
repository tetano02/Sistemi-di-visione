function [new_image] = fix_image(image)
   image(1944,2592) = 0;
   new_image = image;
end