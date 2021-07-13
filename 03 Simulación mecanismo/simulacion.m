%Script para el desarrollo del proyecto final:

clc;
clear;
close all;


%--------------------------------------------------------------------------
% Realizando el trébol:
t = 0:0.001:2*pi; % Paso
trebol = 4;
% trebol 1 = Trébol 15 cm a 0°
% trebol 2 = Trébol 15 cm a 45°
% trebol 3 = Trébol 19.5 cm a 0°
% trebol 4 = Trébol 19.5 cm a 45°

if(trebol == 1)
    x1 = (0.075*cos(t)-0.012*cos(5*t))+0.382;
    y1 = (0.075*sin(t)-0.012*sin(5*t))+0.204;
    texto = "Trébol 15 cm a 0°";
elseif(trebol == 2)
    x1 = 0.075*cos(t)-0.012*cos(5*t+pi)+0.382;
    y1 = 0.075*sin(t)-0.012*sin(5*t+pi)+0.204;
    texto = "Trébol 15 cm a 45°";
elseif(trebol == 3)
    x1 = 0.0975*cos(t)-0.0135*cos(5*t)+0.382;
    y1 = 0.0975*sin(t)-0.0135*sin(5*t)+0.204;
    texto = "Trébol 19.5 cm a 0°";
elseif(trebol == 4)
    x1 = 0.0975*cos(t)-0.0135*cos(5*t+pi)+0.382;
    y1 = 0.0975*sin(t)-0.0135*sin(5*t+pi)+0.204;
    texto = "Trébol 19.5 cm a 45°";
else
    msgbox("No selecciono ningun trébol.","Error","error")
end
figure(1)
plot(x1,y1,'LineWidth',1.5);
grid on;
title(texto,'FontSize',14);

%--------------------------------------------------------------------------
% Parámetros mecanismo
l1 = 0.240;
l2 = 0.364;

syms q1 q2
%--------------------------------------------------------------------------

L(1) = Link('revolute','alpha', 0,    'a',0 ,   'd',0,  'offset', 0,   'modified', 'qlim',[-pi pi]);
L(2) = Link('revolute','alpha', 0,    'a',l1,   'd',0,  'offset', 0,   'modified', 'qlim',[-pi pi]);
mecanismo = SerialLink(L,'name','mecanismo');
mecanismo.tool = [0 0 1 l2;
                  1 0 0 0;
                  0 1 0 0;
                  0 0 0 1];
home = [deg2rad(-45) deg2rad(135)];
mecanismo.plot(home);
ylabel('Distancia [m]','FontSize',12);
xlabel('Distancia [m]','FontSize',12);
%--------------------------------------------------------------------------

%% Trayectoria inicial Home to start:
[posicion_arranque_x,posicion_arranque_y] = hallar_sol(x1(end/2),y1(end/2),l1,l2,1);
tg = jtraj(home,[posicion_arranque_x posicion_arranque_y],7);
mecanismo.plot(tg);

%% Trayectoria del trebol:
x_aux_1 = x1(1:end/2-1);
x_aux_2 = x1(end/2:end);
x_aux_1 = fliplr(x_aux_1);
x_aux_2 = fliplr(x_aux_2);
x = [x_aux_1 x_aux_2];
%-------------------------
y_aux_1 = y1(1:end/2-1);
y_aux_2 = y1(end/2:end);
y_aux_1 = fliplr(y_aux_1);
y_aux_2 = fliplr(y_aux_2);
y = [y_aux_1 y_aux_2];

% Espacio articular:
i = length(x);
t_q1 = zeros(i,1);
t_q2 = zeros(i,1);
for c = 1:length(x)
    [t_q1(c),t_q2(c)] = hallar_sol(x(c),y(c),l1,l2,1);
    mecanismo.plot([t_q1(c) t_q2(c)])    
end
%%
tg = jtraj([posicion_arranque_x posicion_arranque_y],[t_q1(1) t_q2(1)],2);
mecanismo.plot(tg)
for c = 2:length(x)
    tg = jtraj([tg(end,end-1) tg(end,end-1)],[t_q1(c) t_q2(c)],2);
end

%%

mecanismo.plot([t_q1(3000) t_q2(3000)])



%%
function [q1,q2] = hallar_sol(x,y,l1,l2,codo)
% Función para hallar la posición angular que debe adoptar el mecanismo
% para alcanzar una posición dada.

if(codo)
    %disp("Entramos en codo Abajo");
    q2 = acos(((x^2) + (y^2) - (l1^2) - (l2^2))/(2*l1*l2));
    q1 = atan2(y,x) - atan2((l2*sin(q2)),(l1+l2*cos(q2)));
else
    %disp("Entramos en codo arriba");
    q2 = -1*acos(((x^2) + (y^2) - (l1^2) - (l2^2))/(2*l1*l2));
    q1 = atan2(y,x) - atan2((l2*sin(q2)),(l1+l2*cos(q2)));
end
end