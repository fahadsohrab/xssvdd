% This is a sample demo code for X-SSVDD

clc
close all
clear

addpath(pwd);
%%Generate Random Data
noOfTrainData = 500; noOfTestData = 100;
D= 5; %Original dimentionality of data
Traindata = rand(D,noOfTrainData); %Generate training data
%Training labels (all +1s) are not needed.

testlabels = -ones(noOfTestData,1);
perm = randperm(noOfTestData);
positiveSamples = floor(noOfTestData/2);
testlabels(perm(1:positiveSamples))=1; % test labels, +1 for target, -1 for outliers
Testdata= rand(D,noOfTestData); %Generate testing data

%Possible inputs to ssvddtrain
% The first input argument is Training data
%
%other options (input arguments) include
% 'maxIter' :Maximim iteraions, Default=100
% 'C'       :Value of hyperparameter C, Default=0.1
% 'd'       :data in lower dimension, make sure that input d<D, Default=1
% 'eta'     :Used as step size for gradient, Default=0.1
% 'psi'     :regularization term, Default=1 i.e., No regularization term
%           :Other options for psi are 2,3,4 (Please refer to paper for more details)
% 'B'       :Default=0.1, Controling the importance of regularization term
% 'npt'     :1 for Non-linear Projection Trick (NPT)-based non-linear Subspace-SVDD (Default=0, linear)
%  's'       :Hyperparameter for the kernel inside NPT (Default=0.001). 
% 'l'       :Hyperparameter for the Laplacian, k for Knn or Clusters for Lb and Lw.

ssvddmodel=xssvddtrain(Traindata,'C',0.1,'d',4,'eta',0.02,'L',4,'B',0.001,'l',3);
[predicted_labels,accuracy,sensitivity,specificity]=xssvddtest(Testdata,testlabels,ssvddmodel);
