load('FoPra1_Trail03.mat');
load('Spiro_volume_value.mat')
% Example combinedMatrix
combinedMatrix = cat(3,P_0_00, P_1_02, P_1_03, P_1_06, P_1_07, P_1_08, P_1_09, P_1_10, P_1_13, P_1_14, P_2_00, P_2_01, P_2_02, P_2_03, P_2_04, P_2_06, P_2_07, P_2_08, P_2_09, P_2_10, P_2_12, P_2_13, P_2_14, P_2_15, P_3_00, P_3_01, P_3_02, P_3_03, P_3_05, P_3_06, P_3_07, P_3_08, P_3_09, P_3_10, P_3_11, P_3_13, P_3_14, P_3_15, ...
    P_4_00, P_4_01, P_4_02, P_4_03, P_4_04, P_4_05, P_4_06, P_4_07, P_4_08, P_4_09, P_4_10, P_4_11, P_4_12, P_4_13, P_4_14, P_4_15, P_5_00, P_5_01, P_5_02, P_5_03, P_5_04, P_5_05, P_5_06, P_5_07, P_5_08, P_5_09, P_5_10, P_5_11, P_5_12, P_5_13, P_5_14, P_5_15, ...
    P_6_00, P_6_01, P_6_02, P_6_03, P_6_04, P_6_05, P_6_06, P_6_07, P_6_08, P_6_09, P_6_10, P_6_11, P_6_12, P_6_13, P_6_14, P_6_15, P_7_00, P_7_01, P_7_02, P_7_03, P_7_04, P_7_05, P_7_06, P_7_07, P_7_08, P_7_09, P_7_10, P_7_11, P_7_12, P_7_13, P_7_14, P_7_15);

% pointCloud=zeros(3,102);
% 
% for i=1:102
%     pointCloud(:,i)=combinedMatrix(:,2,i);
% end
vol=[];
for j=1:size(combinedMatrix,2)

x=[];
y=[];
z=[];

for i=1:102
    x(end+1)=combinedMatrix(1,j,i);
    y(end+1)=combinedMatrix(2,j,i);
    z(end+1)=combinedMatrix(3,j,i);
end

% Set the alpha parameter for the shape
alpha = 250;  % Adjust this value as per your requirements

