#!/bin/sh

#CONTROLLO ARGOMENTI
if test $# -ne 2
then
    echo "Utilizzo: $0 <dir> <header>"
    exit 1
fi

case $1 in
    /*) ;;
    *)  echo "$1 deve essere una directory con path assoluto"
        exit 2
esac

if test ! -d $1 -o ! -x $1 
then
    echo "$1 non esiste o non si hanno i permessi di accesso"
    exit 3
fi

#"VARIABILI GLOBALI"

export PATH=$PATH:$(pwd)
export MISURE=$HOME/misure.txt
export HEADER=$2

if test ! -e $MISURE
then
    > $MISURE
fi

export MAX_COUNTER=/tmp/max_counter.tmp
export MAX_DIR=/tmp/max_dir.tmp

> $MAX_DIR
echo 0> $MAX_COUNTER

#ricorsione
cerca_cm.sh $1

#CONCLUSIONI
if test $(cat $MAX_COUNTER) -gt 0
then
    echo "La directory con più elementi trovati: $(cat $MAX_DIR)"
    echo "Elementi: $(cat $MAX_COUNTER)"
else    
    echo "Nessun file trovato"
fi

rm -f $MAX_COUNTER
rm -f $MAX_DIR




