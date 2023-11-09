#!/bin/sh

#CONTROLLO ARGOMENTI
#numero args
if test $# -ne 3
then 
    echo "Utilizzo: cercaFile <stringa> <dir> <num>"
    exit 1
fi

stringa=$1
dir=$2
num=$3

#dir assoluta
case $dir in
    /*) ;;
    *)
    echo "Errore: il secondo argomento non è una directory assoluta"
    exit 2 ;;
esac

#controllo dir

#controllo num

#CHIAMATA A cercaStringa
#export del pth
PATH=$PATH:$(pwd)
export PATH

#creo i file temporanei
> /tmp/.max_counter.tmp
> /tmp/.nome_dir.tmp

#chiamo cercaStringa
cercaStringa.sh $stringa $dir $num

#CONCLUSIONI
#stampo la max_dir
echo "la directory con il maggior numero di $stringa: $(cat /tmp/.nome_dir.tmp) con $(wc -l < /tmp/.max_counter.tmp) ricorrenze"
#cancello i file temporanei
rm -f /tmp/.max_counter.tmp
rm -f /tmp/.nome_dir.tmp