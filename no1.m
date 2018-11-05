clc;
clear;

I_Fasilkom = imread('images/fasilkom.jpg');
I_Fasilkom_Gray = rgb2gray(I_Fasilkom);

%% Tampilkan Fourier spectrum dari gambar asli!

F = fft2(I_Fasilkom_Gray);
F2=fftshift(F);
F2=abs(F2);
S1=log(1+abs(F2));
subplot(1, 3, 1), imshow(I_Fasilkom), title('Image Original');
subplot(1, 3, 2), imshow(F2,[]), title('Fourier Spectrum Before Scaling');
subplot(1, 3, 3), imshow(S1,[]), title('Fourier Spectrum After Scaling');

%% Tampilkan hasil BLPF dan Fourier spectrum dari citra hasil BLPF

[LPF1, S1] = blpf(I_Fasilkom_Gray, 0.05);
[LPF2, S2] = blpf(I_Fasilkom_Gray, 0.1);

figure
subplot(2,2,1),imshow(LPF1, []),title('BLPF 1');
subplot(2,2,2),imshow(S1,[]),title('Fourier Spectrum D0 = 0.05');
subplot(2,2,3),imshow(LPF2, []),title('BLPF 2');
subplot(2,2,4),imshow(S2,[]),title('Fourier Spectrum D0 = 0.1');

%% Tampilkan hasil HLPF dan Fourier spectrum dari citra hasil HLPF

[HPF1, SPF1] = bhpf(I_Fasilkom_Gray, 0.01);
[HPF2, SPF2] = bhpf(I_Fasilkom_Gray, 0.5);

figure
subplot(2,2,1),imshow(HPF1, []),title('BHPF 1');
subplot(2,2,2),imshow(SPF1,[]),title('Fourier Spectrum D0 = 0.05');
subplot(2,2,3),imshow(HPF2, []),title('BHPF 2');
subplot(2,2,4),imshow(SPF2,[]),title('Fourier Spectrum D0 = 0.1');