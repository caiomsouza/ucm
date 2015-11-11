data uno; 
array x{10}; 
do i=1 to 100; 
do j=1 to 10; 
x{j}=rannor(0); 
end; 
y=rannor(0); 
output; 
end;
run; 

proc glmselect data=uno; 
model y=x1-x10 /selection=stepwise(select=aic);
run;
