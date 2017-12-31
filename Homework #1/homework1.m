% Initialize variables
jumps = 0;
% Start for loop
for i= 0:33
    a = 2+3*i;
    % If a doesn't get too big, add to jumps
    if a<100
        % Update
        jumps = jumps + a;
    end
end
jumps

%2
jumps2=[2:3:100]
total = sum(jumps2)

%3
popCanStock = 40;
controllerCount =2;
for iGamer = 1:5
    controllerCount = controllerCount+1;
    popCanStock = popCanStock - 1;
    for iAfternoon = 1:3
        popCanStock = popCanStock - 2;
    end
end

popCanStock
controllerCount

%4
% Part a
myMagic = magic(100);
% Part b
subplot(2,2,1)
subplot(2,2,2)
subplot(2,2,3)
subplot(2,2,4)
colormap(jet)
% Part c
 subplot(2,2,1)
imagesc(myMagic)
% Part d
subplot(2,2,3)
imagesc(myMagic(5:5:100,10:10:100))
% Part e
subplot(2,2,2)
plot(myMagic)
% Part f
matrixA = myMagic(10:10:100,4:4:100);
matrixB = myMagic(10:10:100,2:4:100);
% Note that we concatenated vertically
matrixConcatenated = [matrixA; matrixB]
subplot(2,2,4);
imagesc(matrixConcatenated);