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

Method = 'tree';'liner';
Pre_Method = 'None';'Normalize';'Scale';
%% 1
[y_predict1,performance1,Imp] = ygz_predict(x(:,3),y1,k,Pre_Method,Method);
seed = 'default';
rng(seed)
np = 5000;
for i=np+1:-1:1
   RandIndex(i,:) = randperm(k);
end
%% permutation test 1
for i = np:-1:1
    fprintf('%d\n',i)
    [y_predict,performance] = ygz_predict(x(:,3),y1(RandIndex(i,:)),k,Pre_Method,Method);
    premutation_1_r(i) = performance(1);
    premutation_1_mse(i) = performance(2);
end
p1_r = length(find(premutation_1_r>performance1(1)))/np;
p1_mse = length(find(premutation_1_mse>performance1(2)))/np;
