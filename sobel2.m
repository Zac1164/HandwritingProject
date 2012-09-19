fid = fopen("dataset1.txt");
count = 1;
while !feof(fid)
	im = imread(fgetl(fid));
	data(count) = sobel(im);
	count = count + 1;
end
fclose(fid);
fid = fopen("dataset2.txt");
count = 1;
while !feof(fid)
	im = imread(fgetl(fid));
	data2(count) = sobel(im);
	count = count + 1;
end
fclose(fid);
solution = nearestNeighbor(data, data2)
