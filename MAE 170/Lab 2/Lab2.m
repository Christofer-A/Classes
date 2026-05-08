clear;
s = serialport("COM3", 9600);
pause(4);
writeline(s,'0');
% Same as arduino

d = readline(s);
num_d = str2num(d);
