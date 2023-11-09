#!/bin/sh

if $# -lt 3
then
    echo "Utilizzo: copylines <nome_dir_assoluto> <stringa> <nomefileN...>"
    exit 1
fi

case $1 in
    /*) ;;
    *) echo "La directory indicata non è una directory assoluta"
    exit 2 ;;
esac

if test -d $1
then
    echo "La directory indicata non esiste"
    exit 3
fi

dir=$1
stringa=$2

shif
shift

for i in $*
do
    case $i in 
    *[!a-z]*) echo "Errore: i file indicati devono contenere solo lettere minuscoli"
              exit 4 ;;
    *) ;;
    esac
done  

PATH=$PATH:$(pwd)
export PATH
#export stringa

echo "0" > /tmp/.counter.tmp
> /tmp/.linesStringa.tmp

cercaStringa.sh $dir $stringa $*

if test $(expr $(cat /tmp/.counter.tmp) + 0) -gt 0
then
echo "Sono stati spostati $(cat /tmp/.counter.tmp) file"
    cat /tmp/.linesStringa.tmp
else
    echo "Nessun file trovato che corrisponde alle richieste. Attendo un'ora..."
    sleep 1h
    rm -f /tmp/.counter.tmp
    rm -f /tmp/.linesStringa.tmp
    copylines.sh $dir $stringa $*
fi

rm -f /tmp/.counter.tmp
rm -f /tmp/.linesStringa.tmp
