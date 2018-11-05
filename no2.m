clc;
clear;

%% Read image from directory
kapal_asli = imread('images/kapal.jpg');
kapal_noisy = imread('images/kapal_noisy.jpg');

%% Take a random noise sample, from the top left image.
I2 = imcrop(kapal_noisy,[0 100 100 100]);

%% Take every single channel of the image.
R = kapal_noisy(:,:,1);
G = kapal_noisy(:,:,2);
B = kapal_noisy(:,:,3);

%% Apply median filter for each channel
medianFilterImage(:,:,1) = medfilt2(R);
medianFilterImage(:,:,2) = medfilt2(G);
medianFilterImage(:,:,3) = medfilt2(B);

%% Showing the result
subplot(2, 2, 1), imshow(kapal_noisy), title('Kapal Noisy');
subplot(2, 2, 2), imshow(medianFilterImage), title('Median Filter');
subplot(2, 2, 3), imhist(I2), title('Noise Distribution - Gamma');
subplot(2, 2, 4), imshow(kapal_asli), title('Original Image');

%% Count PSNR and MSE
[peaksnr, snr] = psnr(medianFilterImage, kapal_asli)
err = immse(medianFilterImage, kapal_asli)
