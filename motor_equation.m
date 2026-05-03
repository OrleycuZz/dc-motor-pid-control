%  Date    : 2026
%% ========================================

clear; clc; close all;

%% --- Paramètres du moteur ---
R  = 1;      % Résistance d'induit (Ohm)
L  = 0.5;    % Inductance (H)
J  = 0.01;   % Inertie du rotor (kg.m²)
f  = 0.1;    % Coefficient de frottement (N.m.s)
Kt = 0.01;   % Constante de couple (N.m/A)
Ke = 0.01;   % Constante de f.c.e.m (V.s/rad)

%% --- Fonction de transfert du moteur ---
num = Kt;
den = [(L*J), (R*J + L*f), (R*f + Ke*Kt)];

G = tf(num, den);

disp('=== Fonction de transfert du moteur ===');


%% --- Analyse en boucle ouverte ---
figure(1);
step(G);
title('Réponse indicielle en boucle ouverte');
xlabel('Temps (s)'); ylabel('Vitesse (rad/s)');
grid on;

%% --- Synthèse PID (méthode Ziegler-Nichols) ---
% On utilise pidtune pour calculer automatiquement
C = pidtune(G, 'PID');

disp('=== Correcteur PID calculé ===');


Kp = C.Kp;
Ki = C.Ki;
Kd = C.Kd;

fprintf('Kp = %.4f\n', Kp);
fprintf('Ki = %.4f\n', Ki);
fprintf('Kd = %.4f\n', Kd);

%% --- Réponse en boucle fermée avec PID ---
sys_bf = feedback(C * G, 1);

figure(2);
step(sys_bf);
title('Réponse indicielle en boucle fermée (PID)');
xlabel('Temps (s)'); ylabel('Vitesse (rad/s)');
grid on;

%% --- Comparaison BO vs BF ---
figure(3);
hold on;
step(G, 'r--');
step(sys_bf, 'b-');
legend('Boucle ouverte', 'Boucle fermée + PID');
title('Comparaison : sans et avec correcteur PID');
xlabel('Temps (s)'); ylabel('Vitesse (rad/s)');
grid on;

%% --- Performances ---
info = stepinfo(sys_bf);
fprintf('\n=== Performances en BF ===\n');
fprintf('Temps de réponse à 5%% : %.3f s\n', info.SettlingTime);
fprintf('Dépassement            : %.2f %%\n', info.Overshoot);
fprintf('Temps de montée        : %.3f s\n', info.RiseTime);

%% --- Variables pour Simulink ---
% Ces variables sont accessibles depuis le modèle .slx
omega_ref = 100; % Consigne de vitesse (rad/s) ~ 955 RPM
T_sim     = 10;  % Durée de simulation (s)

disp(' ');
disp('✅ Variables chargées. Tu peux ouvrir le modèle Simulink.');