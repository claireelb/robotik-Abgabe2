%% NOTE:
% Please make sure that you are in the "control" directory and that the
% "visualization" and "dynamics_iiwa" directories are on your MATLB path

clear
addpath(genpath('..'))

%% initialize visualization
run('init_Visualization');

%% Parameters - modify and add further ones if desired

% initial value of the configuration
q0 = pi/8 * ones(7,1); %%% place your initial value here !!!!!!!!!!!!!!!!!!
% initial value of the joint velocity
dq0 = zeros(7,1); %%% place your initial value here !!!!!!!!!!!!!!!!!!!!!!!