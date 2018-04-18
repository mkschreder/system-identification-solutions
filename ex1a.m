graphics_toolkit("qt");

N = 1000;
Nsets = 100;
X = linspace(0, Nsets, Nsets);
Rhat = zeros(1, Nsets);
Rreal = ones(1, Nsets) * 1000;

for idx = 1:Nsets
	T = linspace(0, 1, N);
	i0 = 0.01 - 0.02 * rand(N, 1);
	R0 = 1000;
	u0 = R0 * i0;
	u = u0 + normrnd(0, 1, N, 1);
	i = i0;

	R = sum(u.*i)/sum(i .* i);

	D = sum((u - R * i).^2) / N;

	Rhat(idx) = R;
end

plot(X, Rhat, "*", X, Rreal);
ylim([900 1100])
input("..");
