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


function pop=CalcCrowdingDistance(pop,F)

    nF=numel(F);
    
    for k=1:nF
        
        Costs=[pop(F{k}).Cost];
        
        nObj=size(Costs,1);
        
        n=numel(F{k});
        
        d=zeros(n,nObj);
        
        for j=1:nObj
            
            [cj, so]=sort(Costs(j,:));
            
            d(so(1),j)=inf;
            
            for i=2:n-1
                
                d(so(i),j)=abs(cj(i+1)-cj(i-1))/abs(cj(1)-cj(end));
                
            end
            
            d(so(end),j)=inf;
            
        end
        
        
        for i=1:n
            
            pop(F{k}(i)).CrowdingDistance=sum(d(i,:));
            
        end
        
    end


end

