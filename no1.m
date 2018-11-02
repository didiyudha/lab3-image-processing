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

PQ = paddedsize(size(I_Fasilkom_Gray));
 
% membuat Butterworth ?lowpass? filter
D0 = 0.05*PQ(1);
H = lpfilter('btw', PQ(1), PQ(2), D0);

% menghitung DFT citra 
F=fft2(double(I_RGB),size(H,1),size(H,2));

% Apply lowpass filter 
LPFS = H.*F;

% convert ke domain spasial 
LPF = real(ifft2(LPFS)); 
LPF=LPF(1:size(I_RGB,1), 1:size(I_RGB,2));

% % Menampilkan fourier spectrum
Fc=fftshift(F);
Fcf=fftshift(LPFS); 
S1=log(1+abs(Fc));
S2=log(1+abs(Fcf));

subplot(1,2,1),imshow(LPF, []),title('BLPF');
subplot(1,2,2),imshow(S1,[]),title('Fourier Spectrum of Image');

%% Tampilkan hasil HLPF dan Fourier spectrum dari citra hasil HLPF
PQ = paddedsize(size(I_RGB));


% membuat Butterworth lowpass filter
D0 = 0.05*PQ(1);
H = hpfilter('btw', PQ(1), PQ(2), D0);

% menghitung DFT citra
F=fft2(double(I_RGB),size(H,1),size(H,2));

% Apply highpass filter
HPFS = H.*F;

% Convert ke domain spasial 
HPF=real(ifft2(HPFS)); 
HPF=HPF(1:size(I_RGB,1), 1:size(I_RGB));

% Menampilkan fourier spectrum
Fc=fftshift(F);
Fcf=fftshift(HPFS);

% fungsi abs untuk menghitung magnitude
S1=log(1+abs(Fc));
S2=log(1+abs(Fcf));

subplot(1,2,1),imshow(HPF, []),title('BHPF');
subplot(1,2,2),imshow(S1,[]),title('Fourier Spectrum of Image');
