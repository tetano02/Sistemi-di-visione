function [max_intensity, min_intensity, mean_intensity, standard_deviation, num_dots,dots_size, white_space] = image_analysis(image,point,isHorizontal)
    intensity_measurements(image)
    [max_intensity, min_intensity, mean_intensity, standard_deviation] = intensity_measurements(image);
    lp = line_profile(image,point,isHorizontal);
    [num_dots,dots_size, white_space] = line_analysis(lp);
    all_histogram(image);
end