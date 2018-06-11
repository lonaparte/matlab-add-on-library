function [F,fx] = myFFT(x,fsample)
    % Calculate the FFT in a normal used form.
    % Usage:
    %   [F,fx] = myFFT(x,fs)
    % Input:
    %   x: the signal in discrete time domain
    %   fs: the sample frequence
    % Output:
    %   F: the normalized value of FFT
    %   fx: the correspond frequence
    % Modified and Used by Lonaparte CHENG
        Sampling = length(x);
        fx = (0:fsample/(Sampling-1):fsample)-fsample/2;
        value = abs(fft(x));
        norme = max(value);
        F = fftshift(value)/fsample;
    end