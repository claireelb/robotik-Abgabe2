clear
%% Get Current Working Directory 
filePath = matlab.desktop.editor.getActiveFilename;
fprintf('%s\n',filePath);
cwd = split(filePath, "start.m");
cwd = char(cwd(1));
addpath(cwd);
%%  Add Project 
addpath(genpath(cwd));
%% init 
cd(cwd+"visualization/");
init_Visualization


%% Check which dynamic function is the right one
clc;
q = zeros(1,7);
dq = zeros(1,7);


fprintf("dynamics_iiwa_1:")
[M, C, g, H, Jg, dJg] = dynamics_iiwa_1(q,dq);
%Erfüllt Passivität nicht siehe 2.1-passivität.png
fprintf("dynamics_iiwa_2:")
[M, C, g, H, Jg, dJg] = dynamics_iiwa_2(q,dq); % g terme zu groß 
g
fprintf("dynamics_iiwa_3:")
[M, C, g, H, Jg, dJg] = dynamics_iiwa_3(q,dq); 
eig(M) %Ein  Eigenwert von M ist negativ
fprintf("dynamics_iiwa_4:")
[M, C, g, H, Jg, dJg] = dynamics_iiwa_4(q,dq);
disp("Gewählt");
g
fprintf("dynamics_iiwa_5:")
[M, C, g, H, Jg, dJg] = dynamics_iiwa_5(q,dq);
M %M(7,7) < 0.1 laut Angabe >=0.1
Jg


%% Result Aufgabe 2.1

