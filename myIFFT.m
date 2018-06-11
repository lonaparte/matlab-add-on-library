function [yef,tt] = myIFFT(F,fsample,T)
% Calculate the IFFT in a normal used form.
% Input:
%   F: the spectra of signal
%   fsample: the sample frequency in the spectra
%   T: the time range [-T/2,T/2] that we want in time domain
% Output:
%   yef,tt: to plot the result
range = (length(F)-1)/fsample;
y = ifft(F*range);
dt = T/length(y);
tt = (0:dt:dt*(length(y)-1)) - T/2;
yef = ifftshift(abs(y));
end

