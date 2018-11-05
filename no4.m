clc;
clear;

%% Read image from directory
I = imread('images/Opening_original.jpg');

%% RGB to Gray
I_GRAY = rgb2gray(I);

%% Gray to binary image
IBW = imbinarize(I_GRAY);

%% Define a strel
se = strel(ones(10, 1));

%% Image erotion
marker = imerode(IBW, se);
mask = IBW;

%% Image reconstruction
characters = imreconstruct(marker, mask);

%% Showing the result
subplot(3, 2, 1), imshow(I), title('Original Image (1)');
subplot(3, 2, 2), imshow(I_GRAY), title('Grayscale image (2)');
subplot(3, 2, 3), imshow(IBW), title('Binary Image (3)');
subplot(3, 2, 4), imshow(marker), title('Marker (4)');
subplot(3, 2, 5), imshow(characters), title('Result (5)');