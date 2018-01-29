% Parameters
z_max=1e3;
Z=linspace(1,z_max,1000)';
corr_length=500;
N_terms=20;

% K-L decomposition 
terms=kl_exponential(Z,N_terms,corr_length);

% Plot sample
figure
for i=1:5
    Xi=randn(size(terms,2),1);
    plot(terms*Xi)
    hold on 
end