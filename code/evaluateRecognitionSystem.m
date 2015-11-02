

load('../dat/traintest.mat');
C = zeros(8,8);

l = length(test_imagenames);
for k=1:l
    guessedImage = guessImage(strcat('../dat/',test_imagenames{k}));
    j = find(strcmp(mapping,guessedImage));
    i = test_labels(k);
    C(i,j) = C(i,j) +1;
    if(i ~= j)
        fprintf('wrong: %s -> %s\n',test_imagenames{k},guessedImage);
    end
end
C
accuracy = trace(C) / sum(C(:))