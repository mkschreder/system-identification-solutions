graphics_toolkit("qt");

Nr = [10, 100, 1000, 10000];
Nsets = 100;
X = linspace(0, Nsets, Nsets);
Rhat = zeros(1, Nsets);
Rreal = ones(1, Nsets) * 1000;

S = [];
for N = Nr
	for idx = 1:Nsets
		T = linspace(0, 1, N);
		i0 = 0.01;
		R0 = 1000;
		u0 = R0 * i0;
		u = u0 + randn(N, 1);
		i = i0;

		R = sum(u./i) / N;
		Vr = sum((u - R * i).^2) / N;

		Rhat(idx) = R;
	end

	S = [S std(Rhat)];
end

%plot(X, Rhat, "*", X, Rreal); ylim([900 1100]);
loglog(Nr, S);

input("..");
