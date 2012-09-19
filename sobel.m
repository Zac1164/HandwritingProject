function f = sobel(im)
im = im(700:2517,100:size(im)(1,2));
im = im .* imcomplement(im2bw(im,graythresh(im)));
templateX = [3,10,3;0,0,0;-3,-10,-3];
templateY = [3,0,-3;10,0,-10;3,0,-3];
Gx = filter2(templateX,im);
Gy = filter2(templateY,im);
Gx2 = Gx .^2;
Gy2 = Gy .^2;
G = Gx2 + Gy2;
Gintensity = sqrt(G);
Gslant = atan(Gy ./ Gx);
Gfin = zeros(size(Gslant)(1,1),size(Gslant)(1,2));
Gintsum = 0;
for j = 1:1:size(Gslant)(1,1)
	for k = 1:1:size(Gslant)(1,2)
		if Gslant(j,k) > 0 && Gslant(j,k) < 1.6
			Gfin(j,k) = Gslant(j,k) * Gintensity(j,k);
			Gintsum = Gintsum + Gintensity(j,k);
		end
	end
end
f = sum(Gfin(:))/Gintsum;
