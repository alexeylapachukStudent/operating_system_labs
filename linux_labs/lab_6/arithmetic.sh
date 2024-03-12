#!/bin/bash

#Zad 1
function division {
  if [ $# -ne 2 ]; then
    echo "Funckja powinna przyjmowac dwa argumenty"
    exit -1
  elif [ $(($1 - $2)) -eq 0 ] || [ $1 -eq 0 -a $2 -eq 0 ]; then
    echo "Mianownik powinnien byc rozny od zera"
    exit -1
  else
    result=$(echo "scale=2; ($1 + $2) / ($1 - $2)" | bc)
    echo "Wynik: $result"
  fi 
}


division $1 $2

#Zad 2

function factorialRec {
    if [ $# -ne 1 ]; then 
      echo "Funckja powinna przyjmowac jeden argument"
      exit -1
    fi

    if [ $1 -eq 1 ] || [ $1 -eq 0 ]; then
      echo 1
    else
      echo "$(($1 * $(factorialRec $(($1 - 1))) ))"
    fi
}

#ciekawy sposob wypisywania wyniku
result_of_factorial_rec=$(factorialRec $1)
echo "Wynik rekurencji: $result_of_factorial_rec"


#Zad 3


function factorialIter {
     if [ $# -ne 1 ]; then 
      echo "Funckja powinna przyjmowac jeden argument"
      exit -1
     fi

    wynik=1

    for ((i=$1; i>=1; i=$(($i - 1)))) 
    do
      if [ $1 -eq 0 ] || [ $1 -eq 1 ]; then
        echo "Wynik rekurencji (iteracyjnie): $wynik"
        break
      else
        wynik=$(($wynik * $i))
      fi
    done

    echo "Wynik rekurencji (iteracyjnie): $wynik"

}

factorialIter $1



#Zad 4


function sumArgs {
  sum=0

  for i in "$@"
  do
    if [[ $i =~ ^-?[0-9]+$ ]]; then
       sum=$(($sum + $i))
    else
       echo "Podany nieprawidlowy agrument"
       exit -1
    fi
  done

  echo "Wynik sumy: $sum"

}
  

sumArgs $@