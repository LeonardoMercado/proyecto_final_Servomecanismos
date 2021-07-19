% Script para comprobar la parametrización del trébol.

clc;
clear;
close all;

%--------------------------------------------------------------------------
% TREBOLES:
t = 0:0.001:2*pi; % Paso
% Trébol 15 cm a 0°
x1 = (0.075*cos(t)-0.012*cos(5*t));
y1 = (0.075*sin(t)-0.012*sin(5*t));
% Trébol 15 cm a 45°
x1_a = 0.075*cos(t)-0.012*cos(5*t+pi);
y1_a = 0.075*sin(t)-0.012*sin(5*t+pi);
% Trébol 19.5 cm a 0°
x2 = 0.0975*cos(t)-0.0135*cos(5*t);
y2 = 0.0975*sin(t)-0.0135*sin(5*t);
% Trébol 19.5 cm a 45°
x2_a = 0.0975*cos(t)-0.0135*cos(5*t+pi);
y2_a = 0.0975*sin(t)-0.0135*sin(5*t+pi);
%--------------------------------------------------------------------------


%--------------------------------------------------------------------------
% POTLING:
% Trébol 15 cm a 0°
figure(1)
plot(x1,y1,'LineWidth',1.5);
grid on;
title('Trébol 0.15 m a 0°','FontSize',14);
ylabel('Distancia [m]','FontSize',12);
xlabel('Distancia [m]','FontSize',12);
% Trébol 15 cm a 45°
figure(2)
plot(x1_a,y1_a,'LineWidth',1.5);
grid on;
title('Trébol 0.15 m a 45°','FontSize',14);
ylabel('Distancia [m]','FontSize',12);
xlabel('Distancia [m]','FontSize',12);
% Trébol 19.5 cm a 0°
figure(3)
plot(x2,y2,'LineWidth',1.5);
grid on;
title('Trébol 0.195 m a 0°','FontSize',14);
ylabel('Distancia [m]','FontSize',12);
xlabel('Distancia [m]','FontSize',12);
% Trébol 19.5 cm a 45°
figure(4)
plot(x2_a,y2_a,'LineWidth',1.5);
grid on;
title('Trébol 0.195 m a 45°','FontSize',14);
ylabel('Distancia [m]','FontSize',12);
xlabel('Distancia [m]','FontSize',12);
%--------------------------------------------------------------------------