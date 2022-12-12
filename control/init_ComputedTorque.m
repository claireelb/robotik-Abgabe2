%% NOTE:
% Please make sure, you are in the "control" directory and that the
% "visualization" and "dynamics_iiwa" directories are on your MATLB path

clear
addpath(genpath('..'))

%% Parameters - not to be modified ----------------------------------------
% initialize visualization
run('init_Visualization');

% simulation time (the time for the trajectory will be 0.8*T)
T = 10;

% initial values of the desired trajectory
qd_0 = [0; pi/4; 0; -pi/2; 0; 1/4*pi;0];
dqd_0 = zeros(7,1);

%% Parameters - modify and add further ones if desired --------------------
% initial configuration and velocity
q0 = qd_0;
dq0 = dqd_0;