clear all; close all;
R = readmatrix('SD_rainfall.dat');
T = readmatrix('SD_temperature.dat');

R1 = R(:, 2:end);
R = R1(:);

T1 = T(:, 2:end);
T = T1(:);

histogram(R, 'Normalization', 'probability', 'BinWidth', 0.1);

C = T(T < 55);

W = R(R >= 1);

PW = size(W,1)/size(R,1);

PC = size(C,1)/size(T,1);

Ci = (T1 < 55);

Ri = (R1 >= 1);

i = Ci & Ri;

i = i(:);

PW_C = sum(i)/size(C,1);

PC_W = sum(i)/size(W,1)
