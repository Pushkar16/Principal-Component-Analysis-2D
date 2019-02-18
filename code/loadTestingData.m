function input_array=loadTestingData(path)
folder_list=dir(path)
folder_list(1:2)=[];
num=size(folder_list)
input_array=[]
k=1;
for i=1:num
    curr_class=strcat(path,'\',folder_list(i).name);
    if isdir(curr_class)
   
          
           image_path=strcat(curr_class,'\10.pgm');
           input_array(:,:,k)=imread(image_path);
           k=k+1;
       
    end
end
