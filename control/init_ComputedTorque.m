%% NOTE:
% Please make sure, you are in the "control" directory and that the
% "visualization" and "dynamics_iiwa" directories are on your MATLB path
close all;
clear
addpath(genpath('..'))

%% Parameters - not to be modified ----------------------------------------
% initialize visualization
run('init_Visualization');

% simulation time (the time for the trajectory will be 0.8*T)
T = 10;

% initial values of the desired trajectory
qd_0 = [0; pi/4; 0; -pi/2; 0; pi/4;0];
dqd_0 = zeros(7,1);
% dqd_0 = ones(7,1)*0.2;
% dqd_0=[0; pi/4; 0; -pi/2; 0; pi/4;0];

%% Parameters - modify and add further ones if desired --------------------
% initial configuration and velocity
% q0 = qd_0;
% % dq0 = dqd_0;
% % q0 = [0; pi/4+0.5; 0; -pi/2; 0; pi/4+2;0]; 
% dq0 = [0; pi/4; 0; -pi/2; 0; pi/4;0];


%% Plots erstellen 
for fall = 1:3
    for kk = [0.1,1,10,100]
        if fall == 1
            % Erwartungswert ist Position
            q0 = qd_0; 
            dq0 = dqd_0;
            
        
        elseif fall == 2 
            % Erwartungswert ist nicht Position 
            q0 = [0; pi/4+0.5; 0; -pi/2; 0; pi/4+2;0]; 
            dq0 = dqd_0;

        elseif fall == 3 
            % Erwartungswert ist nicht Position und Geschwindigkeit != 0
            q0 = [0; pi/4+0.5; 0; -pi/2; 0; pi/4+2;0]; 
            dq0 = ones(7,1)*pi/4;
        end
        
        k1 = kk ; 
        k2 = kk ; 
        CT = sim("ComputedTorque_iiwa.slx");
        
        
        % Plot q
        
        h = figure();
        h.Position(3:4) = [1280/2 720/2];
        
        pathplusname = "../report/2.4-diffq-k1-"+num2str(k1)+"k2-"+num2str(k2)+"fall"+num2str(fall)+".png";
        titlename= "qd-q";
        legend_title = "q";
        legend_label = ["","","","","","",""];
        for i = 1:7
            a = CT.diffq(i,:,:);
            a = squeeze(a);
            plot(CT.tout, a);
            hold on;
            grid on;
            legend_label(i) = legend_title+num2str(i);
        
        end
        legend(legend_label,Location="best");
        title(titlename);
        saveas(h,pathplusname,'png');
        
        
        % Plot dq
        
        g = figure();
        g.Position(3:4) = [1280/2 720/2];
        pathplusname = "../report/2.4-diffdq-k1-"+num2str(k1)+"k2-"+num2str(k2)+"fall"+num2str(fall)+".png";
        titlename= "dqd-dq";
        legend_title = "dq";
        legend_label = ["","","","","","",""];
        for i = 1:7
            a = CT.diffdq(i,:,:);
            a = squeeze(a);
            plot(CT.tout, a);
            hold on;
            grid on;
            legend_label(i) = legend_title+num2str(i);
        
        end
        legend(legend_label,Location="best");
        title(titlename);
        
        saveas(g,pathplusname,'png');
        
        % Plot tau
        
        j = figure();
        j.Position(3:4) = [1280/2 720/2];
        pathplusname = "../report/2.4-tau-k1-"+num2str(k1)+"k2-"+num2str(k2)+"fall"+num2str(fall)+".png";
        titlename= "tau";
        legend_title = "tau";
        legend_label = ["","","","","","",""];
        for i = 1:7
            a = CT.tau(i,:,:);
            a = squeeze(a);
            plot(CT.tout, a);
            hold on;
            grid on;
            legend_label(i) = legend_title+num2str(i);
        
        end
        legend(legend_label,Location="best");
        title(titlename);
        
        saveas(j,pathplusname,'png');
    end
end


%% close all figures
% close all;