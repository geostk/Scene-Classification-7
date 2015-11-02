function [filterBank,dictionary] = getFilterBankAndDictionary(image_names)

img = cell(length(image_names),1);
filterBank = createFilterBank() ;
alpha = 50;
filter_responses = zeros(alpha*length(image_names),3*length(filterBank));
size(filter_responses)
for i=1:length(image_names)
    img{i} = imread(image_names{i});
    if size(img{i},3)==1
        img{i} = repmat(img{i},[1 1 3]);
    end    
    p = randperm(size(img{i},1)*size(img{i},2),alpha);
    filterResponses = extractFilterResponses(img{i}, filterBank);
%     filterResponses(p(:),:)
    filter_responses((i-1)*alpha+1:i*alpha,:) = filterResponses(p(:),:);
%     imshow(img{i});
end
K = 100;
% filter_responses(3,1)
[~, dictionary] = kmeans(filter_responses, K,'EmptyAction','drop');
dictionary = dictionary';

    
    
