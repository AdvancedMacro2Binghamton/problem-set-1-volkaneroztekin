                          %HOMEWORK 1

I=1.124; %I is inflation rate

W=NW/I; %NW is Net Worth and W is wealth

E=(WAGEINC+BUSSEFARMINC)/I;   %E is earnings

i=WAGEINC+TRANSFOTHINC+SSRETINC+KGINC+INTDIVINC+BUSSEFARMINC;  %i is income


Perc=[0,1,5,10,20,40,60,80,90,95,99,100]; %percentiles


while n<13

    Wperc(n)=wprctile(W,Perc(n),WGT)/1000;
    
    Eperc(n)=wprctile(E,Perc(n),WGT)/1000;
    
    iperc(n)=wprctile(i,Perc(n),WGT)/1000;
    
    a=a+1;
end


W_covar=sqrt(var(W,WGT))/(wmean(W,WGT));

E_covar=sqrt(var(E,WGT))/(wmean(E,WGT));

i_covar=sqrt(var(i,WGT))/(wmean(i,WGT));



gini(wealth)=gini(W,WGT,true);

plot(gini(wealth))


gini(earn)=gini(E,i,true);

plot(gini(earn))



gini(income)=gini(i,WGT,true);

plot(gini(income))
%gini coefficient


M=[W,E,i,WGT];

x=log(M(M(:,2)>0,:));

y=log(M(M(:,3)>0,:));

z=log(M(M(:,1)>0,:));



Wealthlog=var(z,exp(z(:,1)));

Earnlog=var(x,exp(x(:,1)));

incomelog=var(y,exp(y(:,1)));
%log of variation