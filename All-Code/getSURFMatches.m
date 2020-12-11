function SURF_matches = getSURFMatches(img, img2)

SURF_points = detectSURFFeatures(img);
SURF_points2 = detectSURFFeatures(img2);

[f1,vpts1] = extractFeatures(img,SURF_points);
[f2,vpts2] = extractFeatures(img2,SURF_points2);

indexPairs = matchFeatures(f1,f2) ;
matchedPoints1 = vpts1(indexPairs(:,1));
matchedPoints2 = vpts2(indexPairs(:,2));

SURF_matches.stitched = matchedPoints1.Location; 
SURF_matches.n = matchedPoints2.Location; 


