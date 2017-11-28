%%script 2.2

function x=plot_spec2(w)

%%%%%energyspec_wrf.m is used for getting energy spectrum k=1:N/2
%%%this script is for plotting....k has to *N/distance
%%%time?
time=21;
ph=ncread('wrfout_d01_0001-01-01_00:00:00','PH');
phb=ncread('wrfout_d01_0001-01-01_00:00:00','PHB');
z=(ph+phb)/9.8;
z=z(:,:,:,time);  %%time 21
n=size(z);
nx=n(1);
nz=n(3);
ny=n(2);
[row,col] = find(z>4999 & z<5001);

avgy_w=zeros(nx,nz);
flu_w=zeros(nx,ny,nz);
for i=1:nx
for k=1:nz
    avgy_w(i,k)=sum(w(i,:,k))/ny;
end 
end

for j=1:ny
    for i=1:nx
        for k=1:nz
   %flu_w(:,j,:)=w(:,j,:)-avgy_w
   flu_w(i,j,k)=w(i,j,k)-avgy_w(i,k);
        end
    end
end
maxind=[0,0];
ncol=size(col);
ncol=ncol(2);
nrow=size(row);
nrow=nrow(2);
maxflu=0;
for r=1:nrow
    for c=1:ncol
        if flu_w(row(r),col(c))>maxflu
        maxind=[r,c];
        flu_w(row(r),col(c))=maxflu;
        end       
    end
end


x=energyspec_wrf(w,maxind(1),maxind(2),21);


end