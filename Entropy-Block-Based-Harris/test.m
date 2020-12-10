img = imread('cornfield.png');

cutout = img(50:250,50:250,:);

img(100:200,100:200,:) = 0;

imshow(img);

imshow(cutout);