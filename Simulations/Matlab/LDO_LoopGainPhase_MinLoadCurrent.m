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
set(0, 'DefaultLineLineWidth', 3.5) ;
set(0, 'DefaultStairLineWidth', 3.5) ;
set(0, 'DefaultAxesLineWidth', 2.5) ;
set(0, 'DefaultPatchLineWidth', 2) ;
set(0, 'DefaultAxesXGrid', 'on') ;
set(0, 'DefaultAxesYGrid', 'on') ;
set(0, 'DefaultAxesBox', 'on') ;
set(0, 'DefaultFigurePosition', [200 175 1000 600]);

%% Plotting
% modified the directory of the .txt file as needed
filename = '/MATLAB Drive/LDO_LoopGainPhase_MinLoadCurrent.csv';
data = readmatrix(filename);

freq = data(:,1);
gain = data(:,2);

% Calculating 3db Point
[Max_gain,index1]=max(gain);
freq_max=freq(index1);
Gain_3db=Max_gain-3;

idxr = find(diff(sign(gain-Gain_3db)))+(-1:1);                   % Matrix Of Index Ranges

for k = 1:size(idxr,1)
    freq_3db(k) = interp1(gain(idxr(k,:)),freq(idxr(k,:)),Gain_3db);
end

% plotting the required plots in 2 by 2 grid using subplot 
semilogx(freq, gain)

hold on
hp3 = plot(3981071.705534980, 62.4, '.','MarkerSize',20);
hold off

hold on
str = {'\leftarrow Phase Margin: 62.4 deg'};
text(3981071 + 100000, 62.4, str, 'Color','red')
hold off

xlabel('Frequency (Hz)')
ylabel('Phase (degrees)')
title('Phase - 0.1 mA Load Current')
hold on

hold off

%legend('Current through transistor')
