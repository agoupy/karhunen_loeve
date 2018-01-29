function [P]=poly1D(deg,type)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Compute the polynomials of a given type
%from degree 0 to deg.
%Available types are: -Hermite probabilists
%                     -Hermite physicists
%                     -Legendre
%
%Input: -deg: maximum degree
%       -type: can be 'hermite-prob'
%                  or 'hermite-phys'
%                  or 'legendre'
%
%Output: -P:array, P{i} polynomials of degree i-1
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

deg=max(deg,0); %deg must be positive
P=cell(deg+1,1);

if strcmp(type,'hermite-prob')
    
    if deg==0 
        P{1}=1; 
    else
        P{1}=1;
        P{2}=[1 0];
        for i=2:deg+1 %recurrence relation
            P{i+1}=[P{i} 0]-(i-1)*[0 0 P{i-1}];
        end
    end
        
elseif strcmp(type,'hermite-phys')
    
    if deg==0 
        P{1}=1; 
    else
        P{1}=1;
        P{2}=[2 0];
        for i=2:deg+1 %recurrence relation
            P{i+1}=[2*P{i} 0]-2*(i-1)*[0 0 P{i-1}];
        end
    end
    
elseif strcmp(type,'legendre')
    
    if deg==0 
        P{1}=1; 
    else
        P{1}=1;
        P{2}=[1 0];
        for i=2:deg+1 %recurrence relation
            P{i+1}=1/i*([(2*i-1)*P{i} 0]-(i-1)*[0 0 P{i-1}]);
        end
    end
    
else
    disp('Unknown type of polynomials');
    P={};
end

end