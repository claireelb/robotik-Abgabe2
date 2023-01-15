function plotResIMPPDP(pathpulsefrontname, titlename, legend_title, data,time,d,k,fall,up)
% data = out.ex;
% time = out.tout;
% titlename= "x-xd";
% legend_title = "diffx";

    h =figure();
    h.Position(3:4) = [1280/2 720/2];
    
    pathplusname = pathpulsefrontname+"d-"+num2str(d)+"k-"+num2str(k)+"fall"+num2str(fall)+"."+num2str(up)+".png";
    
    legend_label = ["","","","","","",""]; 
    length_data = size(data)
    for i = 1:length_data(1)
        a = data(i,:,:);
        a = squeeze(a);
        plot(time, a);
        hold on;
        grid on;
        legend_label(i) = legend_title+num2str(i);
    
    end
    legend(legend_label,'Position',[0.155769230769231 0.00609065155807366 0.680769230769231 0.0481586402266289]);
    legend('Orientation','horizontal')
    legend('boxoff')
%     legend(legend_label,Location="best");
    title(titlename);
    saveas(h,pathplusname,'png');
end

