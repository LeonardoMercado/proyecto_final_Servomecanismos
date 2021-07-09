%% Script para generar los parámetros de un motor DC de imanes permanenetes.

clc;
clear;
close all;

%--------------------------------------------------------------------------
J = 1.62e-6;     % kg-m^2
La = 0.58e-3;    % H
Ra = 1.17;       % Ohm
b = 1.34e-6;     % Nm/Rad/s
kt = 0.011;      % Nm/A
kb = 0.011;      % V/Rad/s
tau_e = 0.50e-3; %s
tau_m = 16e-3;   %s
tau_t = 660;     %s
%--------------------------------------------------------------------------