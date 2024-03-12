
#!/bin/bash

if [[ "$#" -ne 1 ]]; then
    echo "Blad. Skrypt wymaga tylko jednego argumentu"
    exit 1
fi

#Z1
mkdir -p "$1"

if [[ $? -ne 0 ]]; then 
    echo "Blad"
    exit 1
fi
#Z2
cd $1 

#Z3
mkdir -p dir1/dir1.1 dir2/dir2.1 dir3/dir3.1 dir3/dir3.2 
touch dir1/text1.txt dir2/dir2.1/file1.csv dir3/dir3.2/file2.csv

mkdir -p Aa Bb Cc

#Z4
mv dir1/text1.txt dir1/dir1.1
#Z5
cp dir2/dir2.1/file1.csv dir1
#Z6
mv Aa Aa1

#Z7
echo "Katalogi konczace sie cyfra 1/2"
ls -d *[12]

#Z8
echo "Rozmiary katalogow na pierwszym poziomie"
du -h --max-depth=1