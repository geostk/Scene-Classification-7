function [h] = getImageFeaturesSPM(layerNum, wordMap, dictionarySize)
[H ,W] = size(wordMap);
% h=zeros(dictionarySize*((4^layerNum-1)/3,1);
L = layerNum-1;
store = cell(2^L,2^L,layerNum);
h=[];

for l = L:-1:0
%     temp_h = cell(2^l,2^l);
    if l==0 || l==1
        weight = 1/(2^L);
    else
        weight = 2^(l-L-1);
    end
    for r = 1:2^l
        for c = 1:2^l
            if l==L
                temp_h = getImageFeatures(wordMap(floor(H/(2^l)*(r-1)+1):floor(H/(2^l)*r),floor(W/(2^l)*(c-1)+1):floor(W/(2^l)*c)),dictionarySize);
                store{r,c,l+1} = temp_h;
            else
                store{r,c,l+1} = store{2^r-1,2^c-1,l+2}+ store{2^r,2^c-1,l+2}+ store{2^r-1,2^c,l+2}+ store{2^r,2^c,l+2};
            end
            h = vertcat(h,store{r,c,l+1}*weight);
        end
    end
end

h = h/sum(h);
    
    