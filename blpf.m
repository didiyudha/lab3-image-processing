function [LPF, FS] = blpf(I, n)
    PQ = paddedsize(size(I));

    % membuat Butterworth lowpass filter
    D0 = n*PQ(1);
    H = lpfilter('btw', PQ(1), PQ(2), D0);

    % menghitung DFT citra 
    F=fft2(double(I),size(H,1),size(H,2));

    % Apply lowpass filter 
    LPFS = H.*F;

    % convert ke domain spasial 
    LPF = real(ifft2(LPFS)); 
    LPF = LPF(1:size(I,1), 1:size(I,2));

    % Menampilkan fourier spectrum
    Fc=fftshift(F);
    % Fcf=fftshift(LPFS); 
    FS=log(1+abs(Fc));
end