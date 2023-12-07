function [cropped_image] = auto_crop(image,row,col,w,h,isWhite)
    dim = size(image);
    num_rows = dim(1);
    num_columns = dim(2);
    cropped_image = image;
    for i=1:num_rows
        for j=1:num_columns
            if not((col<j && j<(col+w)) && (row<i && i<(row+h)))
                if(isWhite)
                    cropped_image(i,j) = 255;
                else
                    cropped_image(i,j) = 0;
                end
            end
        end
    end
end