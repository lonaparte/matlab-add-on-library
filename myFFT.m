function [F,fx] = myFFT(x,t,N)
% Calculate the FFT in a normal used form.
% Usage:
%   [F,fx] = myFFT(x,t,N)
% Input:
%   x: the signal in discrete time domain
%   t: the time serie in time domain. The effect element is t(end).
%   N: 2^N is the FFT point number to realize 
% Output:
%   F: the normalized value of FFT
%   fx: the correspond frequence
% Modified and Used by Lonaparte CHENG
% Website: https://github.com/lonaparte/matlab-add-on-library
    tr = t(end);
    fs = (length(x)-1)/2/tr;
    df = fs/2^N;
    fx = (0:df:df*(2^N-1)) - fs/2;
    value = abs(fft(x,2^N))/fs;
    F = fftshift(value);
end