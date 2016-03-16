% Simulate a camera
close all



%% Acquisition and Demosaicing

% Get the Bayer filtered image
load 'captured.mat'
figure(1)
image(captured)
title('Captured Image with Mosaic')

% demosaic the captured image
filteredPDI = demosaicPDI(captured);
filteredBilinear = demosaicBilinear(captured);


figure(2)
subplot(1,2,1)
image(filteredPDI)
title('Demosaiced image--Pixel Doubling Interpolation')
subplot(1,2,2)
image(filteredBilinear)
title('Demosaiced image--Bilinear Interpolation')

filtered = filteredBilinear; % choose the best one