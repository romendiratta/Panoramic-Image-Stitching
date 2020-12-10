Andrew Degler - HW3

stitchImg.m

Steps:

1. Generate sift matches between the stitched image and the current image. (Line 58)
2. Get the homography matrix between the current image and the stitched image by using the RANSAC algorithm. (Line 61)
3. Warp the current image to fit the stitched image by backward warping. Pass the inverse homography matrix found in step 2. Save the mask and the newly warped current image. (Line 64-65)
4. Generate a new mask for the stitched image because the stitched image changes size after the first iteration. (Line 67)
5. The blend function will return NAN values where there are 0s after the first iteration. To undo this, I covert all locations where there are NAN values into 0s. This will ensure the blend function can work correctly. (Line 69-79)
6. 

challenge1e()

I had to covert the images to .png from .HEIC in order to get Matlab to take the images. Then I had to resize them in order to reduce the runtime to an acceptable level. 

The panorama is saved as street_panorama.png. The source images are left.png, center.png, and right.png. 