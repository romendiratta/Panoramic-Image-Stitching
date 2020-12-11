function run_program(varargin)
% Settings to make sure images are displayed without borders
orig_imsetting = iptgetpref('ImshowBorder');
iptsetpref('ImshowBorder', 'tight');
temp1 = onCleanup(@()iptsetpref('ImshowBorder', orig_imsetting));

fun_handles = {
   @stitch};

% Call test harness
runTests(varargin, fun_handles);

%%
function stitch()
% Test image stitching

imgc = im2single(imread('city_center.png'));
imgl = im2single(imread('city_left.png'));
imgr = im2single(imread('city_right.png'));

% You are free to change the order of input arguments
stitched_img = stitchImg(imgl, imgc, imgr);

%figure, imshow(stitched_img);
imwrite(stitched_img, 'city_panorama.png');

%%