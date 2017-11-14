%%%ploting u,v,w %%script 3

u=ncread('wrfout_d01_0001-01-01_00:00:00','U');
v=ncread('wrfout_d01_0001-01-01_00:00:00','V');
w=ncread('wrfout_d01_0001-01-01_00:00:00','W');
N=144;
k=[0:N/2];
fu=plot_spec(u);
fv=plot_spec(v);
fw=plot_spec(w);
fsum=fu+fv+fw;

loglog(k,fu,'r',k,fv,'b',k,fw,'g',k,fsum,'c');
%%,logkhalf,b,'b',logkhalf,c,'g');
title('energy spectrum');