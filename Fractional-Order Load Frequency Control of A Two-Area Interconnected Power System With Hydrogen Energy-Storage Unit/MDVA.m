clear all 
clc
global Kp1;
global Ki1;
global Kd1;
global lam1;
global mu1;
global Kp2;
global Ki2;
global Kd2;
global lam2;
global mu2;
lb=[0 0 0 0 0 0 0 0 0 0];
ub=[700 700 50 2 2 700 700 50 2 2];
dim = 10;
N=50;
Max_iteration=30;
BestX=zeros(1,dim);
BestF=inf;
C_curve=zeros(1,Max_iteration);
    for i=1:dim
        ub_i=ub(i);
        lb_i=lb(i);
        X(:,i)=rand(N,1).*(ub_i-lb_i)+lb_i;
    end
Objective_values = zeros(1,size(X,1));
for i=1:size(X,1)
    Objective_values(1,i)=optimfunc(X(i,:));
    if i==1
        BestX=X(i,:);
        BestF=Objective_values(1,i);
    elseif Objective_values(1,i)<BestF
        BestX=X(i,:);
        BestF=Objective_values(1,i);
    end
    All_objective_values(1,i)=Objective_values(1,i);
    f0(1,i)=Objective_values(1,i);
end
it=1;
while it<=Max_iteration
    amax=1;
    amin=0;
    a= amin+(amax-amin)*(Max_iteration-it)/Max_iteration ;%   % Eq. (5)
    R=(ub-lb)/2;
    for i=1:size(X,1) % in i-th solution
        for j=1:size(X,2) % in j-th dimension
            BB=2-4*rand;
            GG=rand;
            r4=rand();
            if r4<0.3         % Eq. (4)
             X(i,j)= (a/(BB+X(i,j))*sin(((2*pi)/GG)*X(i,j))+rand*BestX(j));
            else
             X(i,j)=BestX(j)+rand*0.95^it;
            end
        end
    end
    for i=1:size(X,1)
        Flag4ub=X(i,:)>ub;
        Flag4lb=X(i,:)<lb;
        X(i,:)=(X(i,:).*(~(Flag4ub+Flag4lb)))+ub.*Flag4ub+lb.*Flag4lb;
        Objective_values(1,i)=optimfunc(X(i,:));
        if Objective_values(1,i)<f0(1,i)
            pbest(i,:)=X(i,:);
            X(i,:)=pbest(i,:);
            f0(1,i)=Objective_values(1,i);
        end
        if Objective_values(1,i)<BestF
            BestX=X(i,:);
            BestF=Objective_values(1,i);
        end
    end
    C_curve(it)=BestF;
    it=it+1;
end