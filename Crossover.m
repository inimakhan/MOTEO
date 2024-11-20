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

function [P1, P2]=Crossover(P1,P2,MaxRank,c,ratio)



    x1=P1.Position;
    r1=P1.Rank;
    
    x2=P2.Position;
    r2=P2.Rank;
    
    nVar=numel(x1);
    
    Tenv2=(ones(1,nVar)-c*rand(1,nVar)).*x2;
    y1=Tenv2+(x1-Tenv2)*exp(-1*ratio*(r1/MaxRank));
    
    Tenv1=(ones(1,nVar)-c*rand(1,nVar)).*x1;
    y2=Tenv1+(x2-Tenv1)*exp(-1*ratio*(r2/MaxRank));
    
    P1.Position=y1;
    P2.Position=y2;
end