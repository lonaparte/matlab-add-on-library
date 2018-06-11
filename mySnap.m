function mySnap(model)
% Create the snapshot of a simulink model like output of the function "plot".
% Usage:
%   mySnap('name of the model')
% For exemple: 
%   mySnap('vdp');
% Original Author: Sean de Wolski
% Original Page: (https://www.mathworks.com/matlabcentral/answers/361307-how-do-i-include-my-simulink-model-in-a-live-script?s_tid=srchtitle)
% Modified and Used by Lonaparte CHENG
% Website: https://github.com/lonaparte/matlab-add-on-library
import slreportgen.report.*
sim(model,0.001)
% open_system(model)
r = Report(tempname, 'html');
D = Diagram(model);
D.SnapshotFormat = 'png';
add(r, D);
imshow(imread(char(D.Snapshot.Image)));
close(r);
delete(r.OutputPath);
end