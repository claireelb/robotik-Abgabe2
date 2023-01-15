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

%% Fall 1.1 Sollpose ist Istpose Keine Störung  
fall= 1;
up = 1;
% initial value of the configuration
q0 =  [0 pi/4 0 -pi/2 0 pi/4 0]'; %%% place your initial value here !!!!!!!!!!!!!!!!!!
dq0 = zeros(7,1); %%% place your initial value here !!!!!!!!!!!!!!!!!!!!!!!

F_ext = [0;0;0;0;0;0];

% Parameter für Gewichts, Dämpfung und Steifigkeitsmatrix
l = 1;
d = 10;
k = 10;


[~, ~, ~, H, ~, ~] = dynamics_iiwa(q0,dq0);
xd = x_RPY_fromH(H);
dxd = zeros(size(xd));
ddxd = dxd;

%% Fall 1.2 Sollpose ist nicht Istpose Keine Störung  
up = 2;

q0_d = q0;
dq0_d = dq0;
q0 =  [0 pi/5 0 -pi/2 0 pi/5 0]'; %%% place your initial value here !!!!!!!!!!!!!!!!!!
dq0 = zeros(7,1); %%% place your initial value here !!!!!!!!!!!!!!!!!!!!!!!

[~, ~, ~, H, ~, ~] = dynamics_iiwa(q0_d,dq0_d);
xd = x_RPY_fromH(H);
dxd = zeros(size(xd));
ddxd = dxd;


%% Fall 2.1 Trajektoriefolgeregelung ohne störung
fall = 2;
up = 1; 
versatz = 0.1;

q0 = [0 pi/4 0 -pi/2 0 pi/4 0]'; %%% place your initial value here !!!!!!!!!!!!!!!!!!
dq0 = zeros(7,1); %%% place your initial value here !!!!!!!!!!!!!!!!!!!!!!!

F_ext = zeros(6,1);


% Parameter für Gewichts, Dämpfung und Steifigkeitsmatrix wie in Fall 1 

[~, ~, ~, H, ~, ~] = dynamics_iiwa(q0,dq0);
xd = x_RPY_fromH(H);
x_T = [0.5 0.50 0.50 0 0 0]';


%% Fall 2.2  Trajektoriefolgeregelung mit störung
up = 2;

F_ext = -[0.9;0;-0.5;0;0;0];  %N
%% Run simlink 
sim("ImpedanceController_iiwa.slx")

%% plot Data 

plotResIMPPDP("../report/2.5-diffx-", "x-xd", "diffx", out.ex,out.tout,d,k,fall,up);
plotResIMPPDP("../report/2.5-diffdx-", "dx-dxd", "diffdx", out.dex,out.tout,d,k,fall,up);
plotResIMPPDP("../report/2.5-tau-", "tau", "tau", out.tau,out.tout,d,k,fall,up);
