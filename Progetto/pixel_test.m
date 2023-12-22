function [buttons] = pixel_test(buttons)
    for i=1:length(buttons)
        d1= (((buttons(i).p1(1) - buttons(i).p2(1))^2 + (buttons(i).p1(2) - buttons(i).p2(2))^2)^0.5) * 0.05;
        d2= (((buttons(i).p1(1) - buttons(i).p3(1))^2 + (buttons(i).p1(2) - buttons(i).p3(2))^2)^0.5) * 0.05;
        diam = (d1+d2)/2
    end
end