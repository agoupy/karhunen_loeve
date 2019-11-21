% Parameters
z_max=2;
L=1000;
Z=linspace(0,z_max,L)';
corr_length=5;
N_terms=50;

%% K-L decomposition 
terms=kl_exponential(Z,N_terms,corr_length);
terms_num= kl_numerical(Z,N_terms,corr_length,'exponential');

correl_emp=(terms*transpose(terms)); %Correlation empirique
correl_emp_num=(terms_num*transpose(terms_num)); %Correlation empirique
correl_theo=exp(-abs(Z*ones(1,L)-ones(L,1)*transpose(Z))./corr_length); %correlation théorique

%% Plot correlation
[XX,YY]=meshgrid(Z,Z);

close(figure(1))
f1=figure(1);
f1.Position=[876 464 702 366];
mesh(XX,YY,correl_theo-correl_emp)
colorbar;
colormap(brewermap([],'RdYlBu')) %comment if you do not have brewermap
caxis([-0.05 0.05])
title('Truncation error')

close(figure(2))
f2=figure(2);
f2.Position=[1592 522 712 364];
mesh(XX,YY,correl_theo-correl_emp_num)
colorbar;
colormap(brewermap([],'RdYlBu')) %comment if you do not have brewermap
caxis([-0.5 0.5])
title('Total error')
