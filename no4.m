clc;
clear;

I = imread('images/Opening_original.jpg');
I_GRAY = rgb2gray(I);
IBW = imbinarize(I_GRAY);

se = strel(ones(10, 1));
marker = imerode(IBW, se);
mask = IBW;
characters = imreconstruct(marker, mask);

subplot(1, 2, 1), imshow(I), title('Original Image');
subplot(1, 2, 2), imshow(characters), title('After Morphology Process');