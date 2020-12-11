function Harris_matches = getHarrisMatches(img, img2)

Harris_points = detectHarrisFeatures(img);
Harris_points2 = detectHarrisFeatures(img2);

[f1,vpts1] = extractFeatures(img,Harris_points);
[f2,vpts2] = extractFeatures(img2,Harris_points2);

indexPairs = matchFeatures(f1,f2) ;
matchedPoints1 = vpts1(indexPairs(:,1));
matchedPoints2 = vpts2(indexPairs(:,2));

Harris_matches.stitched = matchedPoints1.Location; 
Harris_matches.n = matchedPoints2.Location; 


