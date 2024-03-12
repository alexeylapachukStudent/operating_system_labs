#!/bin/bash 

function rozdzielenie_plikow {
  source_file=$1
  output_1=$2
  output_2=$3

  if [ ! -r "$source_file" ]; then 
    echo "Nie masz uprawnien do odczytania pliku zrodlowego"
    exit -1
  fi

  if [ ! -e "$output_2" ] && [ !-e "$output_1" ]; then
    echo "Pliki nie istnieja, juz tworze je" 
    touch "$output_1" "$output_2"
  elif [ ! -w "$output_2" ] && [ !-w "$output_1" ]; then
    echo "Nie masz uprawnien do zapisywania danych do plikow"
    exit -1
  else
    > "$output_1"
    > "$output_2"
  fi

  while IFS= read -r line; do #Odczytywanie kazdej linii wejsciowej
   random=$((RANDOM % 2)) #Generowanie liczby losowej (0 lub 1)
    if [ $random -eq 0 ]; then #przydzielenie do jakiego z dwoch plikow trafi linia
      echo $line >> "$output_1"
    else
      echo $line >> "$output_2"
    fi
   done < "$source_file" #czytanie poszczegolnej linii kodu
  

}

#rozdzielenie_plikow $1 $2 $3


function rozdzielenie_katalogow {
  directories=$1
  directory_file=$2

  if [ ! -d "$directories" ]; then
    echo "Podana sciezka nie wskazuje na katalog"
    exit -1
  fi

  if [ ! -w "$directories" ]; then
    echo "Nie masz uprawnien do zapisywania danych"
    exit -1
  fi


  if [ ! -r "$directory_file" ]; then
    echo "Nie masz uprawnien do odczytywania wskazanego pliku"
    exit -1
  fi   


  while IFS= read -r line; do
    mkdir -p "$directories/$line"
  done < "$directory_file"

}

rozdzielenie_katalogow $1 $2

