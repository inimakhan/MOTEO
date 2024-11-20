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


function y=Mutate(x,mu,sigma)

    nVar=numel(x);
    
    nMu=ceil(mu*nVar);

    j=randsample(nVar,nMu);
    if numel(sigma)>1
        sigma = sigma(j);
    end
    
    y=x;
    
    y(j)=x(j)+sigma.*randn(size(j));

end