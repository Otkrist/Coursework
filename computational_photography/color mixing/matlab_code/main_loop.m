%image1 = 'moon1.jpeg';
%image2 = 'moon2.png';
%image1 = 'apple.jpg';

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

%A2 = imread(image2);
%I1 = A1;
%imshow(A1);
%imshow(A2);

[I1,I2,I3] = split(A1);
[I4,I5,I6] = split(A2);
[I7,I8,I9] = split(A3);

F1=@(a,d)(a(d));
F2=@(a,d)( a(d)^2/(a(1)^2+a(2)^2+a(3)^2+0.000001) );
F3=@(a,d)( cos(a(d)) )
F4=@(a,d)( ternary(a(d) == max(a),a(d),0) )
F5=@(a,d)( ternary(a(d) == min(a),a(d),0) ) 


[A] = extension(I1,I5,I9,F1);
imshow(A);
imwrite(A,'simple_result1.png','png');

[A] = extension(I1,I5,I9,F2);
imshow(A);
imwrite(A,'simple_result2.png','png');

[A] = extension(I1,I5,I9,F3);
imshow(A);
imwrite(A,'simple_result3.png','png');

[A] = extension(I1,I5,I9,F4);
imshow(A);
imwrite(A,'simple_result4.png','png');

[A2] = extension(I1,I5,I9,F5);
imshow(A2);
imwrite(A2,'simple_result5.png','png');

imshow(A+A2);
imwrite(A+A2,'simple_result6.png','png');

