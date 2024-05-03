%% Formatting
% colordef white;

% Plot with default font size 16+
% Linewidth of 2 or 3
set(0,'defaultAxesFontName', 'Arial');
set(0,'defaultTextFontName', 'Arial');
set(0,'defaultAxesFontWeight', 'Bold');
set(0,'defaultTextFontWeight', 'Bold');
set(0, 'DefaultTextFontSize', 8) ;
set(0, 'DefaultAxesFontSize', 10) ;
set(0, 'DefaultLineLineWidth', 1) ;
set(0, 'DefaultStairLineWidth', 3.5) ;
set(0, 'DefaultAxesLineWidth', 2.5) ;
set(0, 'DefaultPatchLineWidth', 2) ;
set(0, 'DefaultAxesXGrid', 'on') ;
set(0, 'DefaultAxesYGrid', 'on') ;
set(0, 'DefaultAxesBox', 'on') ;
set(0, 'DefaultFigurePosition', [200 175 1000 600]);

%% Plotting
% modified the directory of the .txt file as needed
filename = '/MATLAB Drive/LDO_LineReg_MaxLoadCurrent.csv';
data = readmatrix(filename);

time = data(:,1);
vout = data(:,2);

% plotting the required plots in 2 by 2 grid using subplot 
plot(time, vout)

xlabel('Time (s)')
ylabel('Vout (V)')
% ylim([-90, 1])

title('Line Regulation Response - 10mA Load Current')
hold on

hold off