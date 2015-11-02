function [wordMap] = getVisualWords(I, filterBank, dictionary)

 if size(I,3)==1
     img = repmat(I,[1 1 3]);
 else
     img = I;
 end
 
 filterResponses = extractFilterResponses(img,filterBank);
 
 dist2 = pdist2(dictionary',filterResponses);
 [~,column] = min(dist2);
 wordMap = reshape(column',size(I,1),size(I,2));

%  wordMap = zeros(size(I,1),size(I,2));
%  
%  
%  if size(I,3)==1
%      img = repmat(I,[1 1 3]);
%  else
%      img = I;
%  end
%  
%  filterResponses = extractFilterResponses(img,filterBank);
%  
%  for i=1:size(filterResponses,1)
%      pixelResponse = filterResponses(i,:);
%      dist =bsxfun(@minus,dictionary,pixelResponse');
%     dist2 = sqrt(sum(dist .* dist));
% %      dist2 = pdist2(pixelResponse,dictionary');
%      [mindist, column] = min(dist2);
%      wordMap(i) = column;

imagesc(wordMap);

end



