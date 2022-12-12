addpath('./meshes')

%%
param_robot.R_0=eye(3);
param_robot.p_0=[0;0;0];
param_robot.g = -9.81;
param_robot.n = 7;

%% Robot Gravity
param_robot.g_vis=[0;0;param_robot.g];

%% iiwa_link_0
%Mass of link in [kg]
param_robot.link__0.m__0= 5 ;
%Moments of Inertia in [kg*m^2]
param_robot.link__0.I__0=[0.05, 0.06, 0.03000000000000001];

%joint1
param_robot.link__0.R__joint1           = eye(3);
param_robot.link__0.d__joint1           = [0, 0, 0.1575];                  % in [m]
%inertia
param_robot.link__0.R__inertiaOrigin    = eye(3);
param_robot.link__0.d__inertiaOrigin    = [-0.1, 0, 0.07000000000000001];  % in [m]

%% iiwa_link_1

%Mass of link in [kg]
param_robot.link__1.m__1= 4 ;

%Moments of Inertia in [kg*m^2]
param_robot.link__1.I__1=[0.1, 0.09000000000000001, 0.02];

%joint1
param_robot.link__1.R__joint2           = getRotationMatrix(-pi,'z')*getRotationMatrix(pi/2,'x');
param_robot.link__1.d__joint2           = [ 0, 0, 0.2025];           % in[m]

%inertia
param_robot.link__1.R__inertiaOrigin    = eye(3);
param_robot.link__1.d__inertiaOrigin    = [0, -0.03, 0.12];          % in[m]

%% iiwa_link_2
%Mass of link in [kg]
param_robot.link__2.m__2= 4 ;

%Moments of Inertia in [kg*m^2]
param_robot.link__2.I__2=[0.05, 0.018, 0.044];

%joint1
param_robot.link__2.R__joint3           = getRotationMatrix(-pi,'z')*getRotationMatrix(pi/2,'x');
param_robot.link__2.d__joint3           = [0, 0.2375, 0];            % in[m]

%inertia
param_robot.link__2.R__inertiaOrigin    = eye(3);
param_robot.link__2.d__inertiaOrigin    = [0.0003, 0.059, 0.042];    % in[m]

%% iiwa_link_3
%Mass of link in [kg]
param_robot.link__3.m__3= 3 ;

%Moments of Inertia in [kg*m^2]
param_robot.link__3.I__3=[0.08000000000000002, 0.075, 0.009999999999999998];

%joint1
param_robot.link__3.R__joint4           = getRotationMatrix(pi/2,'x');
param_robot.link__3.d__joint4           = [0, 0, 0.1825];           % in [m]

%inertia
param_robot.link__3.R__inertiaOrigin    = eye(3);
param_robot.link__3.d__inertiaOrigin    = [0, 0.03, 0.13];          % in [m]

%% iiwa_link_4
%Mass of link in [kg]
param_robot.link__4.m__4= 2.7 ;

%Moments of Inertia in [kg*m^2]
param_robot.link__4.I__4=[0.03, 0.01, 0.029];

%joint1
param_robot.link__4.R__joint5           = getRotationMatrix(-pi,'z')*getRotationMatrix(pi/2,'x');
param_robot.link__4.d__joint5           = [0, 0.2175, 0];           % in [m]

%inertia
param_robot.link__4.R__inertiaOrigin    = eye(3);
param_robot.link__4.d__inertiaOrigin    = [0,  0.067, 0.034];       % in [m]

%% iiwa_link_5
%Mass of link in [kg]
param_robot.link__5.m__5= 1.7 ;

%Moments of Inertia in [kg*m^2]
param_robot.link__5.I__5=[0.02, 0.018, 0.004999999999999999];

%joint1
param_robot.link__5.R__joint6           = getRotationMatrix(pi/2,'x');
param_robot.link__5.d__joint6           = [0, 0, 0.1825];           % in [m]

%inertia
param_robot.link__5.R__inertiaOrigin    = eye(3);
param_robot.link__5.d__inertiaOrigin    = [0.0001, 0.021, 0.076];   % in [m]

%% iiwa_link_6
%Mass of link in [kg]
param_robot.link__6.m__6= 1.8 ;

%Moments of Inertia in [kg*m^2]
param_robot.link__6.I__6=[0.005, 0.0036, 0.0047];

%joint1
param_robot.link__6.R__joint7           = getRotationMatrix(-pi,'z')*getRotationMatrix(pi/2,'x');
param_robot.link__6.d__joint7           = [0, 0.081, 0];                        %in [m]

%inertia
param_robot.link__6.R__inertiaOrigin    = eye(3);
param_robot.link__6.d__inertiaOrigin    = [0, 0.0005999999999999999, 0.0004];   %in [m]

%% iiwa_link_7
%Mass of link in [kg]
param_robot.link__7.m__7= 0.3 ;

%Moments of Inertia in [kg*m^2]
param_robot.link__7.I__7=[0.001, 0.001, 0.001];

%joint1
param_robot.link__7.R__ee               = eye(3);
param_robot.link__7.d__ee               = [0, 0, 0.071];             %in [m]

%inertia
param_robot.link__7.R__inertiaOrigin    = eye(3);
param_robot.link__7.d__inertiaOrigin    = [0, 0, 0.02];              %in [m]

%% helper function

function R = getRotationMatrix(phi,dir)

    switch dir
        case 'x'
            R = [1,0,0;cos(phi),0,-sin(phi);0,sin(phi),cos(phi)];
        case 'y'
            R = [cos(phi),0,sin(phi);0,1,0;-sin(phi),0,cos(phi)];
        case 'z'
            R = [cos(phi),-sin(phi),0;sin(phi),cos(phi),0;0,0,1];
        otherwise 
            error('.')
    end
    return;

end
