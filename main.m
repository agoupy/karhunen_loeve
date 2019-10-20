% Parameters
z_max=2;
L=1000;
Z=linspace(0,z_max,L)';
corr_length=1;
N_terms=20;

%% K-L decomposition 
terms=kl_exponential(Z,N_terms,corr_length);
terms_num= kl_numerical(Z,N_terms,corr_length,'exponential');

correl_emp=(terms*transpose(terms)); %Correlation empirique
correl_emp_num=(terms_num*transpose(terms_num)); %Correlation empirique
correl_theo=exp(-abs(Z*ones(1,L)-ones(L,1)*transpose(Z))./corr_length); %correlation théorique

%% Plot correlation
[XX,YY]=meshgrid(Z,Z);

mesh(XX,YY,correl_theo)
hold on
mesh(XX,YY,correl_emp)
mesh(XX,YY,correl_emp_num)