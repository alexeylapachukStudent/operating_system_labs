#!/bin/bash

function statystyka_wyrazow {
   source_file=$1
   destination_file=$2

   if [ ! -e $source_file ]; then
     echo "Dany plik zrodlowy nie istneje"
     exit -1
   elif [ ! -r $source_file ]; then
     echo "Nie masz uprawnien do odczytu tego pliku"
     exit -1
   fi
   
    if [ -e $destination_file ]; then
      if [ ! -w $destination_file ]; then
        echo "Nie masz uprawnien do zapisywania tego pliku"
        exit -1
      fi
    else
      if ! touch $destination_file; then 
        echo "Nie mozesz utworzyc tego pliku"
        exit -1
      else
        touch $destination_file
        echo "$destination_file zostal utworzony"
      fi
    fi

    declare -A stat_array

    while IFS= read -r line; do
      cleaned_line=$(echo $line | tr -d '[:blank:]')
      
      read -r words <<< $cleaned_line

      for word in ${words[@]}; do
        if [ -n "$word" ]; then
          ((stat_array[$word]++))
        fi
      done
    done < "$source_file"

    for key in "${!stat_array[@]}"; do
      echo "Wartosc: $key || Ilosc wystapien: ${stat_array[$key]}"
    done | sort -rn -k2 > "$destination_file"
      

}


statystyka_wyrazow $1 $2
