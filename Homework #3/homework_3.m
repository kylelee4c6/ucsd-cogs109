%% Homework #3 %%
%% Problem 1 %%
figure
for i = 1:25
    % Plot each face to each index
    faceI = reshape(facemat(:,i),40,40);
    subplot(5,5,i);
    imagesc(faceI);
end
colormap(gray);

%% Problem 2 %%
figure
meanFace = mean(facemat,2);
aveFace = reshape(mean(facemat,2),40,40);
imagesc(aveFace);
colormap(gray);

%% Problem 3 %%
%% Part A %%
Z = facemat - repmat(meanFace, [1, size(facemat,2)]);
%% Part B %%
C = Z*Z'/size(facemat,2);
%% Part C %%
tic
[V, D] = eig(C);
toc

%% Part D %%
[sv si] = sort(diag(D),'descend');
Vs = V(:,si);

%% Part E %%
figure
for i = 1:25
    % Plot each face to each index
    faceI = reshape(Vs(:,i),40,40);
    subplot(5,5,i);
    imagesc(faceI);
end
colormap(gray);
%%% QUESTION 4 %%%
%% Part A %%
figure
Proj = Vs(:,1:3)'*Z;
scatter3(Proj(1,:),Proj(2,:),Proj(3,:),20,'filled');

%% Part B %%
figure
for i=1:5
    subplot(1,5,i);
    ReFace = Vs(:,1:20*i)*Vs(:,1:20*i)'*Z(:,1) + meanFace;
    aveFace2 = reshape(ReFace,40,40);
    imagesc(aveFace2);
colormap(gray);
end

%%% QUESTION 5 %%%
COEFF = pca(facemat', 'Algorithm', 'eig');

figure
for i = 1:25
    subplot(5,5,i);
    % Plot each face to each index
    faceI = reshape(COEFF(:,i),40,40);
    imagesc(faceI);
end
colormap(gray);


%%% QUESTION 6 %%%
tic
[U,S,V] = svd(facemat);
toc
figure
for i = 1:25
    % Plot each face to each index
    faceSVD = reshape(U(:,i),40,40);
    subplot(5,5,i);
    imagesc(faceSVD);
end
colormap(gray);


%%% QUESTION 7 %%%

[W,X,Y] = svd(ygain(1:90));
figure
for i = 1:2
    % Plot each face to each index
    gainSVD = W(:,i)
    subplot(2,2,i);
    imagesc(gainSVD);
end
colormap(gray);