n = input( 'Give size:');
format long g
tStart = tic;
A2=zeros(n,n);
for i=1:n;  %kyria diagwnios
  A2(i,i)=7;
endfor
for i=1:n-1;
  A2(i,i+1)=-4;
endfor
for i=2:n;
  A2(i,i-1)=-4;
endfor
for i=1:n-2;
  A2(i,i+2)=1;
endfor
for i=3:n;
  A2(i,i-2)=1;
endfor
b2=ones(n,1);
b2(1)=4;
b2(n)=4;
b2(2)=0;
b2(n-1)=0;
x0 = 0;
r0 = b2;
p1 = b2;
a1 = dot(r0,r0)/dot(A2*p1,p1);
x1 = x0 + a1*p1;
r1 = b2 - A2*x1;
error = 0.00005;
norma = norm(r1);
k = 1;
while(norma > error)
    k = k +1;
    
    bk = dot(r1,r1)/dot(r0,r0);
    pk = r1 + bk*p1;
    for i = 1:n   %den kanw prakseiw gia ta mhdenika stoixeia tou pinaka
           res(i,1) = 0;
           if i == 1
               start_step = 1;
               end_step = 3; 
           end 
           if i == 2
               start_step = 1;
               end_step = 4;
           end
           if i == 3
               start_step = 1;
               end_step = 5; 
           end
           if (i >= 4 && i < n-2)
               start_step = i-2;
               end_step = start_step + 4;
           end
           if (i == n-2)
              start_step = i-2;
              end_step = n; 
           end
           if (i == n-1)
              start_step = i-2;
              end_step = n; 
           end
           if (i == n)
              start_step = i-2;
              end_step = n; 
           end
           for j = start_step:end_step
               res(i,1) = res(i,1) + A2(i,j)*pk(j,1);
           end
    end 
    ak = dot(r1,r1)/dot(res,pk);
    xk = x1 + ak*pk;
    if(mod(k,n) == 0)
     for i = 1:n   %den kanw prakseiw gia ta mhdenika stoixeia tou pinaka
           res(i,1) = 0;
           if i == 1
               start_step = 1;
               end_step = 3; 
           end 
           if i == 2
               start_step = 1;
               end_step = 4;
           end
           if i == 3
               start_step = 1;
               end_step = 5; 
           end
           if (i >= 4 && i < n-2)
               start_step = i-2;
               end_step = start_step + 4;
           end
           if (i == n-2)
              start_step = i-2;
              end_step = n; 
           end
           if (i == n-1)
              start_step = i-2;
              end_step = n; 
           end
           if (i == n)
              start_step = i-2;
              end_step = n; 
           end
           for j = start_step:end_step
               res(i,1) = res(i,1) + A2(i,j)*xk(j,1);
           end
      end 
      rk = b2 - res;
    else
      rk = r1 - ak*res;
    endif
    norma = norm(rk);
    r0 = r1;
    r1 = rk;
    p1 = pk;
    x1 = xk;
endwhile

disp('Ta pente arxika psifia')
for i=1:5
    x1(i)
end
disp('Ta pente mesaia psifia')
for i=(n/2)-2:(n/2)+2
    x1(i)
end
disp('Ta pente teleutaia psifia')
for i=n-4:n
    x1(i)
end
disp(k);