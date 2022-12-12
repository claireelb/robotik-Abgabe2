function dT = dT_RPY(x, dx)
% INPUT:
% x:    [d; phi_{zyx}] (6x1), wobei d die translatorische Verschiebung von 
%       einem Koordinatensystem K1 nach K2 angegeben in K1 und phi_{zyx} 
%       die Orientierung in RPY-Winkeln ist
% dx:   Zeitableitung von x

% OUTPUT:
% dT:   Zeitableitung von T (6x6 Transformationsmatrix, sodass gilt: [dd;
%                           omega] = T*x)

    phi = x(4);
    dphi = dx(4);

    theta = x(5);
    dtheta = dx(5);

    dT_3 = [0, -dphi*cos(phi), -dphi*sin(phi)*cos(theta)-dtheta*cos(phi)*sin(theta);
          0, -dphi*sin(phi),  dphi*cos(phi)*cos(theta)-dtheta*sin(phi)*sin(theta);
          0, 0             , -dtheta*cos(theta)];

    dT = blkdiag(zeros(3,3), dT_3);

end