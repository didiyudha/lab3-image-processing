clc;
clear;

I = imread('images/boy_noisy.gif');

PQ = paddedsize(size(I));
F=fft2(double(I),PQ(1),PQ(2));
Fc=fftshift(F);
S1=log(1+abs(Fc));
subplot(1,2,1),imshow(I),title('Noisy Image');
subplot(1,2,2),imshow(S1,[]),title('Fourier Spectrum of Noisy Image');

H1 = notch('btw', PQ(1), PQ(2), 35, -65, 31);
H2 = notch('btw', PQ(1), PQ(2), 35, 65, -31);
H3 = notch('btw', PQ(1), PQ(2), 35, 65, 31);
H4 = notch('btw', PQ(1), PQ(2), 35, -65, -31);

FS_remove_noise = F.*H1.*H2.*H3.*H4;

F_remove_noise = real(ifft2(FS_remove_noise));
F_remove_noise = F_remove_noise(1:size(I,1), 1:size(I,2));
Fcf = fftshift(FS_remove_noise);
S2 = log(1+abs(Fcf));

subplot(2,2,1),imshow(I),title('Original Image');
subplot(2,2,2),imshow(F_remove_noise,[]),title('Image after Butterworth notch filters');
subplot(2,2,3),imshow(S2,[]),title('Fourier Spectrum');
