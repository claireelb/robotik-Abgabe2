clear;
load("contact_force/ContactForceData.mat")


%% Aufgabe 2.2 
getLengths
% First guess
% z = d_1 + d_2 + d_3 *cos(q_2) + d_4 + d_5 *cos(q_2-q_4)+d_6+d_7 *cos(q_2-q_4+q_6) +d_8 +d_9
% With values we calculated
% z = d_12 + d_34 *cos(q_2) + d_56 *cos(q_2-q_4) + d_789 *cos(q_2-q_4+q_6)

% With Maple: 
q = q_Force(1:7,1); % einzelenes eelmeent 
dq = dq_Force(1:7,1);
tau = tau_Force(1:7,1);
A = [0 -d_34 * sin(q(2)) - d_56 * sin(q(2) - q(4)) - d_789 * sin(q(2) - q(4) - q(6)) 0 d_56 * sin(q(2) - q(4)) + d_789 * sin(q(2) - q(4) + q(6)) 0 d_789 * sin(q(2) - q(4) + q(6)) 0;]
dA =[0 -d_34 * dq(2) * cos(q(2)) - d_56 * (dq(2) - dq(4)) * cos(q(2) - q(4)) - d_789 * (dq(2) - dq(4) + dq(6)) * cos(q(2) - q(4) + q(6)) 0 d_56 * (dq(2) - dq(4)) * cos(q(2) - q(4)) + d_789 * (dq(2) - dq(4) + dq(6)) * cos(q(2) - q(4) + q(6)) 0 d_789 * (dq(2) - dq(4) + dq(6)) * cos(q(2) - q(4) + q(6)) 0;]

z = d_12 + d_34 *cos(q(2)) + d_56 *cos(q(2)-q(4)) + d_789 *cos(q(2)-q(4)+q(6))
% [M, C, g, H, Jg, dJg] = dynamics_iiwa(q,dq);
% 
% 
% lambda = inv(A*inv(M)*A')*(A*inv(M)*(-tau + (C*dq+g) ) - dA*dq)


%% Aufgabe 2.3
lambda_i = 1:length(q_Force);
for i =  1:length(q_Force)


    q = q_Force(1:7,i); % einzelenes eelmeent 
    dq = dq_Force(1:7,i);
    tau = tau_Force(1:7,i);
    A = [0 -d_34 * sin(q(2)) - d_56 * sin(q(2) - q(4)) - d_789 * sin(q(2) - q(4) - q(6)) 0 d_56 * sin(q(2) - q(4)) + d_789 * sin(q(2) - q(4) - q(6)) 0 d_789 * sin(q(2) - q(4) - q(6)) 0;];
    dA =[0 -d_34 * dq(2) * cos(q(2)) - d_56 * (dq(2) - dq(4)) * cos(q(2) - q(4)) - d_789 * (dq(2) - dq(4) - dq(6)) * cos(q(2) - q(4) - q(6)) 0 d_56 * (dq(2) - dq(4)) * cos(q(2) - q(4)) + d_789 * (dq(2) - dq(4) - dq(6)) * cos(q(2) - q(4) - q(6)) 0 d_789 * (dq(2) - dq(4) - dq(6)) * cos(q(2) - q(4) - q(6)) 0;];
        


    [M_i, C_i, g_i, H_i, Jg_i, dJg_i] = dynamics_iiwa(q_Force(1:7,i),dq_Force(1:7,i));
    lambda_i(i) = inv(A*inv(M_i)*A')*(A*inv(M_i)*(-tau + (C_i*dq+g_i) ) - dA*dq);

end

%% 

plot(lambda_i)