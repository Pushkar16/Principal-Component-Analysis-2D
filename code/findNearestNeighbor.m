function [X_rec,curr_D,calc_index] = findNearestNeighbor(recon)
path='C:\Users\pushk\Desktop\matlab\att_faces';

input_array=loadTestingData(path);

input_length=size(input_array,3);

n=size(recon,3);
correct=0;


for j=1:input_length
 D = intmax('int64');
for i=1:n
   % curr_D = sum(sum(pdist2(recon(:,:,i),input_array(:,:,j),'euclidean')));
    curr_D=sqrt(sum(sum((recon(:,:,i)-input_array(:,:,j)).^2)));
    if curr_D<D
        D=curr_D;
        X_rec=recon(:,:,i);
        calc_index=i;
    end
end
if ceil(calc_index/9)==j
    correct=correct+1;
end
%disp(strcat(num2str(j),'::',num2str(ceil(calc_index/9))))

end
disp(strcat('Accuracy is   ',num2str(correct*100/40),'%'));



 
 
