function filtered = demosaicBilinear(img)

% demosaicBilinear demosaics a Bayer filtered image
%
% Input:
% img - NxMx3 matrix of uint8 with Bayer filtered image
%
% Output:
% filtered - NxMx3 matrix of uint8 with interpolated image that fills in
%           missing pixel values


% Uncomment the next 5 lines
img = im2double(img);
red = img(:,:,1);
green = img(:,:,2);
blue = img(:,:,3);
[x y z] = size(img)


%impulse responses
g = [0 .25 0; .25 1 .25; 0 .25 0]
b = [.25 1 .25; 1 1 1; .25 1 .25]
r = [.25 .5 .25; .5 1 .5; .25 .5 .25]

% Fill in the red
red = conv2(red,r)
 

% Fill in the blues
blue = conv2(blue,b)

% Fill in the greens
green = conv2(green,g)


filtered(:,:,1)= red;
filtered(:,:,2) = green;
filtered(:,:,3)=blue;
filtered;