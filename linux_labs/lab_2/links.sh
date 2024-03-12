#!/bin/bash

#Zad 1

mkdir $1

cd $1

#Zad 2

mkdir D1 D2 D3 D4
touch D2/F1.txt D3/F1.txt D4/F1.txt

#Zad 3

ln -s /etc/passwd D1/passwd_link

#Zad 4

readlink -f D1/passwd_link

#Zad 5

ln D3/F1.txt D2/F2.txt

#Zad 6

chmod 600 D2/F2.txt

#Zad 7

chown student D2/F2.txt

#Zad 8

chgrp student D3

#zad 9
chmod -x D3

#zad 10

chmod -w D2

#zad 11

chmod -r D4

#zad 12

chmod +t D4

#zad 13
touch ~/$1/D1/scr1.sh
chmod ug+x D1/scr1.sh
chmod o-x D1/scr1.sh


#zad 14
chmod ug+s D1/scr1.sh
