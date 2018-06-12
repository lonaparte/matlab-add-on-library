function [yef,tt] = myIFFT(F,fx,N)
% Calculate the IFFT in a normal used form.
% Usage:
%   [yef,tt] = myIFFT(F,fx,N)
% Input:
%   F: the spectra of signal
%   fx: the correspond frequency series, the effect element is fx(end)
%   N: 2^N is the FFT point number to realize
% Output:
%   yef,tt: to plot the result
% Modified and Used by Lonaparte CHENG
% Website: https://github.com/lonaparte/matlab-add-on-library
y = ifft(F*2^N,2^N);
t = (length(y)-1)/2/fx(end);
dt = t/length(y);
tt = (0:dt:dt*(length(y)-1)) - t/2;
yef = ifftshift(abs(y));
end

