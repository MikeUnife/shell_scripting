#!/bin/bash

if test $# -lt 2
then
    echo "Uso: contarricorrenze <file> <stringhe...>"
    exit 1
fi

#elimino il primo arg dalla lista
file=$1
shift


if test ! -f "$file"
then 
    echo "Errore: il primo arg deve essere un file"
    exit 2
fi


for i in $*
do
    count=$( grep "$i" "$file"| wc -l ) 
    echo "Parametro: $i -Ricorrenze: $count"
done
