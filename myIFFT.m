function [yef,tt] = myIFFT(varargin)
% Calculate the IFFT in a normal used form.
% Usage:
%   [yef,tt] = myIFFT(F,fx,N)
%   [yef,tt] = myIFFT(F,fx,N,'noabs')
% Input:
%   F: the spectra of signal
%   fx: the correspond frequency series, the effect element is fx(end)
%   N: N is the FFT point number to realize
%   'noabs': do not calculate the absolute value of the result
% Output:
%   yef,tt: to plot the result
% Modified and Used by Lonaparte CHENG
% Website: https://github.com/lonaparte/matlab-add-on-library
F = varargin{1};
fx = varargin{2};
N = varargin{3};
y = ifft(F*N,N);
t = (length(y)-1)/2/fx(end);
dt = t/length(y);
tt = (0:dt:dt*(length(y)-1)) - t/2;
if nargin == 3
    yef = ifftshift(abs(y));
elseif varargin{4} == 'noabs'
    yef = ifftshift(y);
end

