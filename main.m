% Parameters
z_max=1;
Z=linspace(0,z_max,1000)';
corr_length=1;
N_terms=10;

%% K-L decomposition 
terms=kl_exponential(Z,N_terms,corr_length);
terms_num= kl_numerical(Z,N_terms,corr_length,'exponential');


%% Plot sample
figure
Xi=randn(size(terms,2),5);
for i=1:5
    plot(Z,terms*Xi(:,i))
    hold on 
end

figure
for i=1:5
    plot(Z,terms_num*Xi(:,i))
    hold on 
end