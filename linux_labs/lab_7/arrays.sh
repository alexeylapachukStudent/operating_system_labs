#!/bin/bash


#Zad 1

function buble_sort {
  tab=("$@")
  
  for arg in ${tab[@]}; do
     if ! [[ $arg =~ ^[+-]?[0-9]+([.][0-9]+)?$ ]]; then
      echo "Argumenty musz byc liczbami calkowitymi"
      exit -1
     fi
   done

  n=${#tab[@]}

  for ((i=0;i < n - 1;i++)); do
    for ((j=0;j < n - i - 1;j++)); do
      if [ ${tab[j]} -gt ${tab[j + 1]} ]; then
        temp=${tab[j]}
        tab[j]=${tab[j + 1]}
        tab[j+1]=$temp
      fi
    done
   done

   echo "Wynik sortowania:" "${tab[@]}"


}

#buble_sort $@


#Zad 2

function two_sized {
    if [ $# -ne 2 ]; then
      echo "Funkcja powinna przyjmowac doklandie dwa argumenty"
      exit -1
    fi

    table_of_rowsandcols=("$@")

    rows=${table_of_rowsandcols[0]}
    columns=${table_of_rowsandcols[1]}


    if ! [[ $rows =~ ^[1-9][0-9]*$ ]] || ! [[ $columns =~ ^[1-9][0-9]*$ ]]; then
      echo "Argumenty powinne byc liczbami calkowitymi i dodatnimi"
      exit -1
    fi

    declare -A myArray

    for ((i=1;i <= rows;i++)); do
      for ((j=1; j <= columns;j++)); do
        myArray[$i, $j]=$((i * j))
      done
    done


    for ((i=1;i <= rows;i++)); do
      for ((j=1; j <= columns;j++)); do
        printf "%-4s" "${myArray[$i, $j]}"
      done
     echo
    done

}

#two_sized $@

#Zad 3

function calka {

   if [ $# -lt 3 ]; then
     echo "Funkcja powwinna przyjmowac co najmniej 3 elementy"
     exit -1
   fi
   
   re='^[+-]?[0-9]+([.][0-9]+)?$'

   if ! [[ $# =~ $re ]]; then
     echo "Argumenty funckji musza byc liczbami rzeczywistymi"
     exit -1
   fi
     

   values=("$@")

   integral=0

   
   for ((i=1;i<${#values[@]};i++)); do
    dt=$(echo "scale=10; $i - $(($i - 1))" | bc)
    trap_area=$(echo "scale=10; (${values[$i]} + ${values[$i - 1]}) * $dt / 2" | bc)
    integral=$(echo "scale=10; ($integral + $trap_area)" | bc)
   done

   

   echo "Wynik calkowania numerycznego:" "$integral"

}

calka $@