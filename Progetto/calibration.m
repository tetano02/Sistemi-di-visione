function [outputArg1,outputArg2] = calibration(image, checker_image, new_origin;BaslerOttica12,)
    %UNTITLED Summary of this function goes here
    %   Detailed explanation goes here
    [checker_image,no]=undistortImage(checker_image,BaslerOttica12,OutputView="full");
    [image_points, board_size] = detectCheckerboardPoints(checker_image);
    image_points = image_points + new_origin;
    extrinsics = estimateExtrinsics(image_points,BaslerOttica12.WorldPoints, BaslerOttica12.Intrinsics);
    box1_mm = img2world2d(box1,extrinsics,BaslerOttica12.Intrinsics);
    box2_mm = img2world2d(box2,extrinsics,BaslerOttica12.Intrinsics);
end