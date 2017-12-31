%% Homework #2 %%
%% Problem 3 %%
%% PART A %%
% Create 5x2 grid
figure
for i = 1:10 
    % Plot each face to each index
        subplot(5,2,i);
        imagesc(Yale_faces{i});
end
colormap(gray)
%% PART B %%
% Initialize variables
sum2 = 0;
A = 0;
for i = 1:10
    % Convert to double
    A = double(Yale_faces{i});
    % Sum through every iteration
    sum2 = sum2 + A;
end
% Calculate mean
average = sum2/10;
% Create new figure, use gray color mapping, and plot
figure
colormap(gray)
subplot(1,1,1)
imagesc(average)
%% Part C %%
figure
z = zeros(1,10);
for i = 1:10
    % Calculate L1 Norm
    a = [abs(double(Yale_faces{i}) - average)];
    % Sum matrix
    z(i) = sum(sum(a));
end
hist(z,15)
%% Problem 4%%
figure
%% PART A %%
% Plot out histogram of 1st sound feature of all 50,000 samples 
% using hist() function with 50 bins
subplot(2,2,1)
hist(SoundCharacter(:,1),50);

%% PART B %%
subplot(2,2,2)
%Initialize y1 to hold means
y1 = zeros(1,20);
for i=1:20
    % Sample 10 songs
    ithsample = datasample(SoundCharacter(:,1), 10);
    y1(i) = mean(ithsample);
end
% Print histogram with 10 bins
hist(y1,10)

%% Part C %%
subplot(2,2,3)
% Initialize y2 to hold means
y2 = zeros(1,20);
for i=1:20
    % Sample 500 songs
    ithsample = datasample(SoundCharacter(:,1), 500);
    y2(i) = mean(ithsample);
end
% Print histogram
hist(y2,10)

%% PART D %%
subplot(2,2,4)
% Initialize y3 to hold variances
y3 = zeros(1,36);
for i=1:36
    y3(i) = var(SoundCharacter(:,i));
end
% Print out histogram with 50 bins
hist(y3,50)
% Part d

% Find min and max of variance
min_var = min(y3);
max_var = max(y3);

% Find indices of minimum variance and maximum variance
find(y3 == min_var)
find(y3 == max_var)

%% EXTRA CREDIT %%
% I will be using a set on gauge data
figure
subplot(2,1,1)
hist(densit,9)
title('Distribution of Density Data Across Snow')
xlabel('Level of Density')
ylabel('Frequency')

%2nd Histogram
subplot(2,1,2)
hist(ygain,15)
title('Distribution of Gain Data Across Density')
xlabel('Level of Gain')
ylabel('Frequency')


