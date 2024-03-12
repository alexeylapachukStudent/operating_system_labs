#!/bin/bash

#Z1

echo "Zadanie 1:"

grep -oP '((?<=\s|^)(?<![+-])\b0x[a-fA-F0-9]+(\s[a-fA-F0-9]+)*)' $1

#Z2

echo "Zadanie 2:"

grep -oP '((?<=\s|^)[a-zA-Z0-9\.\,\;\:]+@[a-zA-Z0-9\.\-]+\.[a-zA-Z0-9]{2,}(?=\s|$))' $1

#Z3

echo "Zadanie 3:"

grep -oP '((?<=\s|^)[+-]?(?:[0-9]*\.[0-9]+|[0-9]+\.[0-9]*)(?!\S))' $1 
