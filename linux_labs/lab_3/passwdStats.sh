#!/bin/bash

if [ "$#" -ne 1 ]; then
 echo "Zawartosc skryptu powinna byc nastepujaca: $0 <scizka_do_katalogu"
 exit 1
fi

#1

mkdir -p $1

#2

aktualny_uzytkownik=$(whoami)
grep $aktualny_uzytkownik /etc/passwd 

#3

cut -d ':' -f 1,6,7 /etc/passwd | sort -r > "$1/F1.csv"

#4

cut -d ':' -f 7 /etc/passwd | rev | sort | uniq | rev > "$1/F2.csv"

#5

cut -d ':' -f 1 /etc/passwd | tr 'a-z' 'A-Z' > "$1/F3.txt"

#6

grep -A4 -B4 $aktualny_uzytkownik /etc/passwd > "$1/F4.txt"

#7

diff -y /etc/passwd "$1/F4.txt" > "$1/differences.txt"

echo "Koniec pracy skryptu"