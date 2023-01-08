

clear;
load("contact_force/ContactForceData.mat")


%% Aufgabe 2.2 
% z-0.2 = 0
% df(q)/dq = J_a % Aber wir betrachten nur z Achse => J_g auch ok
% A= Jg(3,:)
% dA = dJg(3,:) % zeitlich Ableitung von Jg = zeitliche Ableitung von A

%% Aufgabe 2.3
lambda_i = 1:length(q_Force);

for i =  1:length(q_Force)

    q = q_Force(1:7,i); % einzelenes Element 
    dq = dq_Force(1:7,i);
    tau = tau_Force(1:7,i);
   
    [M_i, C_i, g_i, H_i, Jg_i, dJg_i] = dynamics_iiwa(q_Force(1:7,i),dq_Force(1:7,i));
    A= Jg_i(3,:);
    dA = dJg_i(3,:);
    %lambda_i(i) = inv(A*inv(M_i)*A')*(A*inv(M_i)*(-tau + (C_i*dq+g_i) ) - dA*dq); % 6.57
    lambda_i(i) = (A*(M_i\(A')))\(A*(M_i\(-tau + (C_i*dq+g_i))) - dA*dq); % 6.57
    
end
plot(time_Force, lambda_i)