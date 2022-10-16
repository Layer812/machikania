REM reino count down : Layer8
REM GLOBAL
REM first number to count down
x=101
REM 1sample = 19us
z=19
REM flags
f=0
u=0
REM SCRINIT
dim b(8,5)
dim n(10,8)
GCLS
RESTORE BARDATA
for i=0 to 8
 for j=0 to 5
  b(i,j)=READ()
 next
next
RESTORE NUMDATA
for i=0 to 9
 for j=0 to 8
  n(i,j)=READ()
 next
next
palette 4,191,160,2
palette 5,252,195,6
INTERRUPT DRAWCOUNT,CWD
REM MAIN
I2C 3000
fopen "morning2.vgm","r"
WHILE 1
 fseek $100
 WHILE 1
  USETIMER z
  w=0
  c=fgetc()
  if c=$A0 then
   a=fgetc(): d=fgetc()
   I2CWRITE $50,a,d
  elseif C=$D2 then
   p=fgetc(): a=fgetc(): d=fgetc()
   if p=1 then
    a=a+$A0
   elseif p=2 then
    a=a+$AA
   elseif p=3 then
    a=$AF
   endif
   I2CWRITE $51,a,d
  elseif C=$51 then
   a=fgetc(): d=fgetc()
  elseif C=$61 then
   a=fgetc(): d=fgetc()
   w=d*256+a
  elseif C=$62 then
   w=735
  elseif C=$63 then
   w=882
  elseif C>$6F and c<$80 then
   w=C-$6F
  else
   goto ENDING
  endif
  if f=1 then goto ENDING
  if w>0 then
   while timer() < w
   wend
  endif
 WEND
WEND
LABEL ENDING
 wait 60
 gcls
 gprint 80,80,4,0,"TIMER OK"
 wait 60
 I2CWRITE $50,$07,$3F
 I2CWRITE $51,$AF,$00
 gcls
 for i = 0 to 20
  line i*10, 0, i*10, 200
  line 0, i*10, 200, i*10
 next
return
REM coun down intterupt
LABEL CWD
 if (DRAWCOUNT() % 60) > 0 then return
 x=x-1
 if x<0 then
  f=1
 else
   gosub disp
 endif
 return
REM update count down
LABEL DISP
 k=x/10%10:l=x%10
 gcls
 for i = 1 to 8
  boxfill b(n(k,i),1)+5, b(n(k,i),2)+5, b(n(k,i),3)+5, b(n(k,i),4)+5,4
  boxfill b(n(k,i),1), b(n(k,i),2), b(n(k,i),3), b(n(k,i),4),5
 next
 for i = 1 to 8
  boxfill b(n(l,i),1)+5+90, b(n(l,i),2)+5, b(n(l,i),3)+90+5, b(n(l,i),4)+5,4
  boxfill b(n(l,i),1) + 90, b(n(l,i),2), b(n(l,i),3) + 90, b(n(l,i),4),5
 next
 u=0
return
REM DATABLOCK
LABEL BARDATA
DATA 300,300,300,300,300,0
DATA 1,40,40,90,50,0
DATA 2,30,50,40,100,0
DATA 3,90,50,100,100,0
DATA 4,40,100,90,110,0
DATA 5,30,110,40,160,0
DATA 6,90,110,100,160,0
DATA 7,40,160,90,170,0
LABEL NUMDATA
DATA 0,1,2,3,5,6,7,0,0
DATA 1,3,6,0,0,0,0,0,0
DATA 2,1,3,4,5,7,0,0,0
DATA 3,1,3,4,6,7,0,0,0
DATA 4,2,3,4,6,0,0,0,0
DATA 8,1,2,4,6,7,0,0,0
DATA 6,1,2,4,5,6,7,0,0
DATA 7,1,3,6,0,0,0,0,0
DATA 8,1,2,3,4,5,6,7,0
DATA 9,1,2,3,4,6,7,0,0
