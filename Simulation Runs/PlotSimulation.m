function PlotSimulation(cellData,mode,panic,visibility)
    N = size(cellData,3);

    t = zeros(1,N);
    for i = 1:N
       t(i) = size(cellData{1,1,i},2);
    end
    M = max(t);

    s = zeros(5,M,N);
    for n = 1:N 
        for i = 1:M
            for j = 1:5
                if i > size(cellData{:,j,n},2)
                    s(j,i,n) = cellData{:,j,n}(1,end);
                else
                    s(j,i,n) = cellData{:,j,n}(1,i);
                end
            end
        end
    end

    ss = sum(s,3) / 100;
    c = hsv(5);
    M = size(ss,2);
    hold on
    plot(ss(1,:),'Color',c(1,:),'LineWidth',2);
    plot(ss(2,:),'Color',c(2,:),'LineWidth',2);
    plot(ss(3,:),'Color',c(3,:),'LineWidth',2);
    plot(ss(4,:),'Color',c(4,:),'LineWidth',2);
    plot(ss(5,:),'Color',c(5,:),'LineWidth',2);
    hold off
    
    if mode == 1
        textString = sprintf('Altruistic model: $\\rho = %.3f$ and $\\nu = %d$',panic,visibility);
    else
        textString = sprintf('Panic model: $\\rho = %.3f$ and $\\nu = %d$',panic,visibility);
    end
    
    title(textString,'Interpreter','latex')
    xlabel('Time step');
    ylabel('Number of agents');
    legend('Evacuated','Rescued','Dead','Hurt','Healed','Orientation','horizontal')
    xlim([0 M])
    set(gca,'FontSize',14,'FontName','Serif')
end