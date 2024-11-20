
%__________________________________________________________________ %
%                                                                   %
%                                                                   %
%          MOTEO: a novel multi-objective thermal exchange          %
%            optimization algorithm for engineering problems        %
%                                                                   %
%                                                                   %
%               Developed in MATLAB R2020b (MacOs-Monterey)         %
%                                                                   %
%                      Author and programmer                        %
%                ---------------------------------                  %
%             Nima Khodadadi    (ʘ‿ʘ)     Armin Dadras Eslamlou     %
%                                                                   %
%                                                                   %
%                                                                   %
%                                                                   %
%                            e-Mail(2)                              %
%                ---------------------------------                  %
%                         inimakhan@me.com                          %
%                         nkhod002@fiu.edu                          %                                                                  %
%                                                                   %
%                                                                   % 
%                    https://nimakhodadadi.com                      %
%                                                                   %
%                                                                   %
%                                                                   %
%                                                                   %
%                        Cite this article                          %
%           Khodadadi, N., Talatahari, S. & Dadras Eslamlou,        %
%   MOTEO:  a novel multi-objective thermal exchange optimization   % 
%       algorithm for engineering problems. Soft Comput (2022).     %
%              https://doi.org/10.1007/s00500-022-07050-7           %
%                                                                   %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [pop, F]=NonDominatedSorting(pop)

    nPop=numel(pop);

    for i=1:nPop
        pop(i).DominationSet=[];
        pop(i).DominatedCount=0;
    end
    
    F{1}=[];
    
    for i=1:nPop
        for j=i+1:nPop
            p=pop(i);
            q=pop(j);
            
            if Dominates(p,q)
                p.DominationSet=[p.DominationSet j];
                q.DominatedCount=q.DominatedCount+1;
            end
            
            if Dominates(q.Cost,p.Cost)
                q.DominationSet=[q.DominationSet i];
                p.DominatedCount=p.DominatedCount+1;
            end
            
            pop(i)=p;
            pop(j)=q;
        end
        
        if pop(i).DominatedCount==0
            F{1}=[F{1} i];
            pop(i).Rank=1;
        end
    end
    
    k=1;
    
    while true
        
        Q=[];
        
        for i=F{k}
            p=pop(i);
            
            for j=p.DominationSet
                q=pop(j);
                
                q.DominatedCount=q.DominatedCount-1;
                
                if q.DominatedCount==0
                    Q=[Q j]; %#ok
                    q.Rank=k+1;
                end
                
                pop(j)=q;
            end
        end
        
        if isempty(Q)
            break;
        end
        
        F{k+1}=Q; %#ok
        
        k=k+1;
        
    end
    

end