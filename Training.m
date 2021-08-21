%% LUNG TUMOR DETECTION ON SINGLE IMAGE - AUTHOR: CHRISTOS KORGIALAS

% TRAINING

close all
clear all
clc


X1 = imread('lungTexp1_rec1800','bmp');
figure; imshow(X1);
title('Tumor Picture');
impixelinfo;

load Data4Train


%Create and determine feedforward Neural Network (3 Layers)

aa=zeros(49,2);
aa(:,2)=255;

net=newff(aa,[7 1],{'tansig' 'tansig'},'trainlm');
net.trainParam.show=5;
net.trainParam.epochs=200;
net.trainParam.goal=1e-2;
net.trainParam.min_grad=1e-20;
net.trainParam.lr=0.01;

net=train(net,p,t); 

atest=zeros(49,6708100);
count=1;
 for i = 1+3:2596-3
 for j = 1+3:2596-3
  z = X1(i-3:i+3,j-3:j+3);
atest(:,count)= reshape(z,49,1);
count=count+1;
 end
 end

 aaa=zeros(1,6708100);
 tic
 aaa=sim(net,atest);
 toc
 
 for i=1:6708100
 if(aaa(i)>0)
     aaa(i)=255;
 else
     aaa(i)=0;
 end
 end
 
 X2=reshape(aaa,2590,2590);   
 
 
 
figure; imshow(uint8(X2));