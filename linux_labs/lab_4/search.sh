#!/bin/bash


if [ $# -ne 2 ]; then
    echo "Skrypt powinien przyjmowac 2 argumenty: <sciezka_katologu> <sciezka_katologu_docelowego"
    exit 1
fi

src_dir="$1"
dest_dir="$2"

#Zad 1
echo "Zadanie 1: tworzenie katologu do ktorego wskazuje drugi argument"
mkdir -p "$dest_dir"

#Zad 2
echo "Zadanie 2: wyszukiwanie pliku o rozszerzeniu .txt"
find "$src_dir" -type f -name "*.txt"

#Zad 3
echo "Zadanie 3: wyszukiwanie katologow nazwy ktorych zaczynaja sie na A a B b"
find "$src_dir" -type d -name "[AaBb]*"

#Zad 4
echo "Zadanie 4: wyszukiwanie plikow,ktore maja ustawione uprawnienia do wykonywania i rozszerzenie .sh "
find "$src_dir" -type f -name "*.sh" -perm /a=x

#Zad 5
echo "Zadanie 5: wyszukiwanie pustych plikow ktore maja wlasciciela user"
find "$src_dir" -type f -empty -user student

#Zad 6
echo "Zadanie 6: wyszukiwanie wszystkich dowiazan symbolicznych"
find "$src_dir" -type l

#Zad 7
echo "Zadanie 7: wyszukiwanie plikow nalezacych do grupy user, ktorych rozmiar nie przekracz 1MB"
find "$src_dir" -type f -user student -size -1M

#Zad 8
echo "Zadanie 8: wyszukiwanie wyszystkich plikow wykonywalnych, ktore maja SUID lub SGID"
find "$src_dir" -type f \( -perm /4000 -o -perm /2000 \) -perm /a=x 

#Zad 9
echo "Zadanie 9: wyszukiwanie katalogow z ustawionym Sticky Bit"
find "$src_dir" -type d -perm /1000 

#Zad 10
echo "Zadanie 10: wyszukiwanie plikow zmodyfikowanych w ciagu ostataniej godziny"
find "$src_dir" -type f -cmin -60

#Zad 11
echo "Zadanie 11: wyszukiwanie urzadzen blokowych lub znakowych w katologu /dev/"
find "/dev/" -type b -o -type c

#Zad 12
echo "Zadanie 12: wyszukiwanie wszystkich pustych katologow i ich usuniecie"
find "$src_dir" -type d -empty -exec rmdir {} \;

#Zad 13
echo "Zadanie 13: wyszukiwanie plikow o rozmiarze przekraczjacym 10MB i przniesienie je do wskazywanego przez argument katologu"
find -type f -size +10M -exec mv {} "$dest_dir" \;

#Zad 14
echo "Zadanie 14: wyszukiwanie wszystkich katologow, ktorych nazwa zaczyna sie od Z i kopiowanie je do wskazywanego przez argument katologu"
find -type d -name 'Z*' -exec cp -r {} "$dest_dir" \;
