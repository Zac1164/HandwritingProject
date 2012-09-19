function f = nearestNeighbor(train,test)
for j = 1:1:size(test)(1,2)
	minDiff = abs(train(1) - test(j));
	f(j) = 1;
	for k = 2:1:size(train)(1,2)
		dif = abs(train(k) - test(j));
		if dif < minDiff
			minDiff = dif;
			f(j) = k;
		end
	end
end
