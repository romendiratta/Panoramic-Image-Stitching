img = imread("panorama.png");
disp(size(img));

 img1_horizontal = 1:488;
 img2_horizontal = 438:951;
 img3_horizontal = 901:1389;
% img1_horizontal = 1:493;
% img2_horizontal = 433:956;
% img3_horizontal = 888:1389;


img1 = img(:,img1_horizontal,:);
img2 = img(:,img2_horizontal,:);
img3 = img(:,img3_horizontal,:);

% img1 = imadjust(img1,[0 1],[0.23 0.67]);
% img2 = imadjust(img2,[0 1],[0.23 0.67]);
% img3 = imadjust(img3,[0 1],[0.23 0.67]);
img1 = imadjust(img1,[0 1],[0.49 0.51]);
img2 = imadjust(img2,[0 1],[0.49 0.51]);
img3 = imadjust(img3,[0 1],[0.49 0.51]);


% img1 = imadjust(img1,[0 1],[0.45 0.55]);
% img2 = imadjust(img2,[0 1],[0.45 0.55]);
% img3 = imadjust(img3,[0 1],[0.45 0.55]);

imwrite(img1, 'city_left.png');
imwrite(img2, 'city_center.png');
imwrite(img3, 'city_right.png');