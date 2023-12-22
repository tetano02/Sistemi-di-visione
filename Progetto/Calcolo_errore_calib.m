
%clear all;


i=imread("C:\Users\anton\Desktop\provacalib.bmp");

[und_i,new_origin]=undistortImage(i,BaslerOttica12,OutputView="full");

i=rgb2gray(und_i);
filter = i <= 90;

i_filter = i.* uint8(filter);
i_filter = imbinarize(i_filter);

% figure();
% imshow(i)

mask = zeros(size(i_filter));

mask(400:1450, 550:950)=1;%[Y,X]

i_segm = i_filter .* mask;
i_segm = imbinarize(i_segm);

blob = regionprops("table",i_segm,"BoundingBox");
boundingboxes = table2array(blob(:,"BoundingBox"));
boundingboxes = boundingboxes + [new_origin,0,0];

box1 =  [boundingboxes(1,1) boundingboxes(1,2)];

box2 = [boundingboxes(2,1) boundingboxes(2,2)+boundingboxes(2,4)];

[image_points, board_size] = detectCheckerboardPoints(und_i);
image_points = image_points + new_origin;
extrinsics = estimateExtrinsics(image_points,BaslerOttica12.WorldPoints, BaslerOttica12.Intrinsics);

box1_mm = img2world2d(box1,extrinsics,BaslerOttica12.Intrinsics);
box2_mm = img2world2d(box2,extrinsics,BaslerOttica12.Intrinsics);

P1 = box1_mm(1,:);
P2 = box2_mm(1,:);

dist= ((P1(1) - P2(1))^2 + (P1(2) - P2(2))^2)^0.5;

err_dist= 34 - dist;

Ishape = insertShape(uint8(i_segm), 'rectangle', boundingboxes, 'Linewidth',4);

figure();
%imshow(i_segm)
figure();
imshow(Ishape)