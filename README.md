# DC motor PID control
DC Motor speed control using PID MATLAB Transfer Function 
& Simscape physical model | MATLAB R2024b

⚙️ System Parameters

R = 1; % Armature resistance (Ohms)
L = 0.5; % Inductance (H)
J = 0.01; % Rotor inertia (kg.m²)
b = 0.1; % Viscous friction (N.m.s/rad)
Kt = 0.01; % Torque constant (N.m/A)
Ke = 0.01; % Back EMF constant (V.s/rad)

%% --- Setpoint ---

omega_ref = 100; % Setpoint speed (rad/s)
V_alim = 24; % Maximum supply voltage (V)
T_sim = 5; % Simulation time (s)

%% --- PID (Tuning parameteres or simulating without simscpae) ---
Kp = 19.4748;
Ki = 53.0041;
Kd = 1.5700;


⚙️ How to Run

run dcdcwithsimspace.m
Run Motor_simscape.slx
and start the simulation

⚙️ Results

<img width="1117" height="565" alt="image" src="https://github.com/user-attachments/assets/74368c10-22ce-4f13-8c04-6d446d946467" />

<img width="831" height="748" alt="image" src="https://github.com/user-attachments/assets/3bef9f8b-7ade-4ffd-a969-ec320327e570" />




👤 Author

ERRAJI EL MEHDI
https://www.linkedin.com/in/el-mehdi-erraji-7834a4195/
