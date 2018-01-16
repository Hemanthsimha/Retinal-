[fn pn]=uigetfile('*.jpeg;*.jpg;*.tiff','select image');
im = sprintf('%s%s',pn,fn);
I = imread(im);
igreen = I(:,:,2)
ired = I(:,:,1)
iblue = I(:,:,3)
%imtool(ired)
%imtool(iblue)
%imtool(igreen)
%imtool(I)
P=imresize(I, [384 365]) 
ima = im2double(P)
%imtool(ima)
ima2gray=rgb2gray(ima)
imhist(ima2gray)
%histo=adapthisteq(ima2gray,'clipLimit',0.05,'Distribution','rayleigh');
%imtool(histo)
%imtool(ima2gray)
 s = 1.5;
 y = [-6: 6];
G = getVasculatureMatchedFilterResponse(igreen, y, s)
R = getVasculatureMatchedFilterResponse(ired, y, s)
B = getVasculatureMatchedFilterResponse(iblue, y, s)
imtool(R)
imtool(G)
imtool(B)
preoutput =xor(R,B)
output=~xor(preoutput,G)
imtool(preoutput)
imtool(output)

