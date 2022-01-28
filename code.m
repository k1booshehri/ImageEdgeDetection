%% edge
clc
clear
close all
img = imread('booshehri.png');
img_gray = rgb2gray(img);
img_edge = edge(img_gray,'Canny');
subplot(1,2,1)
imshow(img)
title('original image')
subplot(1,2,2)
imshow(img_edge)
title('edge image')
%% noise
clc
clear
close all
img = imread('booshehri.png');
img_gray = im2double(rgb2gray(img));
n = numel(img_gray);
sig = sum(img_gray(:).^2);
noise = round(sig/4);
salt = randperm(n,noise);
pad = zeros(1,n);
pad(salt) = 1;
noise = reshape(pad,size(img_gray));
SNR = snr(img_gray,noise)
img_noisy = img_gray+noise;
%% noise removal
clc
img_noise_remove = medfilt2(img_noisy,[3,3]);
SNR_filtered = snr(img_gray,img_gray-img_noise_remove)
subplot(1,3,1)
imshow(img_gray)
title('grayscale image')
subplot(1,3,2)
imshow(img_noisy)
title('noisy image')
subplot(1,3,3)
imshow(img_noise_remove)
title('enhanced image')




