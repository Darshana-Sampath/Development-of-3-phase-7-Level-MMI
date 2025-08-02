%% Initialization
clear;
clc;

%% specification

V_L = 400; % desired RMS voltage
f = 50;     % Fundamental Frequency
N = 7; % Number of level in MMC
Vd = 125; % voltage for switching module
V_dc = 125 * (N - 1); % Input DC Voltage
fs = 5000; % switching frequency (sampling frequency)
Ts = 1/fs;
%% Transform matrix

A = [1 0 0.5; cos(2*pi/3) sin(2*pi/3) 0.5; cos(4*pi/3) sin(4*pi/3) 0.5]; % Transform matrix
B = [cos(0) cos(2*pi/3) cos(4*pi/3); sin(0) sin(2*pi/3) sin(4*pi/3)];

%% Model Parameter
corner_vec = zeros(fs/f,10);
dwell_time = zeros(fs/f,5);

%% Calculations

r_k = sqrt(6)*V_L / 2;
for k = 0:fs/f - 1

    tita_k = 360*f*k/fs
    x = [r_k*cos(deg2rad(tita_k)); r_k*sin(deg2rad(tita_k)); 0];
    V_pole = (2/3)*A*x;
    Vnor = V_pole' / Vd;
    corner_vec(k+1,1) = k*Ts;
    dwell_time(k+1,1) = k*Ts;
    % conor vector calculation

    CV = Vnor +3;
    CV_1 = floor(CV);
    error = CV - floor(CV);
    [~,i_1] = max(error); % ~ represent the magnitude but ~ neglecte it; i is the index(position), In for loop we can find the magnitude and index
    CV_2 = CV_1;
    CV_2(i_1) = CV_2(i_1) + 1;
    error(i_1) = 0;

    [~,i_2] = max(error); % i think max function is not nessaccery , we can you only error
    CV_3 = CV_2;
    CV_3(i_2) = CV_3(i_2) + 1;
    CV_M = [CV_1; CV_2; CV_3]
    CV_M_ = [CV_1' CV_2' CV_3']

    temp = [Vd*B*CV_M_; 1 1 1];% first find the Vd*B*CV_M matrix and then add the 1 1 1 row to it.
    Y = Ts*[r_k*cos(deg2rad(tita_k));r_k*sin(deg2rad(tita_k)); 1];
    T = abs(temp\Y);
           
    corner_vec(k+1,2:end) = reshape(CV_M, 1, []);
    dwell_time(k+1,2:4) = T;
    dwell_time(k+1,end) = sum(T);
end
disp(corner_vec);