clear all;clc
load('predict_data2');
data = DATADIFF;
x1 = DATADIFF.DiffFZ;
x2 = DATADIFF.DiffCZ;
x3 = DATADIFF.DiffFCZ;
x= [x1,x2,x3];
x(39,:)=[];
y1 = trick.diffVFI;
k = length(y1);

Method ='tree';'liner';
Pre_Method = 'None';'Normalize';'Scale';
%% 1
[y_predict1,performance1] = ygz_predict(x(:,3),y1,k,Pre_Method,Method);