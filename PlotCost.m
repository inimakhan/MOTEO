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

function PlotCost(pop)

    pop_costs=[pop.Cost];
    if size(pop_costs,1)==2
    plot(pop_costs(1,:),pop_costs(2,:),'ko');
    hold on;
    
  
    xlabel('1^{st} Objective');
    ylabel('2^{nd} Objective');
    
    grid on;
    
    hold off;
    elseif size(pop_costs,1)==3
    plot3(pop_costs(1,:),pop_costs(2,:),pop_costs(3,:),'ko');
    hold on;
    

    xlabel('1^{st} Objective');
    ylabel('2^{nd} Objective');
    zlabel('3^{rd} Objective');
    title('Non-dominated Solutions (F_{1})');
  

    grid on;
    
    hold off;
    else 
        disp(' Dimension is higher than 3D! ')
    end

end