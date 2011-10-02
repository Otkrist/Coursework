% Advanced Program to model addition color channels of light sources as a matrix operations %

image1 = 'IMG_2023.JPG';
image2 = 'IMG_2024.JPG';
image3 = 'IMG_2025.JPG';

A1 = imread(image1);
A1 = im2double(A1);
%A1 = imresize(A1,4);

A2 = imread(image2);
A2 = im2double(A2);
%A2 = imresize(A2,4);

A3 = imread(image3);
A3 = im2double(A3);
%A3 = imresize(A3,4);

[I1,I2,I3] = split(A1);
[I4,I5,I6] = split(A2);
[I7,I8,I9] = split(A3);

FMAT1=@(A)((A*A+2*A+eye(3,3))*[1;1;1])
FMAT2=@(A)((A*A-2*A+eye(3,3))*[1;1;1])
FMAT3=@(A)((A*A*A-3*A*A+3*A-eye(3,3))*[1;1;1])
F1=@(a1,a2,a3)([a1,a2,a3]*[1;1;1]);
F2=@(a1,a2,a3)([a1,a2,a3]*[[0;0.33;0],[0.33;0;0.33],[0;0.33;0]]*[1;1;1]);
F3=@(a1,a2,a3)(FMAT1([a1,a2,a3]))
F4=@(a1,a2,a3)(FMAT2([a1,a2,a3]))
F5=@(a1,a2,a3)(FMAT3([a1,a2,a3]))
F6=@(a,d)( a(d)^2/(a(1)^2+a(2)^2+a(3)^2+0.000001) ); % Use this to normalize %
 

%[A] = advanced_extension(I1,I5,I9,F1);
%imshow(A);
%imwrite(A,'advanced_result1.png','png');

[A] = advanced_extension(I1,I5,I9,F2);
imshow(A);
imwrite(A,'advanced_result2_1.png','png');

[A] = advanced_extension(A1,A2,A3,F2);
[A] = extension(A,A,A,F6);
imshow(A);
imwrite(A,'advanced_result2_2.png','png');

[A] = advanced_extension(I1,I5,I9,F3);
[A] = extension(A,A,A,F6);
imshow(A);
imwrite(A,'advanced_result3_1.png','png');

[A] = advanced_extension(A1,A2,A3,F3);
[A] = extension(A,A,A,F6);
imshow(A);
imwrite(A,'advanced_result3_2.png','png');

[A] = advanced_extension(I1,I5,I9,F4);
[A] = extension(A,A,A,F6);
imshow(A);
imwrite(A,'advanced_result4_1.png','png');

[A] = advanced_extension(A1,A2,A3,F4);
[A] = extension(A,A,A,F6);
imshow(A);
imwrite(A,'advanced_result4_2.png','png');

[A] = advanced_extension(I1,I5,I9,F5);
[A] = extension(A,A,A,F6);
imshow(A);
imwrite(A,'advanced_result5_1.png','png');

[A] = advanced_extension(A1,A2,A3,F5);
[A] = extension(A,A,A,F6);
imshow(A);
imwrite(A,'advanced_result5_2.png','png');
