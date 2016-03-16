function filtered = demosaicPDI(img)

%% Demosaic by using adjacent, non-overlapping squares of 4 pixels, called
%% Pixel Doubling Interpolation
% Input: 
% img - NxMx3 matrix of uint8 with Bayer filtered image
%
% Output:
% filtered - NxMx3 matrix of uint8 with interpolated image that fills in
%           missing pixel values


[N,M,L]= size(img)

% Fill in the reds
for i= 2:2:N %reds are always in even indexed rows
    for j=[2:2:M] %red is always even index column
        img(i,j,2) = img(i,j-1,2); %takes green from left (same row)
        img(i,j,3) = img(i-1,j-1,3); %takes blue from top left (diagonal)
    end
end
     
% Fill in the blues
for i= [1:2:N] %blues are always in odd indexed rows
    for j=[1:2:M] %blues is always odd index column
        img(i,j,1) = img(i+1,j+1,1); %takes red from bottom right
        img(i,j,2) = img(i,j+1,3); %takes green from right
    end
end

% Fill in the greens
for i = [2:2:N]
    for j = [1:2:M-1 ] %green pixels in row with reds
       img(i,j,1)= img(i,j+1,1);
       img(i,j,3)= img(i-1,j,3);
    end
end
for i = [1:2:N-1]
    for j = [2:2:M] %green pixel in blue row
        img(i,j,1)=img(i+1,j,1);
        img(i,j,3)=img(i, j-1,3);
    end
end
filtered = img;
