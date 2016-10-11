% Convert input image to 8-bit unsigned integers
% Calculates the Mean of Red, Green, Blue Channels
% Calculates the corrected images and light components
outDir = fullfile('.', 'output');
if ~exist(outDir, 'file')
mkdir(outDir);
end
InputImage = imread('wb_sardmen-incorrect.jpg');
InputImage = im2uint8(InputImage);
% Allocate memory for the image
outputImage = zeros(size(InputImage,1), size(InputImage,2), 3);
%Calulate Mean of the respective Channels
meanRedChannel = mean(mean(InputImage(:,:,1)));
meanGreenChannel = mean(mean(InputImage(:,:,2)));
meanBlueChannel = mean(mean(InputImage(:,:,3)));
%Calulate Light L components
LRed = meanRedChannel/128;
Lblue = meanBlueChannel/128;
LGreen = meanGreenChannel/128;
%White Balance Image
outputImage(:,:,1) = InputImage(:,:,1)*(1/LRed);
outputImage(:,:,2) = InputImage(:,:,2)*(1/LGreen);
outputImage(:,:,3) = InputImage(:,:,3)*(1/Lblue);
outputImage = uint8(outputImage);
outimageName = sprintf(['wb_sardmen.jpg' '-corrected.jpg']);
outimageName = fullfile(outDir, outimageName);
imwrite(outputImage, outimageName);
fprintf( 'Light(l) components l(r),l(b),l(g) %4.2f %4.2f %4.2f are',LRed,Lblue,LGreen);
figure();
imagesc(outputImage); axis image off;