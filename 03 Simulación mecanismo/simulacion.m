%Script para el desarrollo del proyecto final:

clc;
clear;
close all;


%--------------------------------------------------------------------------
% Realizando el trébol
t = 0:0.001:2*pi; % Paso en posición
paso_trebol_normal = 0:0.001744112:10.96; % pasos en tiempo
paso_trebol_expandido = 0:0.002278803:14.32;
trebol = 4;
% trebol 1 = Trébol 15 cm a 0°
% trebol 2 = Trébol 15 cm a 45°
% trebol 3 = Trébol 19.5 cm a 0°
% trebol 4 = Trébol 19.5 cm a 45°

if(trebol == 1)
    x1 = (0.075*cos(t)-0.012*cos(5*t))+0.382;
    y1 = (0.075*sin(t)-0.012*sin(5*t))+0.204;
    paso = paso_trebol_normal;
    paso_unitario = 0.001744112;
    texto = "Trébol 15 cm a 0°";
elseif(trebol == 2)
    x1 = 0.075*cos(t)-0.012*cos(5*t+pi)+0.382;
    y1 = 0.075*sin(t)-0.012*sin(5*t+pi)+0.204;
    paso = paso_trebol_normal;
    paso_unitario = 0.001744112;
    texto = "Trébol 15 cm a 45°";
elseif(trebol == 3)
    x1 = 0.0975*cos(t)-0.0135*cos(5*t)+0.382;
    y1 = 0.0975*sin(t)-0.0135*sin(5*t)+0.204;
    paso = paso_trebol_expandido;
    paso_unitario = 0.002278803;
    texto = "Trébol 19.5 cm a 0°";
elseif(trebol == 4)
    x1 = 0.0975*cos(t)-0.0135*cos(5*t+pi)+0.382;
    y1 = 0.0975*sin(t)-0.0135*sin(5*t+pi)+0.204;
    paso = paso_trebol_expandido;
    paso_unitario = 0.002278803;
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
x_aux_1 = x1(1:end/2);
x_aux_2 = x1(end/2:end);
x_aux_1 = fliplr(x_aux_1);
x_aux_2 = fliplr(x_aux_2);
x = [x_aux_1 x_aux_2];
%-------------------------
y_aux_1 = y1(1:end/2);
y_aux_2 = y1(end/2:end);
y_aux_1 = fliplr(y_aux_1);
y_aux_2 = fliplr(y_aux_2);
y = [y_aux_1 y_aux_2];

% Espacio articular:
i = length(x);
t_q1 = zeros(i,1);
t_q2 = zeros(i,1);
for c = 1:length(x)
    % Movimiento articular:
    [t_q1(c),t_q2(c)] = hallar_sol(x(c),y(c),l1,l2,1);
end
% Observando la trayectoria cada 100 pasos:
for c = 1:100:length(x)
    mecanismo.plot([t_q1(c) t_q2(c)]); 
end
%% Sacando las curvas:

% Articulación q1:
figure(2)
plot(paso,t_q1,'r','LineWidth',1.5);
grid on;
title("\theta_{1} vs tiempo",'FontSize',14);
xlabel("Tiempo [s]",'FontSize',12);
ylabel("\theta_{1} [rad]",'FontSize',12);
axis([paso(1) paso(end) min(t_q1) max(t_q1)])

% Articulación q2:
figure(3)
plot(paso,t_q2,'b','LineWidth',1.5);
grid on;
title("\theta_{2} vs tiempo",'FontSize',14);
xlabel("Tiempo [s]",'FontSize',12);
ylabel("\theta_{2} [rad]",'FontSize',12);
axis([paso(1) paso(end) min(t_q2) max(t_q2)])

% Articulaciones:
figure(4)
plot(paso,t_q2,'b','LineWidth',1.5);
hold on;
plot(paso,t_q1,'r','LineWidth',1.5);
grid on;
title("\theta vs tiempo",'FontSize',14);
xlabel("Tiempo [s]",'FontSize',12);
ylabel("\theta [rad]",'FontSize',12);
legend('\theta_{2}','\theta_{1}');
xlim([paso(1) paso(end)])

%% Derivando

% Velocidad angular articulación 1: 
omega_q1 = diff(t_q1)/paso_unitario;
omega_q1(3142) = -0.2522;
figure(5)
plot(paso(1:end-1),omega_q1,'b','LineWidth',1.5);
grid on;
title("\omega_{1} vs tiempo",'FontSize',14);
xlabel("Tiempo [s]",'FontSize',12);
ylabel("\omega [rad/s]",'FontSize',12);
xlim([paso(1) paso(end-1)])

% Velocidad angular articulación 2: 
omega_q2 = diff(t_q2)/paso_unitario;
omega_q2(3142) = 0.2012;
figure(6)
plot(paso(1:end-1),omega_q2,'b','LineWidth',1.5);
grid on;
title("\omega_{2} vs tiempo",'FontSize',14);
xlabel("Tiempo [s]",'FontSize',12);
ylabel("\omega [rad/s]",'FontSize',12);
xlim([paso(1) paso(end-1)])

