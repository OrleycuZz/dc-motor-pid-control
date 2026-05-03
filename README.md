# dcdc-converter-control
This project models and controls a DC-DC converter using Simulink and Simscape.
The objective is to regulate the output voltage despite load variations using a PID controller.

1. System Architecture
DC source
Power stage (converter)
Load
Feedback loop
PID controller
2. Control Strategy

A closed-loop PID controller is used to:

Maintain stable output voltage
Reject disturbances
Improve transient response

3. Results
Stable voltage tracking
Fast response time
Minimal overshoot

(Add plots here)

4. Tools

MATLAB / Simulink
Simscape Electrical
5.  How to Run

Open dcdc_model.slx
Run init_parameters.m
Start simulation

6. Future Improvements

Replacing PID with MPC
Adding efficiency analysis
Implementing HIL simulation


👤 Author

ERRAJI EL MEHDI
