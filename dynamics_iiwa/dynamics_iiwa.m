function [M, C, g, H, Jg, dJg] = dynamics_iiwa(q,dq)

% Wählen Sie die korrekte Dynamikfunktion aus

% [M, C, g, H, Jg, dJg] = dynamics_iiwa_1(q, dq);
% [M, C, g, H, Jg, dJg] = dynamics_iiwa_2(q, dq);
% [M, C, g, H, Jg, dJg] = dynamics_iiwa_3(q, dq);
[M, C, g, H, Jg, dJg] = dynamics_iiwa_4(q, dq);
% [M, C, g, H, Jg, dJg] = dynamics_iiwa_5(q, dq);

end