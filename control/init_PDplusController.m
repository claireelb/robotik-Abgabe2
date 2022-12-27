%% NOTE:
% Please make sure that you are in the "control" directory and that the
% "visualization" and "dynamics_iiwa" directories are on your MATLB path

clear
addpath(genpath('..'))

%% initialize visualization
run('init_Visualization');

%% Parameters - modify and add further ones if desired
% 
% % initial value of the configuration
% q0 = pi/8 * ones(7,1); %%% place your initial value here !!!!!!!!!!!!!!!!!!
% % initial value of the joint velocity
% dq0 = zeros(7,1); %%% place your initial value here !!!!!!!!!!!!!!!!!!!!!!!

%%
 T= 5;
%% Fall 1 unCoole Pose 
fall= 1;
% initial value of the configuration
% q0 = [0 3/2 0 pi/2 0 pi/2 0]'; %%% place your initial value here !!!!!!!!!!!!!!!!!!
q0 = [0 pi/4 0 -pi/2 0 pi/4 0]';

dq0 = zeros(7,1); %%% place your initial value here !!!!!!!!!!!!!!!!!!!!!!!

F_ext = [0.1;0;0;0;0;0];

% Parameter für Gewichts, Dämpfung und Steifigkeitsmatrix
% l = 1;
d = 1;
k = 10;


[~, ~, ~, H, ~, ~] = dynamics_iiwa(q0,dq0);
xd = x_RPY_fromH(H);
dxd = zeros(size(xd));
ddxd = dxd;

%sim("PDplusController_iiwa.slx");

%% Fall 2 

fall= 2;
% initial value of the configuration
% q0 = [0 3/2 0 pi/2 0 pi/2 0]'; %%% place your initial value here !!!!!!!!!!!!!!!!!!
q0 = [0 pi/4 0 -pi/2 0 pi/4 0]';
dq0 = zeros(7,1); %%% place your initial value here !!!!!!!!!!!!!!!!!!!!!!!

F_ext = [-10;0;0;0;0;0];

% Parameter für Gewichts, Dämpfung und Steifigkeitsmatrix
% l = 1;
d = 1;
k = 10;


[~, ~, ~, H, ~, ~] = dynamics_iiwa(q0,dq0);
xd = x_RPY_fromH(H);
x_T = [0.5 0.5 0.5 0 0 0]';
%dxd = zeros(size(xd));
%ddxd = dxd;

sim("PDplusController_iiwa.slx");

