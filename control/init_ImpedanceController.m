%% NOTE:
% Please make sure that you are in the "control" directory and that the
% "visualization" and "dynamics_iiwa" directories are on your MATLB path

clear
clc
addpath(genpath('..'))

%% initialize visualization
run('init_Visualization');

T = 5;

%% Parameters - modify and add further ones if desired
% T = 5;
% % initial value of the configuration
% % q0 = pi/8 * ones(7,1); %%% place your initial value here !!!!!!!!!!!!!!!!!!
% % q0_d = [0 pi/4 0 -pi/2 0 pi/4 0]';
% q0_d = [0 pi/3 0 -pi/9 0 0 0]';
% % q0 = [0 pi/4.5 pi/8 -pi/16 0 pi/4 0]';
% q0 = q0_d;
% % initial value of the joint velocity
% dq0 = zeros(7,1); %%% place your initial value here !!!!!!!!!!!!!!!!!!!!!!!
% 
% [~, ~, ~, H, ~, ~] = dynamics_iiwa(q0_d,dq0);
% xd = x_RPY_fromH(H);
% dxd = zeros(size(xd));
% ddxd = dxd;
%%
% addpath(cwd);
% addpath(genpath(cwd));
% cd(cwd + "control")

%% Fall 1 Coole Pose 
fall= 1;
% initial value of the configuration
q0 = [0 3/2 0 pi/2 0 pi/2 0]'; %%% place your initial value here !!!!!!!!!!!!!!!!!!
dq0 = zeros(7,1); %%% place your initial value here !!!!!!!!!!!!!!!!!!!!!!!

F_ext = [1.4;0;0;0;0;0];

% Parameter für Gewichts, Dämpfung und Steifigkeitsmatrix
l = 1;
d = 1;
k = 1;


[~, ~, ~, H, ~, ~] = dynamics_iiwa(q0,dq0);
xd = x_RPY_fromH(H);
dxd = zeros(size(xd));
ddxd = dxd;

%% Fall 2 
fall = 2;

versatz = 0.1;

q0 = [0 pi/4 0 -pi/2 0 pi/4 0]'; %%% place your initial value here !!!!!!!!!!!!!!!!!!
dq0 = zeros(7,1); %%% place your initial value here !!!!!!!!!!!!!!!!!!!!!!!

F_ext = [1;0;0.13;0;0;0];

% Parameter für Gewichts, Dämpfung und Steifigkeitsmatrix
l = 3;
d = .1;
k = 10;


[~, ~, ~, H, ~, ~] = dynamics_iiwa(q0,dq0);
xd = x_RPY_fromH(H);
% xd = [xd(1) xd(2) xd(3) 0 0 0]';
x_T = [0.5 0.5 0.5 0 0 0]';
% x_T = xd + [0 0 0.1 0 0 0]';
% dxd = zeros(size(xd));
% ddxd = dxd;
sim("ImpedanceController_iiwa.slx")