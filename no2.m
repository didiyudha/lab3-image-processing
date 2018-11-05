clc;
clear;

kapal_asli = imread('images/kapal.jpg');
kapal_noisy = imread('images/kapal_noisy.jpg');

I2 = imcrop(kapal_noisy,[0 100 100 100]);

R = kapal_noisy(:,:,1);
G = kapal_noisy(:,:,2);
B = kapal_noisy(:,:,3);

sigma = 1.5;
alpha = 1.5;

medianFilterImage(:,:,1) = medfilt2(R);
medianFilterImage(:,:,2) = medfilt2(G);
medianFilterImage(:,:,3) = medfilt2(B);

subplot(2, 2, 1), imshow(kapal_noisy), title('Kapal Noisy');
subplot(2, 2, 2), imshow(medianFilterImage), title('Median Filter');
subplot(2, 2, 3), imhist(I2), title('Noise Distribution - Gamma');
subplot(2, 2, 4), imshow(kapal_asli), title('Original Image');

[peaksnr, snr] = psnr(medianFilterImage, kapal_asli)
err = immse(medianFilterImage, kapal_asli)
