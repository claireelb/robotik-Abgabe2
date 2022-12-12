function T = T_RPY(x)
% INPUT:
% x:    [d; phi_{zyx}] (6x1), wobei d die translatorische Verschiebung von 
%       einem Koordinatensystem K1 nach K2 angegeben in K1 und phi_{zyx} 
%       die Orientierung in RPY-Winkeln ist

% OUTPUT:
% T:    6x6 Transformationsmatrix, sodass gilt: [dd; omega] = T*x (omega
%       bezeichnet die die relative Winkelgeschwindigkeit von K2 gegenüber 
%       K1)

    phi = x(4);
    theta = x(5);

    T_3 = [0, -sin(phi), cos(phi)*cos(theta);
         0,  cos(phi), sin(phi)*cos(theta);
         1,  0       , -sin(theta)];
    T= blkdiag (eye(3), T_3);

end