classdef Hole
    %UNTITLED2 Summary of this class goes here
    %   Detailed explanation goes here

    properties
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
        diameter
    end

    methods
        function obj = untitled2(inputArg1,inputArg2)
            %UNTITLED2 Construct an instance of this class
            %   Detailed explanation goes here
            obj.Property1 = inputArg1 + inputArg2;
        end

        function outputArg = method1(obj,inputArg)
            %METHOD1 Summary of this method goes here
            %   Detailed explanation goes here
            outputArg = obj.Property1 + inputArg;
        end
    end
end