function [stretched_image] = stretching(image)
 min_value = min(min(image));
 max_value = max(max(image));
 dim = size(image);
 
 for i=1:dim(1)
    for j=1:dim(2)
        stretched_image(i,j) = ((image(i,j)-min_value)/(max_value-min_value))*255;
    end
 end
end