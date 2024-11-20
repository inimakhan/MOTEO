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


function [pop, F]=SortPopulation(pop)

    % Sort Based on Crowding Distance
    [~, CDSO]=sort([pop.CrowdingDistance],'descend');
    pop=pop(CDSO);
    
    % Sort Based on Rank
    [~, RSO]=sort([pop.Rank]);
    pop=pop(RSO);
    
    % Update Fronts
    Ranks=[pop.Rank];
    MaxRank=max(Ranks);
    F=cell(MaxRank,1);
    for r=1:MaxRank
        F{r}=find(Ranks==r);
    end

end