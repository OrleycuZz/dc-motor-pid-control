%  Projet Simscape : Moteur DC Physique
%% ========================================

clear; clc; close all;

%% --- Paramètres du moteur ---
R  = 1;      % Résistance d'induit (Ohm)
L  = 0.5;    % Inductance (H)
J  = 0.01;   % Inertie du rotor (kg.m²)
b  = 0.1;    % Frottement visqueux (N.m.s/rad)
Kt = 0.01;   % Constante de couple (N.m/A)
Ke = 0.01;   % Constante de f.c.e.m (V.s/rad)

%% --- Consigne ---
omega_ref = 100;   % Vitesse de consigne (rad/s)
V_alim    = 24;    % Tension d'alimentation max (V)
T_sim     = 5;     % Durée simulation (s)

%% --- PID 
Kp = 19.4748;
Ki = 53.0041;
Kd = 1.5700;

disp('✅ Paramètres chargés.');
fprintf('Kp=%.4f | Ki=%.4f | Kd=%.4f\n', Kp, Ki, Kd);