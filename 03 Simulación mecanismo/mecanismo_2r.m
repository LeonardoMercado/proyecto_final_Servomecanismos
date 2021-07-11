%% Script para simular un mecanismo 2R

clc;
clear;
close all;

%--------------------------------------------------------------------------
% Parámetros
l1 = 1;
l2 = 1;

syms q1 q2
%--------------------------------------------------------------------------


%--------------------------------------------------------------------------
% Cinematica inversa: 
x = l2*cos(q1+q2) + l1*cos(q1);
y = l2*sin(q1+q2) + l1*sin(q1);
%--------------------------------------------------------------------------

%%
mdl_planar2
p2.teach

%%
p2.plot([0 pi/2])

%%
L(1) = Link('revolute','alpha', 0,    'a',0 ,   'd',0,  'offset', 0,   'modified', 'qlim',[-pi pi]);
L(2) = Link('revolute','alpha', 0,    'a',l1,   'd',0,  'offset', 0,   'modified', 'qlim',[-pi pi]);
mecanismo = SerialLink(L,'name','mecanismo');
mecanismo.tool = [0 0 1 l2;
                  1 0 0 0;
                  0 1 0 0;
                  0 0 0 1];

