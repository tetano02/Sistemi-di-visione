function [max_intensity, min_intensity, mean_intensity, standard_deviation] = intensity_measurements(image)
    canali = num_canali(image);
    min_intensity = [];
    max_intensity = [];
    mean_intensity = [];
    standard_deviation = [];
    for i = 1:canali % Errore con -1 gestito, salta il for
        min_intensity = [min_intensity,min(min(image(:,:,i)))]; 
        max_intensity = [max_intensity,max(max(image(:,:,i)))];
        mean_intensity = [mean_intensity, mean(mean(image(:,:,i)))];
        standard_deviation = [standard_deviation,std(std(double(image(:,:,i))))];
    end
end