clc;
clear;

kapal_asli = imread('images/kapal.jpg');
kapal_noisy = imread('images/kapal_noisy.jpg');

I2 = imcrop(kapal_noisy,[0 100 100 100]);
imhist(I2);

imgdob = im2double(kapal_asli);
noisyimg = imgdob + randg(1,size(imgdob)) .* 0.15;
noisyimg(noisyimg< 0) = 0;
noisyimg(noisyimg> 1) = 1;
figure,imshow(imgdob);

[peaksnr, snr] = psnr(imgdob, double(kapal_asli))
err = immse(imgdob, double(kapal_asli))