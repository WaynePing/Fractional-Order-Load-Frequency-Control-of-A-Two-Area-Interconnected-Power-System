clear all 
clc;
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
SearchAgents_no=50; 
Max_iteration=30; % 最大迭代次数
%% Initialization                        
pr = 0.5;                        % Probability Parameter
Cost = zeros(SearchAgents_no,1);
    for i=1:dim
        ub_i=ub(i);
        lb_i=lb(i);
        X (:,i)=rand(SearchAgents_no,1).*(ub_i-lb_i)+lb_i;
    end
Codimergence_curve = zeros(1,Max_iteration);

for i=1:SearchAgents_no
    Cost(i) = optimfunc(X(i,:));      % Calculate the Value of Objective Function
end

[~,Ind] = sort(Cost);     
Best_Cost = Cost(Ind(1));        % Determine the vale of Best Fitness
Best_X = X(Ind(1),:);
Worst_Cost=Cost(Ind(end));       % Determine the vale of Worst Fitness
Worst_X=X(Ind(end),:);
%% Main Loop
for it=1:Max_iteration
    
    beta = 0.2+(1.2-0.2)*(1-(it/Max_iteration)^3)^2;                        % Eq.(14.2)
    alpha = abs(beta.*sin((3*pi/2+sin(3*pi/2*beta))));              % Eq.(14.1)

    for i=1:SearchAgents_no                
        A1 = fix(rand(1,SearchAgents_no)*SearchAgents_no)+1;                                  % Four positions randomly selected from population        
        r1 = A1(1);
        r2 = A1(2);   
        r3 = A1(3);
        r4 = A1(4);        
        Xm = (X(r1,:)+X(r2,:)+X(r3,:)+X(r4,:))/4;                   % 随机选择四个位置的平均值        
        ro = alpha.*(2*rand-1);
        ro1 = alpha.*(2*rand-1);        
        eps = 5e-3*rand;                                            % Randomization Epsilon
        
        DM = rand.*ro.*(Best_X-X(r1,:));
        Flag = 1;                   % Direction of Movement Eq.(18)
        GSR=GradientSearchRule(ro1,Best_X,Worst_X,X(i,:),X(r1,:),DM,eps,Xm,Flag);      
        DM = rand.*ro.*(Best_X-X(r1,:));
        X1 = X(i,:) - GSR + DM;                                     % Eq.(25)
        
        DM = rand.*ro.*(X(r1,:)-X(r2,:));
        Flag = 2;
        GSR=GradientSearchRule(ro1,Best_X,Worst_X,X(i,:),X(r1,:),DM,eps,Xm,Flag); 
        DM = rand.*ro.*(X(r1,:)-X(r2,:));
        X2 = Best_X - GSR + DM;                                     % Eq.(26)            
        
        Xnew=zeros(1,dim);
        for j=1:dim                                                  
            %ro=alpha.*(2*rand-1);                       
            X3=X(i,j)-ro.*(X2(j)-X1(j));           
            ra=rand;
            rb=rand;
            Xnew(j) = ra.*(rb.*X1(j)+(1-rb).*X2(j))+(1-ra).*X3;     % Eq.(27)          
        end
        
        % Local escaping operator(LEO)                              % Eq.(28)
        if rand<pr           
            k = fix(rand*SearchAgents_no)+1;
            f1 = -1+(1-(-1)).*rand();
            f2 = -1+(1-(-1)).*rand();         
            ro = alpha.*(2*rand-1);
            Xk = unifrnd(lb,ub,1,dim);%lb+(ub-lb).*rand(1,dim);       % Eq.(28.8)

            L1=rand<0.5;
            u1 = L1.*2*rand+(1-L1).*1;
            u2 = L1.*rand+(1-L1).*1;
            u3 = L1.*rand+(1-L1).*1;                                    
            L2=rand<0.5;            
            Xp = (1-L2).*X(k,:)+(L2).*Xk;                           % Eq.(28.7)
                                                 
            if u1<0.5
                Xnew = Xnew + f1.*(u1.*Best_X-u2.*Xp)+f2.*ro.*(u3.*(X2-X1)+u2.*(X(r1,:)-X(r2,:)))/2;     
            else
                Xnew = Best_X + f1.*(u1.*Best_X-u2.*Xp)+f2.*ro.*(u3.*(X2-X1)+u2.*(X(r1,:)-X(r2,:)))/2;   
            end
        end
        
        % Check if solutions go outside the search space and bring them back
        Flag4ub=Xnew>ub;
        Flag4lb=Xnew<lb;
        Xnew=(Xnew.*(~(Flag4ub+Flag4lb)))+ub.*Flag4ub+lb.*Flag4lb;                
        Xnew_Cost = optimfunc(Xnew);
        % Update the Best Position        
        if Xnew_Cost<Cost(i)
            X(i,:)=Xnew;
            Cost(i)=Xnew_Cost;
            if Cost(i)<Best_Cost
                Best_X=X(i,:);
                Best_Cost=Cost(i);
            end            
        end
       % Update the Worst Position 
        if Cost(i)>Worst_Cost
            Worst_X= X(i,:);
            Worst_Cost= Cost(i);
        end               
    end
    
    Codimergence_curve(it) = Best_Cost;
    % Show Iteration Information
    disp(['Iteration ' num2str(it) ': Best Fitness = ' num2str(Codimergence_curve(it))]);
end
% _________________________________________________
% Gradient Search Rule
function GSR=GradientSearchRule(ro1,Best_X,Worst_X,X,Xr1,DM,eps,Xm,Flag)
    dim = size(X,2);
    Delta = 2.*rand.*abs(Xm-X);                            % Eq.(16.2)
    Step = ((Best_X-Xr1)+Delta)/2;                         % Eq.(16.1)步长
    DelX = rand(1,dim).*(abs(Step));                        % Eq.(16)由（xbest）和（xr1）之间的差值来确定的
    GSR = randn.*ro1.*(2*DelX.*X)./(Best_X-Worst_X+eps);   % Gradient search rule  Eq.(15)
    if Flag == 1
      Xs = X - GSR + DM;                                   % Eq.(21)
    else
      Xs = Best_X - GSR + DM;
    end    
    yp = rand.*(0.5*(Xs+X)+rand.*DelX);                    % Eq.(22.6)
    yq = rand.*(0.5*(Xs+X)-rand.*DelX);                    % Eq.(22.7)
    GSR = randn.*ro1.*(2*DelX.*X)./(yp-yq+eps);            % Eq.(23)   
end







    
    
    
    




