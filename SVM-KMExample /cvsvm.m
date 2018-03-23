function result = cvsvm(xtr, ttr, CV_Fold, kernel_type, kernel_parameters, C)
% To perform Cross Validation on the given data (xtr and ttr)
% INPUTS:
% xtr -- training data,  sample X feature matrix
% ttr -- labels for training data, column vector
% CV_Fold -- cross-validation fold number, e.g. CV_Fold =3
% kernel_type  --- type of kernels, e.g.  Gaussian,  polynomial
% kernel _parameters --- parameters of kernel,  column vector
% C -- trade-off parameter in SVM,  column vector
% OUPUTS: 
% result.cv_error -- average error rates (misclassification)
% result.best_kernelpar --- optimal kernel parameter
% result.bestC --- optimal trade-off parameter


N = size(xtr,1);         % Here N is the number of observations.
nos_kernel_para = length(kernel_parameters);
nos_C = length(C);
cv_error = zeros(nos_kernel_para,nos_C); 


for fold = 1:CV_Fold
     % data partition
    fprintf('%d-fold cross-validation: data split [%d]\n',CV_Fold, fold);
    ind = randperm(N);
    foldnos = ceil(N/CV_Fold);      % converting to an integer
    te_ind = ind(1:foldnos);
    tr_ind = ind(foldnos+1:end);
    Xte = xtr(te_ind,:);     % for validation
    Tte = ttr(te_ind);
    Xtr = xtr(tr_ind,:);      % for training
    Ttr = ttr(tr_ind);
    for j = 1:nos_kernel_para
        for k = 1:nos_C
            
            %training SVM by calling SVM-km
            kerneloption = kernel_parameters(j);
            tradeoff_C = C(k);
            lambda = 1e-7; %to avoid the singularity of the kernel matrix
            [xsup,w,w0,pos,timeps,alpha,obj]...
                =svmclass(Xtr,Ttr,tradeoff_C,lambda,kernel_type,kerneloption,0);
            ypred = svmval(Xte,xsup,w,w0,kernel_type,kerneloption,ones(length(Tte),1));
            pred_label = 2*(ypred>=0)-1;  % coverting to binary-valued labels

            %validation error
            cv_error(j,k) = cv_error(j,k)+ sum(pred_label~=Tte)/length(Tte);
       end
    end
end
result.cv_error = cv_error;
% finding the minimum error and best kernel parameter and C
[temperror,qq] = min(min(cv_error,[],1));
[MAXA pp] = min(cv_error(:,qq));
result.best_kernelpar = kernel_parameters(pp);
result.bestC = C(qq);
result.mincverror =temperror; 
