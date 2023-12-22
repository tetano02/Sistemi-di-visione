function [button] = diameter_calculus_buttons(button)
    %button is a button or a hole
   d1= ((button.m1(1) - button.m2(1))^2 + (button.m1(2) - button.m2(2))^2)^0.5;
   d2= ((button.m1(1) - button.m3(1))^2 + (button.m1(2) - button.m3(2))^2)^0.5;
   button.button_diameter = (d1+d2)/2;
   sum = 0;
   for j=1:length(button.holes)
        sum = sum + button.holes(j).diameter;
   end
   button.hole_diameter = sum/length(button.holes);
end