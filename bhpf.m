function [HPF,FS] = bhpf(I, n)
    PQ = paddedsize(size(I));

    % membuat Butterworth lowpass filter
    D0 = n*PQ(1);
    H = hpfilter('btw', PQ(1), PQ(2), D0);

    % menghitung DFT citra
    F=fft2(double(I),size(H,1),size(H,2));

    % Apply highpass filter
    HPFS = H.*F;

    % Convert ke domain spasial 
    HPF = real(ifft2(HPFS)); 
    HPF = HPF(1:size(I,1), 1:size(I));

    % Menampilkan fourier spectrum
    Fc=fftshift(F);
    % Fcf=fftshift(HPFS);

    % fungsi abs untuk menghitung magnitude
    FS=log(1+abs(Fc));
    % S2=log(1+abs(Fcf));
end