% Create the alpha shape
shape = alphaShape(x',y',z', alpha);

% Visualize the shape
% figure;
% plot(shape);
% axis equal;
% Finding the volume
totalvolume=volume(shape);


%xcorr

%filtfilt


vol(end+1)=totalvolume/1000000; % Changing to litre
end
figure;
plot(vol);
%vicon
% time = 0:size(combinedMatrix,2)-1;
% time = time/40;
% vicon_vol_dt = detrend(vol);
% 
% d1 = designfilt('lowpassiir','FilterOrder',12, ...
%     'HalfPowerFrequency',0.15,'DesignMethod','butter');
% vicon_f_vol = filtfilt(d1,vicon_vol_dt);


% %spiro
% time1 = 0:size(Volume1,1)-1;
% time1 = time1/200;
% spiro_vol_dt = detrend(Volume1(:,1));
% 
% d2 = designfilt('lowpassiir','FilterOrder',12, ...
%     'HalfPowerFrequency',0.15,'DesignMethod','butter');
% spiro_f_vol = filtfilt(d2,spiro_vol_dt);
% 
% 
% [max_SP, maxIndex_SP] = findpeaks(spiro_f_vol','MinPeakDistance',500);
% [min_SP, minimaIndices_SP] = findpeaks(-spiro_f_vol', 'MinPeakDistance',500);
% tidal_volume_SP = max_SP(1:53) + min_SP(2:54);

% VICON  tidal volume

% [maxValue_VI, maxIndex_VI] = findpeaks(vicon_f_vol','MinPeakDistance',100);
% [minimaValues_VI, minimaIndices_VI] = findpeaks(-vicon_f_vol', 'MinPeakDistance',100);
% tidal_volume_VI = maxValue_VI + minimaValues_VI;

% plot tidal volume
% figure(3);
% plot(time,vicon_f_vol,'b-');
% xlabel('Time[s]');
% ylabel('Volume[L]');
% hold on;
% plot(time1,spiro_f_vol,'r');
% xlabel('time[s]');
% ylabel('volume[L]');
% legend('spiro');
% grid on;
% hold on;
% % plot(maxIndex_VI/40,maxValue_VI,'k:+');
% % plot(minimaIndices_VI/40,-minimaValues_VI,'c:+');
% % 
% plot(maxIndex_SP/200,max_SP,'k:o');
% plot(minimaIndices_SP/200,-min_SP,'c:o');
% % 
% x=linspace(0,180,53);
% plot(x,tidal_volume_SP,'k-+');

% plot(maxIndex_VI/40,tidal_volume_VI);


% laging..
% lagged_signal_spiro_f_vol = circshift(spiro_f_vol,lag);

% lagged_signal_spiro_f_vol = zeros(1,size(spiro_f_vol,1));
% for t = 1:length(spiro_f_vol)
%     if t > lag
%         lagged_signal_spiro_f_vol(t) = spiro_f_vol(t - lag);
%     end
% end
% 

% cut the signal 
%% EIT
% % Loading EIT Bin Files
% 
% [fname_get,pname_get]=uigetfile('*.bin','Open data file');
%       
% if fname_get==0
%   return
% end
% CurrentPath=pname_get;
% fullname_get=fullfile(pname_get,fname_get);
% 
% fid=fopen(fullname_get,'r');
%     getarray=fread(fid, [1 inf],'int8');
%     fclose(fid);
%     len=length(getarray);
%     frame_length=len/4358;
%     frame=zeros(1024,frame_length);
%     fid=fopen(fullname_get,'r');
%     for i=1:frame_length      
%         time_stamp=fread(fid, [1 2],'float32');  %read time stamp
%         dummy=fread(fid, [1],'float32');   %read dummy
%         frame(:,i)=fread(fid, [1 1024],'float32');%read pixel values for each frame
%         int_value=fread(fid, [1 2],'int32');  %read MinMax, Event Marker, 
%         EventText=fread(fid,[1 30],'int8'); 
%         int_Time=fread(fid, [1 ],'int32'); %Timing Error
%         Medibus=fread(fid, [1 52],'float32');
%     end
%         fclose(fid);
%         
% SumImpedance=sum(frame);
% Eit_dt = detrend(SumImpedance);


%% PLOTING THE SIGNAL
% figure(3);
% subplot(2,1,1);
% plot(time,vicon_f_vol,'b-');
% xlabel('Time[s]');
% ylabel('Volume[L]');
% hold on;
% plot(time1,spiro_f_vol,'r');
% xlabel('time[s]');
% ylabel('volume[L]');
% legend('vicon','spiro');
% grid on;
% hold on;

%cutting the signal...

% vicon_f_vol = vicon_f_vol(time>=2.685);
% spiro_f_vol = spiro_f_vol(1:5:end)';
% Eit_f = Eit_dt(time>=3.850);
% 
% bb = min(size(vicon_f_vol,2),size(spiro_f_vol,2));
% m = min(bb,size(Eit_f,2));
% vicon_f_vol = vicon_f_vol(1:m);
% spiro_f_vol = spiro_f_vol(1:m);
% Eit_f = Eit_f(1:m);
% 
% time = time(1:m); % unique time
% figure(3);
% % subplot(2,1,2);
% plot(time,vicon_f_vol,'b-');
% xlabel('Time[s]');
% ylabel('Volume[L]');
% hold on;
% plot(time,spiro_f_vol,'r');
% xlabel('time[s]');
% ylabel('volume[L]');
% legend('vicon','spiro');
% hold on;
% plot(time,Eit_f/10000,'k-');
% grid on;

