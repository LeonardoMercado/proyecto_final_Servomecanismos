%% Script para simular un mecanismo 2R

clc;
clear;
%close all;

%--------------------------------------------------------------------------
% Parámetros
l1 = 0.240;
l2 = 0.364;

syms q1 q2
%--------------------------------------------------------------------------


%--------------------------------------------------------------------------
% Cinematica Directa: 
x = l2*cos(q1+q2) + l1*cos(q1);
y = l2*sin(q1+q2) + l1*sin(q1);
%--------------------------------------------------------------------------

%%
L(1) = Link('revolute','alpha', 0,    'a',0 ,   'd',0,  'offset', 0,   'modified', 'qlim',[-pi pi]);
L(2) = Link('revolute','alpha', 0,    'a',l1,   'd',0,  'offset', 0,   'modified', 'qlim',[-pi pi]);
mecanismo = SerialLink(L,'name','mecanismo');
mecanismo.tool = [0 0 1 l2;
                  1 0 0 0;
                  0 1 0 0;
                  0 0 0 1];
mecanismo.plot([-0.2 0.3]);

%%
[q1,q2] = hallar_sol(1.810,0,1,1,1);

disp("El angulo theta_1 es de:")
disp(rad2deg(q1))
disp("El angulo theta_2 es de:")
disp(rad2deg(q2))

%% Versión presentación del mecanismo:
L(1) = Link('revolute','alpha', 0,    'a',0 ,   'd',0,  'offset', 0,   'modified', 'qlim',[-pi pi]);
L(2) = Link('revolute','alpha', 0,    'a',l1,   'd',0,  'offset', 0,   'modified', 'qlim',[-pi pi]);
mecanismo = SerialLink(L,'name','mecanismo');
mecanismo.tool = [0 0 1 l2;
                  1 0 0 0;
                  0 1 0 0;
                  0 0 0 1];
mecanismo.teach;              



%%
function [q1,q2] = hallar_sol(x,y,l1,l2,codo)
% Función para hallar la posición angular que debe adoptar el mecanismo
% para alcanzar una posición dada.

if(codo)
    disp("Entramos en codo Abajo");
    q2 = acos(((x^2) + (y^2) - (l1^2) - (l2^2))/(2*l1*l2));
    q1 = atan2(y,x) - atan2((l2*sin(q2)),(l1+l2*cos(q2)));
else
    disp("Entramos en codo arriba");
    q2 = -1*acos(((x^2) + (y^2) - (l1^2) - (l2^2))/(2*l1*l2));
    q1 = atan2(y,x) - atan2((l2*sin(q2)),(l1+l2*cos(q2)));
end
end
