function [h] = getImageFeatures(wordMap,dictionarySize)

histgram = hist(wordMap(:),dictionarySize);
h = histgram'/sum(histgram);
