#!/bin/sh
# recupera dir recuperati titolo
#CONTROLLO ARGOMENTI
if test $# -lt 3
then
    echo "Utilizzo: $1 <dir> <recuperati> <titolo>"
    exit 1
fi

case $1 in
    /*) ;;
    *)  echo "$1 deve essere una directory assoluta"
        exit 2 ;;
esac

if test ! -d $1 -o -x $1
then
    echo "$1 non esiste o non si hanno i permessi di esecuzione"
    exit 3
fi

case $2 in
    /*) ;;
    *)  echo "$2 deve essere una directory assoluta"
        exit 2 ;;
esac

#"VARIABILI GLOBALI"
export PATH=$PATH:$(pwd)
export MAX_COUNTER=/tmp/.max_counter.tmp
export MAX_DIR=/tmp/.max_dir.tmp
export TITOLO=$3


> $MAX_DIR
echo 0> $MAX_COUNTER

if test ! -d $2
then
    mkdir $2
fi

export RECUPERATI=$2

#Ricorsione
cerca_ct.sh $1

#CONCLUSIONE
echo "La diretory con maggior numero di file trovati è $(cat $MAX_DIR) con $(cat $MAX_COUNTER) file"

rm -f $MAX_COUNTER
rm -f $MAX_DIR
