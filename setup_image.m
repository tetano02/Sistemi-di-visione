function [new_image] = setup_image(image)
    % Changes the image into a black and white image
    gray_image = im2gray(image);
    %Brightens the image
    new_image = imlocalbrighten(gray_image);
end