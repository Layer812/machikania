dim p(6,2)
dim m(6,2)
dim r(8,2)
for i=0 to analog(16)
 rnd()
next

for i=0 to 6
 for j=0 to 2
  p(i,j)=rnd()%200
  r(i,j)=p(i,j)
  m(i,j)=((rnd()%2)*2)-1
 next
next
cls
label lpst
 for i=0 to 7
  line r(i,0), r(i,1),r(i+1,0), r(i+1,1), 0
  line p(i%6,0), p(i%6,1),p((i+1)%6,0), p((i+1)%6,1)
  r(i,0)=p(i%6,0)
  r(i,1)=p(i%6,1)
 next
 wait 1
 for i=0 to 5
  for j=0 to 2
   p(i,j)=p(i,j)+m(i,j)
   if p(i,j)=0 or p(i,j)=200 then 
    m(i,j)=m(i,j)*-1
   endif
  next
 next
goto lpst