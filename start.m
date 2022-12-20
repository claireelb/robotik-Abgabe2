clear
cd ~/Documents/MATLAB
%% Get Current Working Directory 
filePath = matlab.desktop.editor.getActiveFilename;
fprintf('%s\n',filePath);
cwd = split(filePath, "start.m");
cwd = char(cwd(1));
addpath(cwd);
%%  Add Project 
addpath(genpath(cwd));
%% init 
cd(cwd);
%% Visu
cd(cwd+"visualization/");
%init_Visualization


%% Check which dynamic function is the right one
clc;
q = zeros(1,7);
dq = zeros(1,7);


fprintf("dynamics_iiwa_1:")
[M, C, g, H, Jg, dJg] = dynamics_iiwa_1(q,dq);
eig(M)
% Visualisierung -->  Passivitätseigenschaft nicht erfüllt 
fprintf("dynamics_iiwa_2:")
[M, C, g, H, Jg, dJg] = dynamics_iiwa_2(q,dq); 
% g falsch (0.0814  -54.1212   -0.3612   14.7931   -0.3436   -0.3072  0)
% Werte sehr groß und q1 sollte 0 sein. 
fprintf("dynamics_iiwa_3:")
[M3, C, g, H, Jg, dJg] = dynamics_iiwa_3(q,dq); 
eig(M3); %Ein  Eigenwert von M ist negativ
fprintf("dynamics_iiwa_4:")
[M4, C, g, H, Jg, dJg] = dynamics_iiwa_4(q,dq);
eig(M4)
M4
fprintf("dynamics_iiwa_5:")
[M5, C, g, H, Jg, dJg] = dynamics_iiwa_5(q,dq);
eig(M5) 
M5 % M5(7,7) < 0.1 laut def sollte >= 0.1 sein 


%% Result Aufgabe 2.1

%% Aufgabe 2.2 