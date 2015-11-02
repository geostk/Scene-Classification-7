img = imread('/Users/judy/Documents/Fall2015/CV/16720/homework1/dat/campus/sun_abslhphpiejdjmpz.jpg');

% if image is in grayscale -> duplicate to 3 channel
if size(img,3)==1
    img = repmat(img,[1 1 3]);
end

filterBank = createFilterBank();

[filterResponses] = extractFilterResponses(img,filterBank);

% display = zeros(3,4,3);
display = cell(12,1);

figure
for i=1:4
    for j=1:3
        display{(i-1)*4+j} = reshape(filterResponses(:,(i-1)*15+j),[size(img,1) size(img,2)]);
        subplot(4,3,(i-1)*3+j);
        str = [ '(' num2str((i-1)*3+j) ')' ];
%          subimage(display{(i-1)*4+j});
          imagesc(display{(i-1)*4+j});
        
        set(gca,'YTickLabel',[]);
        set(gca,'XTickLabel',[]);
        
        title(str);        
    end
end
% GL = reshape(filterResponses(:,1),[size(img,1) size(img,2)]);
% Ga = reshape(filterResponses(:,2),[size(img,1) size(img,2)]);
% Gb = reshape(filterResponses(:,3),[size(img,1) size(img,2)]);
% LL = reshape(filterResponses(:,16),[size(img,1) size(img,2)]);
% La = reshape(filterResponses(:,17),[size(img,1) size(img,2)]);
% Lb = reshape(filterResponses(:,18),[size(img,1) size(img,2)]);
% xL = reshape(filterResponses(:,31),[size(img,1) size(img,2)]);
% xa = reshape(filterResponses(:,32),[size(img,1) size(img,2)]);
% xb = reshape(filterResponses(:,33),[size(img,1) size(img,2)]);
% yL = reshape(filterResponses(:,46),[size(img,1) size(img,2)]);
% ya = reshape(filterResponses(:,47),[size(img,1) size(img,2)]);
% yb = reshape(filterResponses(:,48),[size(img,1) size(img,2)]);

% 
% figure
% subplot(4,3,1)
% subimage(GL)