% Aceleración angular articulación 1: 
alfa_q1 = diff(omega_q1)/paso_unitario;
alfa_q1(3141) = -0.2511;
figure(7)
plot(paso(1:end-2),alfa_q1,'b','LineWidth',1.5);
grid on;
title("\alpha_{1} vs tiempo",'FontSize',14);
xlabel("Tiempo [s]",'FontSize',12);
ylabel("\alpha [rad/s^2]",'FontSize',12);
xlim([paso(1) paso(end-2)])


% Aceleración angular articulación 2: 
alfa_q2 = diff(omega_q2)/paso_unitario;
alfa_q2(3141) = 0.4646;
alfa_q2(3142) = 0.4642;
figure(8)
plot(paso(1:end-2),alfa_q2,'b','LineWidth',1.5);
grid on;
title("\alpha_{2} vs tiempo",'FontSize',14);
xlabel("Tiempo [s]",'FontSize',12);
ylabel("\alpha [rad/s^2]",'FontSize',12);
xlim([paso(1) paso(end-2)])

% Sobre Aceleración angular articulación 1: 
% jerk_q1 = diff(alfa_q1)/paso_unitario;
% jerk_q1(3139) = -0.923;
% jerk_q1(3140) = -0.926;
% jerk_q1(3141) = -0.929;
% figure(9)
% plot(paso(1:end-3),jerk_q1,'b','LineWidth',1.5);
% grid on;
% title("jerk 1 vs tiempo",'FontSize',14);
% xlabel("Tiempo [s]",'FontSize',12);
% ylabel("jerk [rad/s^3]",'FontSize',12);
% xlim([paso(1) paso(end-3)]);
% 
% % Sobre Aceleración angular articulación 2: 
% jerk_q2 = diff(alfa_q2)/paso_unitario;
% figure(10)
% plot(paso(1:end-3),jerk_q2,'b','LineWidth',1.5);
% grid on;
% title("jerk 2 vs tiempo",'FontSize',14);
% xlabel("Tiempo [s]",'FontSize',12);
% ylabel("jerk [rad/s^3]",'FontSize',12);
% xlim([paso(1) paso(end-3)]);

%% Torques:

j1 = 0.00024769; % kg m^2
j2 = 0.00034068; % kg m^2

% Torque inerciales q1:
figure(11)
torque_inercial_q1 = j1*alfa_q1;
plot(paso(1:end-2),torque_inercial_q1,'b','LineWidth',1.5);
grid on;
title("\tau_{inercial1} vs tiempo",'FontSize',14);
xlabel("Tiempo [s]",'FontSize',12);
ylabel("\tau [Nm]",'FontSize',12);
xlim([paso(1) paso(end-2)])


% Torque inercial q2:
figure(12)
torque_inercial_q2 = j2*alfa_q2;
plot(paso(1:end-2),torque_inercial_q2,'b','LineWidth',1.5);
grid on;
title("\tau_{inercial2} vs tiempo",'FontSize',14);
xlabel("Tiempo [s]",'FontSize',12);
ylabel("\tau [Nm]",'FontSize',12);
xlim([paso(1) paso(end-2)])

% Torques de fricción q1 y q2:
torque_friccion_q1 = ones(length(torque_inercial_q1),1)*max(torque_inercial_q1)*0.01;
torque_friccion_q2 = ones(length(torque_inercial_q2),1)*max(torque_inercial_q2)*0.01;

% Torque Gravitacional:
m1 = 0.01342415; % kg
m2 = 0.00788560; % kg
torque_g_q1 = ones(length(torque_inercial_q1),1)*(l1/2)*(m1*9.81);
torque_g_q2 = ones(length(torque_inercial_q2),1)*(l2/2)*(m2*9.81);


% Toque total: Torque inercial + Torque de Fricción + Torque gravitacional:
torque_q1 = torque_inercial_q1+torque_friccion_q1+torque_g_q1;
torque_q2 = torque_inercial_q2+torque_friccion_q2+torque_g_q2;

figure(13)
plot(paso(1:end-2),torque_q1,'r','LineWidth',1.5);
grid on;
title("\tau_{1} vs tiempo",'FontSize',14);
xlabel("Tiempo [s]",'FontSize',12);
ylabel("\tau [Nm]",'FontSize',12);
xlim([paso(1) paso(end-2)])

figure(14)
plot(paso(1:end-2),torque_q2,'r','LineWidth',1.5);
grid on;
title("\tau_{2} vs tiempo",'FontSize',14);
xlabel("Tiempo [s]",'FontSize',12);
ylabel("\tau [Nm]",'FontSize',12);
xlim([paso(1) paso(end-2)])

disp("El torque q1 máximo es: ");
disp(max(torque_q1));
disp("El torque RMS q1 es: ");
disp(rms(torque_q1))
disp("--------------------------------------");
disp("El torque q2 máximo es: ");
disp(max(torque_q2));
disp("El torque RMS q2 es: ");
disp(rms(torque_q2));


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