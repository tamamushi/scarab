<!-- vim: set ts=4 expandtab: -->

## $B%7%9%F%`4D6-$N%=!<%9%3!<%I(B

$B3+H/4D6-$d%F%9%H7OEy(Bpublic$B$K;/$7$F$bLdBj$N$J$$%$%s%U%i7O%$%a!<%8:n@.;~$K(B
$B;H$C$?%=!<%9%3!<%I$rJ]4I$7$F$$$^$9!#$"$/$^$G%=!<%9%3!<%I$N$_$NJ]4I>l=j$H(B
$B$7$F;H$$$^$9!#(B
<br>
$B%$%a!<%82=$7$?$b$N$O$=$l@lMQ$N%l%]%8%H%j$J$j!"<+J,$N4D6-Fb$KJ];}$9$k$h$&(B
$B$K$7$F$/$@$5$$!#4V0c$C$F$b$3$N%l%]%8%H%j$KEPO?$7$?$j$7$J$$$h$&$K5$$r$D$1(B
$B$^$7$g$&!#(B

### $B8=:_M-8z$J%=!<%9%3!<%I(B

Docker 
- centos-lnmx
CentOS 6.7$B!J(BPacker$B$+$iFH<+$G:n@.$7$?$b$N!K(B<br>
MySQL 5.7.12<br>
HHVM 3.2.0 $B!J(BPHP$B2>A[<B9T4D6-!K(B<br>

MySQL$B$O8x<0$N(Bdocker-entorypoint.sh$B$r;H$&0Y!"(B5.7.12$B$r;HMQ!#(B
5.7.6$B0J9_$+$i!"=i4|2=$,(Bmysql_install_db$B$+$i(B'''mysqld --initialize'''$B$K(B
$BJQ99$K$J$C$?!#(B

docker-entrypoint.sh$B$r8x<0$N:G?7HG$rMxMQ$7$F:n@.$7$?0Y(Bdocker-entrypoint.sh$B$N(B
$BCf$G(B'''mysqld --initialize-insecure'''$B$r;H$C$F$$$k2U=j$,M-$j!"(BMySQL$B$N%P!<%8%g%s(B
$B$O(B5.7.6$B0J9_$N%P!<%8%g%s$H$7$?!#(B
$BJdB-!'$h$/9M$($?$i(B5.6$B$N%P!<%8%g%s;H$C$F$k(BMySQL$B$N(Bdocker$B%$%a!<%8$,M-$k$o$1(B
$B$@$+$i$=$C$A$N(Bdocker-entrypoint.sh$B$J$i5lMh$N$d$jJ}$J$s$8$c$J$$$+!)$H;W$$(B
$B3NG'$7$F$_$?$i$d$C$Q$=$&$@$C$?!#8=;~E@!J(B2016$BG/(B5$B7n(B1$BF|!K$G!"(B
'''mysqld --initialize-insecure'''$B$,$I$NDxEY$3$J$l$F$k$N$+$OITL@$@$,!"(B
$B$^!<:#8e$O$3$l$,%9%?%s%@!<%I$K$J$k$O$:$J$N$G!"NI$7$H$9$k!#(B

Vagrant


