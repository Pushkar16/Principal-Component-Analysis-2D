


close all;
clear all; clc;

tic
t0=clock;
path='C:\Users\pushk\Desktop\matlab\att_faces';

input_array=loadTrainingData(path);

[length,width,n]=size(input_array);
mean_image=mean(input_array,3);
for i=1:n
    feature_array(:,:,i)=input_array(:,:,i)-mean_image;
end;
cov_matrix=zeros(width);
for i=1:n
    cov_matrix=cov_matrix+feature_array(:,:,i)'*feature_array(:,:,i);
end
cov_matrix=cov_matrix/n;
[V,D]=eig(cov_matrix);
significant_D=abs(diag(D));
[~,wdth]=sort(significant_D,'descend');
V=V(:,wdth);
k=10;
W=V(:,1:k);
projected_input=zeros(length,k,n);
reconstructed_input=zeros(length,width,n);
for i=1:n
    projected_input(:,:,i)=input_array(:,:,i)*W;
end
for i=1:n
    recon(:,:,i)=projected_input(:,:,i)*W';
end


[xrec,curr_D,val]=findNearestNeighbor(recon);
     figure(1)
    imagesc(recon(:,:,10));
    colormap gray;
    title('sample image')
time1=etime(clock,t0);

 toc;
