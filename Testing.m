%% LUNG TUMOR DETECTION ON SINGLE IMAGE - AUTHOR: CHRISTOS KORGIALAS

% TESTING 

close all
clear all
clc


X1 = imread('lungTexp1_rec1800','bmp');
figure; imshow(X1);
title('Tumor Picture');
impixelinfo;

%load net_5_3_1_01.mat
load net_7_1_008.mat
%Create and determine feedforward Neural Network (3 Layers)

tic
atest=zeros(49,6708100);
count=1;
 for i = 1+3:2596-3
     i
 for j = 1+3:2596-3
  z = X1(i-3:i+3,j-3:j+3);
atest(:,count)= reshape(z,49,1);
count=count+1;
 end
 end
toc

 aaa=zeros(1,6708100);
 tic
 aaa(1:1000000)=sim(net,atest(:,1:1000000));
 aaa(1000001:2000000)=sim(net,atest(:,1000001:2000000));
 aaa(2000001:3000000)=sim(net,atest(:,2000001:3000000));
 aaa(3000001:4000000)=sim(net,atest(:,3000001:4000000));
 aaa(4000001:5000000)=sim(net,atest(:,4000001:5000000));
 aaa(5000001:6000000)=sim(net,atest(:,5000001:6000000));
 aaa(6000001:6708100)=sim(net,atest(:,6000001:6708100));
 toc
 
 tic
 for i=1:6708100
 if(aaa(i)>0)
     aaa(i)=255;
 else
     aaa(i)=0;
 end
 end
 toc
 tic
 X2=reshape(aaa,2590,2590); 
 toc
 
 
 
figure; imshow(uint8(X2'));