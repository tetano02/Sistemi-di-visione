function [] = all_histogram(image)
    imgray = im2gray(image);
    [y,x ] = imhist(imgray(:,:,1));
    figure()
    plot(x,y,'r')
    title('Histogram');
    xlabel('Light Intensity');
    ylabel('Number of bins');
    axis([0 255 0 Inf]);
end