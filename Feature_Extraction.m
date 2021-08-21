%% LUNG TUMOR DETECTION ON SINGLE IMAGE - AUTHOR: CHRISTOS KORGIALAS

% FEATURES

close all
clear all
clc

X1 = imread('lungTexp1_rec1800','bmp');
figure; imshow(X1);
title('Tumor Picture');
impixelinfo;

% TUMOR
% % X1(1601:1700,701:800)=255;    %% 8836
% % X1(901:1000,1501:1600)=255;   %% 8836
% % X1(1081:1160,1161:1240)=255;  %% 5476
  
% HEALTHY
% % X1(601:700,901:1000)=255;     %% 8836
% % X1(1201:1300,1601:1700)=255;  %% 8836
% % X1(1601:1680,1801:1880)=255;  %% 5476

figure; imshow(X1);
title('Marked Tumor and healthy Picture');
impixelinfo;

%%% CREATE 49-D VECTORS FROM 3 DIFERENT TUMOR REGIONS
%%% TOTAL 8836+8836+5476=23148

count=1;
 w = zeros(2*(8836+8836+5476),49); %% 2*23148 vectors

 for i = 1601+3 : 1700-3
 for j = 701+3: 800-3
 z = X1(i-3:i+3,j-3:j+3);
 z = reshape(z,49,1);
 w(count,:)=z; 
 count = count+1;
 end
 end
 
 for i = 901+3 : 1000-3
 for j = 1501+3: 1600-3
 z = X1(i-3:i+3,j-3:j+3);
 z = reshape(z,49,1);
 w(count,:)=z; 
 count = count+1;
 end
 end
 
 for i = 1081+3 : 1160-3
 for j = 1161+3: 1240-3
 z = X1(i-3:i+3,j-3:j+3);
 z = reshape(z,49,1);
 w(count,:)=z; 
 count = count+1;
 end
 end
 
%%% CREATE 49-D VECTORS FROM 3 DIFERENT HEALTH REGIONS
%%% TOTAL 8836+8836+5476=23148 
 

for i = 601+3 : 700-3
 for j = 901+3: 1000-3
 z = X1(i-3:i+3,j-3:j+3);
 z = reshape(z,49,1);
 w(count,:)=z; 
 count = count+1;
 end
 end
 
 for i = 1201+3 : 1300-3
 for j = 1601+3: 1700-3
 z = X1(i-3:i+3,j-3:j+3);
 z = reshape(z,49,1);
 w(count,:)=z; 
 count = count+1;
 end
 end
 
 for i = 1601+3 : 1680-3
 for j = 1801+3: 1880-3
 z = X1(i-3:i+3,j-3:j+3);
 z = reshape(z,49,1);
 w(count,:)=z; 
 count = count+1;
 end
 end
   
 count
 

 p=w';
 d=49;
 num=23148;
 t1=-1*ones(23148,1);
 t2=ones(23148,1);
 t=[t1;t2]';