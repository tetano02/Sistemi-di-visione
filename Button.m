classdef Button
    %UNTITLED4 Summary of this class goes here
    %   Detailed explanation goes here

    properties
        color
        row
        col
        %Useful only to find the coordinates
        height
        width
        number_holes
        holes Hole
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