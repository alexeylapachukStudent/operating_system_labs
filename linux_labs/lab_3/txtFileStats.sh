#!/bin/bash

#1

if [ "$#" -ne 2 ]; then
 echo "Zawartosc skryptu powinna byc nastepujaca: $0 <scizka_do_pliku> <slowo_kluczowe>"
 exit 1
fi

echo "1. Sposob kodowania pliku tekstowego:"
file -i "$1"

#2

echo "2. Wyswietlania liczbe linijek pliku tekstowego:"
wc -l "$1"

#3

echo "3. Wyswietlanie liczby wszystkich znakow w pliku tekstowym:"
wc -m "$1"

#4

echo "4. Wyswietlanie rozmiaru pliku latwo rozumianego dla czlowieka:"
du -h "$1"

#5

echo "5. Wyswietlanie liczby linijek w ktorych 'slowo klucz' wystepuje:"
grep "$2" "$1" | wc -l

#6

echo "6. Wyswietlanie liczby linijek w ktorych 'slowo klucz' nie wystepuje:"
grep -v "$2" "$1" | wc -l

#7

echo "7. Wyswietlanie piatej linijki pliku tekstowego:"
cat "$1" | head -n 5 | tail -n 1
