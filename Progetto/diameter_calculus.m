function [element] = diameter_calculus_buttons(element)
    %Element is a button or a hole
   d1= ((element.m1(1) - element.m2(1))^2 + (element.m1(2) - element.m2(2))^2)^0.5;
   d2= ((element.m1(1) - element.m3(1))^2 + (element.m1(2) - element.m3(2))^2)^0.5;
   element.diameter = (d1+d2)/2;
end