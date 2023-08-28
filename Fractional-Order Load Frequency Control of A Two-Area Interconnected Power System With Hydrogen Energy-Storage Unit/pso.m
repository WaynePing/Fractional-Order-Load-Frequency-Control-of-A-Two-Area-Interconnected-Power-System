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
SearchAgents_no=50; % 种群数量
iter=30;  
Vmax=1;
wMax=0.9;
wMin=0.2;
c1=2;
c2=2;
noP=SearchAgents_no;
% Initializations
vel=zeros(noP,dim);
pBestScore=zeros(noP);
pBest=zeros(noP,dim);
gBest=zeros(1,dim);
PSO_curve=zeros(1,iter);

% Random initialization for agents.
Boundary_no= size(ub,2); % numnber of boundaries

    for i=1:dim
        ub_i=ub(i);
        lb_i=lb(i);
        Positions(:,i)=rand(SearchAgents_no,1).*(ub_i-lb_i)+lb_i;
    end
for i=1:noP
    pBestScore(i)=inf;
end

% Initialize gBestScore for a minimization problem
 gBestScore=inf;
     
    
for l=1:iter 
    for i=1:size(Positions,1)
    % Return back the particles that go beyond the boundaries of the search
    % space
     Flag4ub=Positions(i,:)>ub;
     Flag4lb=Positions(i,:)<lb;
    Positions(i,:)=(Positions(i,:).*(~(Flag4ub+Flag4lb)))+ub.*Flag4ub+lb.*Flag4lb;
        %Calculate objective function for each particle
     fitness=optimfunc(Positions(i,:));

        if(pBestScore(i)>fitness)
            pBestScore(i)=fitness;
            pBest(i,:)=Positions(i,:);
        end
        if(gBestScore>fitness)
            gBestScore=fitness;
            gBest=Positions(i,:);
        end
    end

    %Update the W of PSO
    w=wMax-l*((wMax-wMin)/iter);
    %Update the Velocity and Position of particles
    for i=1:size(Positions,1)
        for j=1:size(Positions,2)       
            vel(i,j)=w*vel(i,j)+c1*rand()*(pBest(i,j)-Positions(i,j))+c2*rand()*(gBest(j)-Positions(i,j));
            
            if(vel(i,j)>Vmax)
                vel(i,j)=Vmax;
            end
            if(vel(i,j)<-Vmax)
                vel(i,j)=-Vmax;
            end            
            Positions(i,j)=Positions(i,j)+vel(i,j);
        end
    end
    PSO_curve(l)=gBestScore;
end
semilogy(PSO_curve,'Color','r')
title('Objective space')
xlabel('Iteration');
ylabel('Best score obtained so far');