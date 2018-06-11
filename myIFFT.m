function [yef,tt] = myIFFT(F,fx,t)
% Calculate the IFFT in a normal used form.
% Usage:
%   [yef,tt] = myIFFT(F,fx,t)
% Input:
%   F: the spectra of signal
%   fx: the correspond frequency series
%   t: the time range [-t,t] that we want in time domain
% Output:
%   yef,tt: to plot the result
% Modified and Used by Lonaparte CHENG
% Website: https://github.com/lonaparte/matlab-add-on-library
t = t*2;
fsample = (length(F)-1)/fx(end)/2;
range = (length(F)-1)/fsample;
y = ifft(F*range);
dt = t/length(y);
tt = (0:dt:dt*(length(y)-1)) - t/2;
yef = ifftshift(abs(y));
end

