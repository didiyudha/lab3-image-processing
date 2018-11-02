clc;
clear;

I = imread('images/boy_noisy.gif');

PQ = paddedsize(size(I));
F=fft2(double(I),PQ(1),PQ(2));
Fc=fftshift(F);
S1=log(1+abs(Fc));
subplot(1,2,1),imshow(I),title('Noisy Image');
subplot(1,2,2),imshow(S1,[]),title('Fourier Spectrum of Noisy Image');

% H1 = notch('ideal', PQ(1), PQ(2), 19, -65, 31);
% H2 = notch('ideal', PQ(1), PQ(2), 19, 65, -31);
% H3 = notch('ideal', PQ(1), PQ(2), 19, 65, 31);
% H4 = notch('ideal', PQ(1), PQ(2), 19, -65, -31);

H1 = notch('ideal', PQ(1), PQ(2), 19, -65, 31);
H2 = notch('ideal', PQ(1), PQ(2), 19, 65, -31);
H3 = notch('ideal', PQ(1), PQ(2), 19, 65, 31);
H4 = notch('ideal', PQ(1), PQ(2), 19, -65, -31);



FS_football = F.*H1.*H2.*H3.*H4;

F_football = real(ifft2(FS_football));
F_football = F_football(1:size(I,1), 1:size(I,2));
Fcf = fftshift(FS_football);
S2 = log(1+abs(Fcf));
subplot(1,2,1),imshow(F_football,[]),title('Image after Butterworth notch filters');
subplot(1,2,2),imshow(S2,[]),title('Spectrum of image after Butterworth notch filters');