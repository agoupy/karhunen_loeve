function [terms] = kl_numerical (Z,N_terms,corr_length,type)

b=corr_length;
L=length(Z);
Z=Z-1;

% Type of covariance kernel
switch type
    case 'exponential'
        covar=@(x,y) exp_cov(x,y,b);
    case 'sine'
        covar=@(x,y) sine_cov(x,y,b);
end

% Polynomial-basis
P=poly1D(N_terms,'legendre');
pol=zeros(L,N_terms);
for i=1:N_terms
    pol(:,i)=polyval(P{i},Z);
end

% Compute matices A and B
A=zeros(N_terms);
B=zeros(N_terms);
[XX,YY]=meshgrid(Z,Z);
for i=1:N_terms
    for j=1:N_terms
        A(i,j)=trapz(Z,trapz(Z,covar(XX,YY).*polyval(P{i},XX).*polyval(P{j},YY)));
        B(i,j)=trapz(Z,pol(:,i).*pol(:,j));
    end
end

% Find eigenvalues and functions
% [~,EV,EF]=eig(A,B);
% EV=diag(EV);
[EF,D] = eig(A,B);
EV=diag(B*EF*D/(B*EF));

% Compute KL terms
terms=zeros(L,N_terms);
for i=1:N_terms
    terms(:,i)=sum(repmat(transpose(EF(:,i)),L,1).*pol,2);
end
terms=repmat(transpose(sqrt(EV)),L,1).*terms;
end