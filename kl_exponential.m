function [terms]=kl_exponential(Z,N_terms,corr_length)

%The perturbation here is gaussian with correlation C(x1,x2)=sig2*exp(-abs(x1-x2)/b);
N=floor(N_terms/2); %Number of K-L terms/2
b=corr_length; %Correlation length
sig2=1; %Correlation amplitude (=sigma^2)
L=length(Z);
H=Z(L);
% Used to test with b=1 like Spanos, Le Maitre
% sig2=1;
% b=1;
% Z=transpose(0:(1/(L-1)):1); 
% H=1;

%Pulsations
omega=[];
f1=@(x) (1-b*x*tan(x*H/2))^2; %minimize f^2 to find zeros of f
f2=@(x) (b*x+tan(x*H/2))^2;
for i=1:N
    options = optimset('TolFun',1e-9,'TolX',1e-9);
    omega=[omega fminbnd(f1,(i-1)*2*pi/H,pi/H+(i-1)*2*pi/H,options) fminbnd(f2, pi/H+(i-1)*2*pi/H,2*pi/H+(i-1)*2*pi/H,options)];
end

%eigenvalues
lambda=sig2*2*b./(1+(omega.*b).^2);

%K-L approximation
%seperate odd and even terms
omegae=omega(2:2:end);
omegao=omega(1:2:end);
lambdae=lambda(2:2:end);
lambdao=lambda(1:2:end);

omegaez=repmat(omegae,[L,1]);lambdaez=repmat(lambdae,[L,1]);
omegaoz=repmat(omegao,[L,1]);lambdaoz=repmat(lambdao,[L,1]);
eventerms = @(z) sqrt(lambdaez).*sin(omegaez.*(z-H/2))./sqrt(H/2-sin(H*omegaez)./(2*omegaez));
oddterms = @(z) sqrt(lambdaoz).*cos(omegaoz.*(z-H/2))./sqrt(H/2+sin(H*omegaoz)./(2*omegaoz));


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Correlation and error estimation
terms=[oddterms(repmat(Z,1,N)) eventerms(repmat(Z,1,N))];
correl_emp=(terms*transpose(terms)); %Correlation empirique
correl_theo=sig2*exp(-abs(Z*ones(1,L)-ones(L,1)*transpose(Z))./b); %correlation théorique
err=max(max(abs(correl_emp-correl_theo))); %bound the error

disp(['K-L decomposition with ' num2str(2*N) ' terms'])
disp(['Truncation error on the covariance function: ' num2str(err)])

end