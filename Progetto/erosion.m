function [new_image] = erosion(image)
    %Bigger disturbs
    strel_rectangle5 = strel('rectangle',[5 5]);
    
    %Smaller disturbs
    strel_rectangle2 = strel('rectangle',[2 2]);
    strel_rectangle1 = strel('rectangle',[1 1]);

    image = imerode(image,strel_rectangle5);
    image = imerode(image,strel_rectangle2);
    image = imerode(image,strel_rectangle1);

    new_image = image;
end