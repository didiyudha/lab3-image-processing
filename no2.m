clc;
clear;

kapal_asli = imread('images/kapal.jpg');
kapal_noisy = imread('images/kapal_noisy.jpg');

R = kapal_noisy(:,:,1);
G = kapal_noisy(:,:,2);
B = kapal_noisy(:,:,3);

medianFilterImage(:,:,1) = medfilt3(R);
medianFilterImage(:,:,2) = medfilt3(G);
medianFilterImage(:,:,3) = medfilt3(B);

medianFilterImage1(:,:,1) = medfilt3(medianFilterImage(:,:,1));
medianFilterImage2(:,:,2) = medfilt3(medianFilterImage(:,:,2));
medianFilterImage3(:,:,3) = medfilt3(medianFilterImage(:,:,3));

medianFilterImageX(:,:,1) = medfilt3(medianFilterImage1(:,:,1));
medianFilterImageX(:,:,2) = medfilt3(medianFilterImage2(:,:,2));
medianFilterImageX(:,:,3) = medfilt3(medianFilterImage3(:,:,3));

medianFilterImageY(:,:,1) = medfilt3(medianFilterImageX(:,:,1));
medianFilterImageY(:,:,2) = medfilt3(medianFilterImageX(:,:,2));
medianFilterImageY(:,:,3) = medfilt3(medianFilterImageX(:,:,3));

medianFilterImageZ(:,:,1) = medfilt3(medianFilterImageY(:,:,1));
medianFilterImageZ(:,:,2) = medfilt3(medianFilterImageY(:,:,2));
medianFilterImageZ(:,:,3) = medfilt3(medianFilterImageY(:,:,3));

subplot(1, 2, 1), imshow(kapal_noisy), title('Kapal Noisy');
subplot(1, 2, 2), imshow(medianFilterImageZ), title('Median Filter');

[peaksnr, snr] = psnr(medianFilterImageZ, kapal_asli)
err = immse(medianFilterImageZ, kapal_asli)
