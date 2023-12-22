function [hole] = diameter_calculus_holes(hole)
    %hole is a button or a hole
   d1= ((hole.m1(1) - hole.m2(1))^2 + (hole.m1(2) - hole.m2(2))^2)^0.5;
   d2= ((hole.m1(1) - hole.m3(1))^2 + (hole.m1(2) - hole.m3(2))^2)^0.5;
   hole.diameter = (d1+d2)/2;
end