%% Setup
% Clear workspace
clear  
% Connect to the first webcam
cam = webcam(1);
%% Single Image
% Take a single image from cam
img = snapshot(cam);
% Display image
imshow(img)       
%% Video
% Loop 30 times
for frames = 1:30        
    % Take single image from cam
    img = snapshot(cam);  
    % Display image
    imshow(img)       
% End loop
end                         