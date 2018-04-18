graphics_toolkit("qt");

Nr = [1, 2, 4, 8];
Nmeas = 1000;
X = linspace(0, Nmeas, Nmeas);

R0 = 1000;
i0 = 0.01;
u0 = R0 * i0;

S = [];
Hstd = [];
Hmean = [];
for N = Nr
	% measurement noise distributions (norm and uniform)
	v = [[u0 + normrnd(0, 0.2^2)]; [u0 + rand(N, 1)]];
	Hx = [0, 0];
	for vi = 1:2	
		u = v(vi,:);
		Rhat = zeros(1, Nmeas);
		% repeat measurement Nmeas number of times and store in Rhat
		for idx = 1:Nmeas
			T = linspace(0, 1, N);
			u = u0 + randn(N, 1);
			i = i0;

			R = sum(u./i) / N;
			Vr = sum((u - R * i).^2) / N;

			Rhat(idx) = R;
		end
		% calculate histogram of results 
	end 
end

%plot(X, Rhat, "*", X, Rreal); ylim([900 1100]);

input("..");
