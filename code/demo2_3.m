
load('../dat/traintest.mat','train_imagenames','mapping','test_imagenames');
load('dictionary.mat','filterBank','dictionary');

l = length(train_imagenames);
for i=1:l
    load(strcat('../dat/',strrep(train_imagenames{i},'.jpg','.mat')),'wordMap');
    histograms(:,i) = getImageFeaturesSPM(3, wordMap, size(dictionary,2));
end

load(strcat('../dat/',strrep(test_imagenames{2},'.jpg','.mat')),'wordMap');
wordHist = getImageFeaturesSPM(3,wordMap, size(dictionary,2));
histInter = distanceToSet(wordHist, histograms);
[dist col] = max(histInter);
figure;
str = strcat('../dat/',train_imagenames{col});
imshow(str);
figure;
str1 = strcat('../dat/',test_imagenames{2});
imshow(str1);
