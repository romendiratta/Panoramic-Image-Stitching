function EBB_matches = getEBBHarrisMatches(img, img2)

ebb_corners_output = detectEBBHarrisFeatures(img);
ebb_corners_output2 = detectEBBHarrisFeatures(img2);

ebb_corners = cornerPoints(ebb_corners_output.Location,'Metric',ebb_corners_output.Metric);
ebb_corners2 = cornerPoints(ebb_corners_output2.Location,'Metric',ebb_corners_output2.Metric);

[features1,valid_points1] = extractFeatures(img,ebb_corners);
[features2,valid_points2] = extractFeatures(img2,ebb_corners2);

indexPairs = matchFeatures(features1,features2);

matchedPoints1 = valid_points1(indexPairs(:,1),:);
matchedPoints2 = valid_points2(indexPairs(:,2),:);

EBB_matches.stitched = matchedPoints1.Location;
EBB_matches.n = matchedPoints2.Location;
