img = imread("panorama.png");
%mat = load('key_new.mat');

%disp(mat);

%disp(mat.points);
%imshow(img);
%hold on;
%plot(mat.points(:,1), mat.points(:,2), "g+");

% img = imadjust(img,[0 1],[0.32 0.78]);
% 
% figure;
% imhist(img);
% 
img = imadjust(img,[0 1],[0.32 0.68]);

%figure;
%imshow(img);

% 
 ebb_corners_output = detectEBBHarrisFeatures(rgb2gray(img));
 harris_output = detectSURFFeatures(rgb2gray(img));
% 
 imshow(img);
 hold on;
% 
 plot( ebb_corners_output.Location(:,1), ebb_corners_output.Location(:,2),"g+");

%disp(size(img));




axis on;
[rows, columns, numberOfColorChannels] = size(img);
hold on;
for row = 1 : 46.8 : rows
  line([1, columns], [row, row], 'Color', 'k');
end
for col = 1 : 138.9000 : columns
  line([col, col], [1, rows], 'Color', 'k');
end

