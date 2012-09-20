function f = baseline(im)
im = im(700:2517,100:size(im)(1,2));
imbw = imcomplement(im2bw(im,graythresh(im)));
im90 = rot90(imbw);
dist = sum(im90);
current = 0;
current_max = 0;
current_max_location = 0;
k = 1;
for j = 1:1:size(dist)(1,2)
	current = dist(j);
	if current > current_max
		current_max = current;
		current_max_location = j;
	end
	if current_max > 50 && current <= 10
		max_mat(k) = current_max_location;
		current_max = 0;
		current_max_location = j;
		k = k + 1;
	end
end
bar(dist);
f = max_mat;
