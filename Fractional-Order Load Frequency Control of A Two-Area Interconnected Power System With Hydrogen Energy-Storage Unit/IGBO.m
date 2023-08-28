clear all 
clc;
global Kp1;
global lam2;
global Ki1;
global Kd1;
global lam1;
global mu1;
global Kp2;
global Ki2;
global Kd2;
global mu2;
lb=[0 0 0 0 0 0 0 0 0 0];
ub=[700 700 50 2 2 700 700 50 2 2];
dim = 10;
nP=50; 
MaxIt=30; % 最大迭代次数
%% Initialization
uF = zeros(nP,1);
uCR = zeros(nP,1);
    for i=1:dim
        ub_i=ub(i);
        lb_i=lb(i);
        X (:,i)=rand(nP,1).*(ub_i-lb_i)+lb_i;
    end
Codimergence_curve = zeros(1,MaxIt);
% NFE=0;
for i=1:nP
    Cost(i) = optimfunc(X(i,:));      % Calculate the Value of Objective Function
end
% NFE = NFE + nP;
[~,Ind] = sort(Cost);  
[~,ind]=sort(Cost);
Best_score2 = Cost(ind(2));
Best_X2 = X(ind(2),:);
Best_score3 = Cost(ind(3));
Best_X3 = X(ind(3),:);
Best_score = Cost(Ind(1));        % Determine the vale of Best Fitness
Best_X = X(Ind(1),:);
Worst_Cost=Cost(Ind(end));       % Determine the vale of Worst Fitness
Worst_X=X(Ind(end),:);
%% Main Loop
it = 0;
LC=0.7;%%%%%
while it<MaxIt
    it = it+1;

    CR = [];
    ro = [];ro1 = [];
    [~,reindex]=sort(Cost);
    for i=1:nP
        uF(reindex(i))=i/nP;
        uCR(reindex(i))=i/nP;
    end

    for i=1:nP             
        A1 = randperm(nP);
        
        A1(A1==i)=[];
        r1 = (A1(1));
        r2 = (A1(2));
        r3 = (A1(3));
        r4 = (A1(4));
        Xr1 = X(r1,:);
        Xr2 = X(r2,:);
        Xr3 = X(r3,:);
        Xr4 = X(r4,:);
       Xm = (Xr1+Xr2+Xr3+Xr4)/4;                   % Average of Four positions randomly selected from population  
        if Cost(i)<Best_score
            Best_score=Cost(i);  
            Best_X=X(i,:);
        elseif Cost(i)>Best_score && Cost(i)<Best_score2
            Best_score2=Cost(i);  
            Best_X2=X(i,:);
        elseif Cost(i)>Best_score && Cost(i)>Best_score2 && Cost(i)<Best_score3
            Best_score3=Cost(i);  
            Best_X3=X(i,:);
        end
        
         eps = 5e-20*rand;                                            % Randomization Epsilon

         if rand<0.5
             ro(i)=uF(r1)+0.1*randn;
             ro1(i)=uF(r2)+0.1*randn;%改进点
         else
             ro(i)=uF(i)+0.1*randn;
             ro1(i)=uF(i)+0.1*randn;
         end
         
        DM = 1*rand.*ro(i).*(Best_X-Xr1);
        Flag = 1;                   
        GSR=GradientSearchRule(ro1(i),Best_X,Worst_X,X(i,:),Xr1,DM,eps,Xm,Flag);      
        DM = 1*rand.*ro(i).*(Best_X-Xr1);
        X1 = X(i,:) - GSR + DM;                                     
        
        DM = 1*rand.*ro(i).*(Xr1-Xr2);
        Flag = 2;
        GSR=GradientSearchRule(ro1(i),Best_X,Worst_X,X(i,:),Xr1,DM,eps,Xm,Flag); 
        DM = 1*rand.*ro(i).*(Xr1-Xr2);
        X2 = Best_X - GSR + DM;                                                
        
        Xnew=zeros(1,dim);
        jrand=randi([1,dim]);
        CR(i)=(uCR (i)+0.1*randn);
   
        for j=1:dim
            if rand<CR(i) || j==jrand
                if rand<0.5
                    Xnew(j) = X1(j); 
                else
                    Xnew(j)=  X2(j);
                end
            else
                Xnew(j) = X(i,j);
            end
        end

        % Modified local escaping operator(MLEO)                              

        LC = 4*LC*(1-LC);
        if rand<LC                
            k = fix(rand*nP)+1;
            L2=rand<0.5;            
            Xp = (1-L2).*Best_X2+(L2).*X(k,:);                          
             
            if rand<0.5*(1-(it/MaxIt))
                Xnew = Best_X3 + ((ro(i)).*(Best_X-Xp)+(ro1(i)).*(Xr1-Xr2));    
            else
                Xnew = Best_X +((ro(i)).*(Best_X-Xp)+(ro1(i)).*(Xr1-Xr2));  
            end
        end
        
        % Check if solutions go outside the search space and bring them back
        for j=1:dim
            if Xnew(j)<lb(j)
                Xnew(j) = lb(j)+rand()*(ub(j)-lb(j));
            end
            
            if Xnew(j)>ub(j)
                Xnew(j) = lb(j)+rand()*(ub(j)-lb(j));
            end
        end
        Xnew_Cost = optimfunc(Xnew);
%         NFE = NFE + 1;
        % Update the Best Position        
        if Xnew_Cost<Cost(i)
            X(i,:)=Xnew;
            Cost(i)=Xnew_Cost;
            if Cost(i)<Best_score
                Best_X=X(i,:);
                Best_score=Cost(i);
            end
        end
       % Update the Worst Position 
        if Cost(i)>Worst_Cost
            Worst_X= X(i,:);
            Worst_Cost= Cost(i);
        end               
    end
    
    Codimergence_curve(it) = Best_score;
%     % Show Iteration Information
   disp(['Iteration ' num2str(it) ': Best Fitness = ' num2str(Codimergence_curve(it))]);
end
% _________________________________________________
% Gradient Search Rule
function GSR=GradientSearchRule(ro1,Best_X,Worst_X,X,Xr1,DM,eps,Xm,Flag)
    dim = size(X,2);
    Delta = rand.*abs(Xm-X);                            
    Step = ((Best_X-Xr1)+Delta)/2;                        
    DelX = rand(1,dim).*(abs(Step));                        
       
    GSR = ro1.*(2*DelX.*X)./(Best_X-Worst_X+eps);   % Gradient search rule  Eq.(15)
    if Flag == 1
      Xs = X - GSR + DM;                                   
    else
      Xs = Best_X - GSR + DM;
    end    
    yp = rand.*(0.5*(Xs+X)+rand.*DelX);                   
    yq = rand.*(0.5*(Xs+X)-rand.*DelX);                    

    GSR = ro1.*(2*DelX.*X)./(yp-yq+eps);                   
end

