%% Homework #4 %%
%% Problem 1 %%

% define # of clusters
K = [4,15,20,50];
% store in figure 1
figure(1);
for i=1:length(K)
    % define centers
    centers = kmeandata(randi(size(kmeandata,1),K(i),1),:);
    
    for t=1:200
        % calculate distance
        for j=1:K(i)
            dist(:,j) = sqrt((kmeandata(:,1) - centers(j,1)).^2 ... 
                +(kmeandata(:,2) - centers(j,2)).^2);
        end
        
        % Assign each data point with the id of its nearest cluster
        [v g_ind] = min(dist,[],2);
        

        % recalibrate centers
        for p=1:K(i)
            centers(p,:) = mean(kmeandata(g_ind == p,:));
        end   
    end
    
    % draw plots
    subplot(2,2,i);drawnow;
     
    % plot data and recalibrated centers
    for m = 1:K(i);
        colorspec = rand(1,3);
        scatter(kmeandata(g_ind == m,1),kmeandata(g_ind == ...
            m,2),20,colorspec,'filled');
        hold on;
        
        % draw recalibrated centers
        scatter(centers(m,1),centers(m,2),80,'Marker','x', ...
            'MarkerEdgeColor',[0.6 0.6 0.6],'LineWidth',4);
    end
    title(sprintf('K Cluster Size %d', K(i)))
    hold off;
end

clear
load('HW5_data.mat');
%% Problem 2 %%

% let K be a matrix going from 1-50
K = [1:1:50];
iter = 10;
% store loglikelihood
nlglvec = zeros(length(K),1);
% store in figure 2
figure(2);
for i=1:length(K)
    % define centers
    centers2 = kmeandata(randi(size(kmeandata,1),K(i),1),:);
    dist2=[];
    for t=1:200
        % calculate distance between kmeandata and centers
        for j=1:K(i)
            dist2(:,j) = sqrt((kmeandata(:,1) - centers2(j,1)).^2 ... 
                +(kmeandata(:,2) - centers2(j,2)).^2);
        end
        
        % assign each data point with the id of its nearest cluster
        [v2 g_ind2] = min(dist2,[],2);
        
        % sum for loglikelihood
        nlglvec(i) = sum(v2.^2);
        
        % recalibrate centers
        for n=1:K(i)
            centers2(n,:) = mean(kmeandata(g_ind2==n,:));
        end
    end
end
% plot and label
plot(K,nlglvec)
title('Loglikelihood of KMeanData')
xlabel('K')
ylabel('loglikelihood')

%% Problem 3 %%
% create figure 3 plotting prior1, loglikelihood, and applied prior1
figure(3)
subplot(1,3,1)
plot(K,exp(-nlglvec))
title('Total Likelihood')
subplot(1,3,2)
plot(K,prior1)
title('Prior 1')
subplot(1,3,3)
plot(K,exp(-nlglvec).*prior1)
title('Posterior Probability')
annotation('textbox', [0 0.9 1 0.1], ...
    'String', 'Uniform Prior Probability', ...
    'EdgeColor', 'none', ...
    'HorizontalAlignment', 'center')

% create figure 4 plotting prior2, loglikelihood, and applied prior2
figure(4)
subplot(1,3,1)
plot(K,exp(-nlglvec))
title('Total Likelihood')
subplot(1,3,2)
plot(K,prior2)
title('Prior 2')
subplot(1,3,3)
plot(K,exp(-nlglvec).*prior2)
title('Posterior Probability')
annotation('textbox', [0 0.9 1 0.1], ...
    'String', 'Prior 2 Applied', ...
    'EdgeColor', 'none', ...
    'HorizontalAlignment', 'center')

% create figure 5 plotting prior3, loglikelihood, and applied prior3
figure(5)
subplot(1,3,1)
plot(K,exp(-nlglvec))
title('Total Likelihood')
subplot(1,3,2)
plot(K,prior3)
title('Prior 3')
subplot(1,3,3)
plot(K,exp(-nlglvec).*prior3)
title('Posterior Probability')
annotation('textbox', [0 0.9 1 0.1], ...
    'String', 'Prior 3 Applied', ...
    'EdgeColor', 'none', ...
    'HorizontalAlignment', 'center')
