function input_array=loadTrainingData(path)
folder_list=dir(path)
folder_list(1:2)=[];
num=size(folder_list)
input_array=[]
k=1;
for i=1:num
    curr_class=strcat(path,'\',folder_list(i).name);
    if isdir(curr_class)
   
       for i=1:9
          
           image_path=strcat(curr_class,'\',num2str(i),'.pgm');
           input_array(:,:,k)=imread(image_path);
           k=k+1;
       end
    end
end
