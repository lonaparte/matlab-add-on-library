function [x1, y1, z1] = myBode(objTF, n, fstart, fend)
% Function to draw the bode plot with the phase-frequency plot in [-180, 180] range.
% Usage: [x1, y1, z1] = myBode(objTF, n, fstart, fend)
% x1: output frequency axis in Hz unit
% y1: output magnitude
% z1: output phase
% objTF: transfer function in type 'TF'
% n: number of points used in bode plot drawing
    num = objTF.num{1};
    den = objTF.den{1};
    syms s_s
    s_vector = [1];
    for i = 2:length(den)
        s_vector = [s_s*s_vector, 1];
    end
    x1 = zeros(n,1);
    y1 = zeros(n,1);
    z1 = zeros(n,1);
    for j = 1:n
        x1(j) = fstart*(fend/fstart)^((j-1)/(n-1));
        s_value = 1i*2*pi*x1(j);
        objTF_value = subs((s_vector*num')/(s_vector*den'), s_s, s_value);
        y1(j) = 20*log10(abs(objTF_value));
        z1(j) = angle(objTF_value)*180/pi;
        if z1(j)>180
            z1(j) = z1(j) - 360;
            if z1(j)>180
                z1(j) = z1(j) - 360;
            end
        end
        if z1(j)<-180
            z1(j) = z1(j) + 360;
            if z1(j)<-180
                z1(j) = z1(j) + 360;
            end
        end
    end
end