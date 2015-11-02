


load('../dat/traintest.mat','train_imagenames','mapping','train_labels');
load('dictionary.mat','filterBank','dictionary');

l = length(train_imagenames);
for i=1:l
    load(strcat('../dat/',strrep(train_imagenames{i},'.jpg','.mat')),'wordMap');
    train_features(:,i) = getImageFeaturesSPM(3, wordMap, size(dictionary,2));

end

% save('dictionary.mat','filterBank','dictionary');
save('vision.mat','filterBank','dictionary','train_features','train_labels');