classdef Button
    %UNTITLED4 Summary of this class goes here
    %   Detailed explanation goes here

    properties
        color
        %Pixel measurements after processing
%         row
%         col
%         %Useful only to find the coordinates
%         height
%         width
        %Pixel measurements with calibration, every point has x y
        p1
        p2
        p3
        %Millimeter measurements of points
        m1
        m2
        m3
        %Diameter
        button_diameter
        hole_diameter
        %Holes
        number_holes
        holes Hole
        type
        bb
    end

    %% FAI COSE METODI
    methods

        %Adds a hole
        function add_hole()
            obj.holes = [obj.holes;Hole];
        end
        
        %Gets a hole
        function hole = get_hole(index)
            hole = obj.holes(index);
        end
    end
end