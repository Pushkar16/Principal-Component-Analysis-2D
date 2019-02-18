close all;
clear all; clc;
tic
t0=clock;
path='C:\Users\pushk\Desktop\matlab\att_faces';

input_array=loadTrainingData(path);

[length,width,n]=size(input_array);

new_feature=reshape(input_array,length*width,n);
mean_image=mean(new_feature,2);
new_feature=new_feature-mean_image;

[U, S] = pca(new_feature);
k=50;
W=U(:, 1:k);
projected_input=zeros(length*width,k);
reco_input=zeros(length*width,n);
projected_input=new_feature*W;
reco_input=projected_input*W';
[xrec,curr_D,val]=findNearestNeighbor(reshape(reco_input,length,width,n)+reshape(mean_image,length,width));
   figure(1)
    imagesc(reshape(reco_input(:,351),length,width)+reshape(mean_image,length,width));
    colormap gray;
    title('sample image')
 
 toc
