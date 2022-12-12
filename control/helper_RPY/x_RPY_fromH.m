function x = x_RPY_fromH(H)
% INPUT:
% H:    4x4 homogene Transformationsmatrix [R, d; zeros(1,3), 1] von einem
%   	Koordinatensystem K2 nach K1

% OUTPUT:
% x:    Vektor [d; phi_{zyx}(R)] (6x1), wobei phi_{zyx} die Orientierung des 
%       Koordinatensystems K2 relativ zu K1 in RPY-Winkeln beschreibt

R = H(1:3, 1:3);
d = H(1:3, 4);

if 1 - abs(R(3,1)) > 0
    alpha = atan2(R(2,1), R(1,1));
    beta = atan2(-R(3,1), sqrt(R(1,1)^2 +R(2,1)^2));
    gamma = atan2(R(3,2), R(3,3));

elseif 1 - R(3,1) < 0
    alpha = 0;
    beta = pi/2;
    gamma = atan2(R(1,2), R(2,2));

elseif 1 + R(3,1) < 0
    alpha = 0;
    beta = -pi/2;
    gamma = -atan2(R(1,2), R(2,2));

else
    error('no valid angles have been computed')
end

x = [d;alpha;beta;gamma];