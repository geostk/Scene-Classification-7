
load('dictionary.mat','filterBank','dictionary');
imageName = '../dat/rainforest/sun_amghbouohxidgjvr.jpg';
img = imread(imageName);
str = strsplit(imageName,'/');
wordMap = getVisualWords(img, filterBank, dictionary);
figure;
subplot(1,2,1);
imagesc(img);
axis image;
set(gca,'YTickLabel',[]);
set(gca,'XTickLabel',[]);
ylabel(str(3),'FontSize',20);
subplot(1,2,2);
imagesc(wordMap);
axis image;
set(gca,'YTickLabel',[]);
set(gca,'XTickLabel',[]);
