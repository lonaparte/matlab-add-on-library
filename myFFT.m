function [F,fx] = myFFT(varargin)
% Calculate the FFT in a normal used form.
% Usage:
%   [F,fx] = myFFT(x,t,N)
%   [F,fx] = myFFT(x,t,N,'norm')
% Input:
%   x: the signal in discrete time domain
%   t: the time serie in time domain. The effect element is t(end).
%   N: 2^N is the FFT point number to realize 
%   'norm': to normalize the output spectrum
% Output:
%   F: the normalized value of FFT
%   fx: the correspond frequence
% Modified and Used by Lonaparte CHENG
% Website: https://github.com/lonaparte/matlab-add-on-library
x = varargin{1};
t = varargin{2};
N = varargin{3};
tr = t(end);
fs = (length(x)-1)/2/tr;
df = fs/2^N;
fx = (0:df:df*(2^N-1)) - fs/2;
if nargin == 3
    value = abs(fft(x,2^N))/2^N;
    F = fftshift(value);
elseif varargin{4} == 'norm'
    value = abs(fft(x,2^N))/max(abs(fft(x,2^N)));
    F = fftshift(value);
end