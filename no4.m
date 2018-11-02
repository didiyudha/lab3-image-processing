clc;
clear;

I = imread('images/Opening_original.jpg');
I_GRAY = rgb2gray(I);

se = strel(ones(10, 1));
bw2 = imerode(I_GRAY, se);
bw3 = imdilate(bw2, se);
bw3 = imopen(I_GRAY, se);
marker = imerode(I_GRAY, se);
mask = I_GRAY;
characters = imreconstruct(marker, mask);
imshow(characters);


