

figure(1);
% subplot(2,2,1);
time1 = 0:size(Volume1,1)-1;
time1 = time1/200;
plot(time1,Volume1(:,1));
xlabel('time');
ylabel('volume1');

% subplot(2,2,2);
% plot(Volume2(:,2),Volume2(:,1));
% xlabel('time');
% ylabel('volume2');
% 
% subplot(2,2,3);
% plot(Volume3(:,2),Volume3(:,1));
% xlabel('time');
% ylabel('volume3');
% 
% subplot(2,2,4);
% plot(Volume4(:,2),Volume4(:,1));
% xlabel('time');
% ylabel('volume4');



