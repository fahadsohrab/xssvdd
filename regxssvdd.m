% This fucntion is used to compute regularization term for "XSSVDD"
function const= regxssvdd(consType,Q,Traindata,l)
N = size( Traindata, 2 );
params.K=l;
if consType==1
              Dtrain = ((sum(Traindata'.^2,2)*ones(1,N))+(sum(Traindata'.^2,2)*ones(1,N))'-(2*(Traindata'*Traindata)));
        W = zeros(N);
        for ii=1:N
            [~, ind] = sort(Dtrain(ii,:),'descend');
            W(ii,ind(1:params.K)) = 1.0;
        end
        W=(W+W'); %Make symmetric
        W(W~=0)=1.0;
        D = sum(W')'; 
        L = diag(D) - W;
        const= (2*Q*(Traindata*(L)*Traindata'));

elseif consType==2
            idx = kmeans(Traindata',params.K);
        L = 0 ;
        for c=1:params.K
            Nc = sum(idx==c);
            L = L + Nc*(double(idx==c)/Nc - ones(N)/N)*(double(idx==c)/Nc - ones(N)/N)';
        end
        const= (2*Q*(Traindata*(L)*Traindata'));
elseif consType==3
            idx = kmeans(Traindata',params.K);
        A = zeros(N);
        for c=1:params.K
            Nc = sum(idx==c);
            A = A + double(idx==c)*double(idx==c)'/Nc;
        end
        L=eye(N)-A;
        const= (2*Q*(Traindata*(L)*Traindata'));

else
       disp('Only L = 1,2, or 3 is possible')
end

end