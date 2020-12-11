function Key_matches = getKeyMatches()

img_center = imread('key_city_center.png');
img_left = imread('key_city_left.png');
center_mat = load('key_center.mat');
left_mat = load('key_left.mat');

left_points.Temp = [left_mat.points(:,1), left_mat.points(:,2)];
left_points.Location = left_points.Temp((left_mat.points(:,1) > 0 & left_mat.points(:,2) > 0),:);
left_points.Metric = left_mat.points((left_mat.points(:,1) > 0 & left_mat.points(:,2) > 0),4);

center_points.Temp = [center_mat.points(:,1), center_mat.points(:,2)];
center_points.Location = center_points.Temp((center_mat.points(:,1) > 0 & center_mat.points(:,2) > 0),:);
center_points.Metric = center_mat.points((center_mat.points(:,1) > 0 & center_mat.points(:,2) > 0),4);

key_corners = cornerPoints(center_points.Location,'Metric',center_points.Metric);
key_corners2 = cornerPoints(left_points.Location,'Metric',left_points.Metric);

[features1,valid_points1] = extractFeatures(rgb2gray(img_center),key_corners);
[features2,valid_points2] = extractFeatures(rgb2gray(img_left),key_corners2);

indexPairs = matchFeatures(features1,features2);

matchedPoints1 = valid_points1(indexPairs(:,1),:);
matchedPoints2 = valid_points2(indexPairs(:,2),:);

% figure;
% imshow(img_center);
% hold on;
% %plot(center_mat.points(:,1), center_mat.points(:,2), "g+");
% plot(matchedPoints1.Location(:,1), matchedPoints1.Location(:,2), "g+");


%disp(matchedPoints1.Location);

Key_matches.stitched = matchedPoints1.Location;
Key_matches.n = matchedPoints2.Location;

disp(matchedPoints2.Location);

% center_points.Metric = center_points.Metric(center_points.Metric > 0);
% left_points.Metric = left_points.Metric(left_points.Metric > 0);

% key_corners2 = cornerPoints(left_points.Location,'Metric',left_points.Metric);

% [features1,valid_points1] = extractFeatures(img,key_corners);
% [features2,valid_points2] = extractFeatures(img2,key_corners2);
% 
% indexPairs = matchFeatures(features1,features2);
% 
% matchedPoints1 = valid_points1(indexPairs(:,1),:);
% matchedPoints2 = valid_points2(indexPairs(:,2),:);

% figure;
% imshow(img);
% hold on;
% plot(left.points(:,1),left.points(:,2),"g+");
